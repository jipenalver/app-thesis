import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignupState {
  void loginFacebook() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final LoginResult result = await FacebookAuth.i
        .login(permissions: ['public_profile', 'email', 'user_posts']);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      await prefs.setString('token', accessToken.token);

      // final String? token = prefs.getString('token');
      // await prefs.remove('token');
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
    await FacebookAuth.instance.logOut();
  }
}
