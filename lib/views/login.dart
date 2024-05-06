import 'package:flutter/material.dart';
import 'package:msit_thesis/states/auth_states.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var authState = AuthStates();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [Colors.white70, Colors.green])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(
                  height: 550,
                  width: 300,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.carsu.edu.ph/sites/default/files/CSU%20Official%20Seal_1216%20x%202009.png",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  // Image(
                  //     image: NetworkImage(
                  //         'https://www.carsu.edu.ph/sites/default/files/CSU%20Official%20Seal_1216%20x%202009.png'),
                  //     fit: BoxFit.cover),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                  child: ElevatedButton.icon(
                      icon: const Icon(Icons.facebook_outlined),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          textStyle: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      onPressed: () => authState.loginFacebook(context),
                      label: const Text(
                        'Login with Facebook',
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
