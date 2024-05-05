import 'package:flutter/material.dart';
import 'package:msit_thesis/states/signup_states.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var signupState = SignupState();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: const Column(
        children: [],
      ),
    );
  }
}
