import 'package:flutter/material.dart';
import 'package:msit_thesis/views/login.dart';
import 'package:msit_thesis/views/dashboard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:msit_thesis/states/signup_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() async {
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "1345013539767157",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var signupState = SignupState();

  // @override
  // void initState() {
  //   super.initState();
  //   signupState.isLoggedFacebook();
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SIAM',
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: Colors.green.shade300,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const DashboardPage(title: 'SIAM'),
    );
  }
}
