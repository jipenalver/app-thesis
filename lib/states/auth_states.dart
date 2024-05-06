import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msit_thesis/views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthStates {
  void loginFacebook(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final LoginResult result = await FacebookAuth.i
        .login(permissions: ['public_profile', 'email', 'user_posts']);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final userData = await FacebookAuth.i.getUserData(
        fields: "id,name,email,picture,posts",
      );

      await prefs.setString('token', accessToken.token);
      await prefs.setString('name', userData['name']);
      await prefs.setString('email', userData['email']);
      await prefs.setString('id', userData['id']);
      await prefs.setString('profile', userData['picture']['data']['url']);

      // ignore: unused_local_variable
      final Map<String, dynamic> userPosts = userData['posts']['data'];

      // Navigator.push(
      //     // ignore: use_build_context_synchronously
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const DashboardPage(
      //               title: 'SIAM',
      //             )));
    } else {
      if (kDebugMode) {
        print(result.status);
        print(result.message);
      }
    }
  }

  Future<bool> isLoggedFacebook() async {
    final AccessToken? accessToken = await FacebookAuth.i.accessToken;

    if (accessToken != null) return true;

    return false;
  }

  void logoutFacebook() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    await FacebookAuth.instance.logOut();
  }
}
