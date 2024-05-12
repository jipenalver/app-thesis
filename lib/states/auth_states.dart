import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:msit_thesis/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthStates {
  void loginFacebook() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final LoginResult result = await FacebookAuth.i
        .login(permissions: ['public_profile', 'email', 'user_posts']);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final userData = await FacebookAuth.i.getUserData(
        fields: "id,name,email,picture.width(800).height(800),posts",
      );

      await prefs.setString('token', accessToken.token);

      final user = User(
          image: userData['picture']['data']['url'],
          name: userData['name'],
          email: userData['email'],
          id: userData['id'],
          isDarkMode: false);

      final userJson = json.encode(user.toJson());
      await prefs.setString('user', userJson);

      // ignore: unused_local_variable
      final Map<String, dynamic> userPosts = userData['posts']['data'];
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
