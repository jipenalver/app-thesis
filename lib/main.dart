import 'package:flutter/material.dart';
import 'package:msit_thesis/views/login.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:msit_thesis/views/dashboard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:msit_thesis/states/auth_states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  if (kIsWeb) {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "1345013539767157",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  await Supabase.initialize(
    url: 'https://pdbpqmokapzhspblkhcc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBkYnBxbW9rYXB6aHNwYmxraGNjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAwMzg0MzcsImV4cCI6MjAxNTYxNDQzN30.1OFcHjOLHBufWF5Gr97mGte5T0nruqHsV0skWxhUDgg',
  );
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var authState = AuthStates();

  late SharedPreferences prefs;
  String token = '';

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) return;
    setState(() => this.token = token);
    // Fluttertoast.showToast(msg: this.token, fontSize: 18.sp);
  }

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
      child: token == ''
          ? const LoginPage(title: 'SIAM')
          : const DashboardPage(title: 'SIAM'),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();

  //   FlutterNativeSplash.remove();
  // }
}
