import 'package:flutter/material.dart';
import 'package:msit_thesis/model/user.dart';
import 'package:msit_thesis/widget/profile_widget.dart';
import 'package:msit_thesis/utils/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 48,
          ),
          buildAbout(user)
        ],
      ),
    );
  }

  Widget buildName(User user) {
    return Column(
      children: [
        Text(user.name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        const SizedBox(
          height: 4,
        ),
        Text(user.email, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  buildAbout(User user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          user.about,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ]),
    );
  }
}
