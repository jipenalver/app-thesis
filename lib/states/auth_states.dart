import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:msit_thesis/model/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthStates {
  void loginFacebook() async {
    final supabase = Supabase.instance.client;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final LoginResult result = await FacebookAuth.i
        .login(permissions: ['public_profile', 'email', 'user_posts']);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final userData = await FacebookAuth.i.getUserData(
        fields: "id,name,email,picture.width(800).height(800),posts",
      );

      await prefs.setString('token', accessToken.token);

      final user = UserData(
          image: userData['picture']['data']['url'],
          name: userData['name'],
          email: userData['email'],
          id: userData['id'],
          isDarkMode: false);

      final userJson = json.encode(user.toJson());
      await prefs.setString('user', userJson);

      final Map<String, dynamic> userPosts = userData['posts']['data'];

      final data = await supabase
          .from('students')
          .select('id')
          .eq('email', userData['email']);

      if (data.isEmpty) {
        final List<Map<String, dynamic>> studentData =
            await supabase.from('students').insert({
          'email': userData['email'],
          'name': userData['name'],
          'facebook_id': userData['id'],
          'img_url': userData['picture']['data']['url']
        }).select();

        final List<Map<String, dynamic>> userPostsList = [];

        userPosts.forEach((key, value) {
          userPostsList.add({
            'student_id': studentData.first['id'],
            'message': value['message'],
            'post_id': value['id'],
            'created_time': value['created_time'],
          });
        });

        await supabase.from('student_posts').insert(userPostsList);
      }
    } else {
      if (kDebugMode) {
        print(result.status);
        print(result.message);
      }
    }
  }

  void logoutFacebook() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    await prefs.remove('user');
    await FacebookAuth.instance.logOut();
  }
}
