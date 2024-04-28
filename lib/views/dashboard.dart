import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msit_thesis/states/signup_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var signupState = SignupState();

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
                const SizedBox(
                  height: 550,
                  width: 300,
                  child:
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       "https://www.carsu.edu.ph/sites/default/files/CSU%20Official%20Seal_1216%20x%202009.png",
                      //   progressIndicatorBuilder:
                      //       (context, url, downloadProgress) =>
                      //           CircularProgressIndicator(
                      //               value: downloadProgress.progress),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      // ),
                      Image(
                          image: NetworkImage(
                              'https://www.carsu.edu.ph/sites/default/files/CSU%20Official%20Seal_1216%20x%202009.png'),
                          fit: BoxFit.cover),
                ),
              ],
            ),
          )),
    );
  }
}
