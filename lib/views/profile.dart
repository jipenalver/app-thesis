import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:msit_thesis/model/user.dart';
import 'package:msit_thesis/views/login.dart';
import 'package:msit_thesis/states/auth_states.dart';
import 'package:msit_thesis/widget/profile_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var authState = AuthStates();

  late SharedPreferences prefs;
  var user =
      const UserData(image: '', name: '', email: '', id: '', isDarkMode: false);

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson == null) return;

    final user = UserData.fromJson(json.decode(userJson));
    setState(() => this.user = user);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(imagePath: user.image, onClicked: () async {}),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 48,
          ),
          buildAbout(user),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: buildLogoutButton(),
          )
        ],
      ),
    );
  }

  Widget buildName(UserData user) {
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
        Text(user.email),
      ],
    );
  }

  Widget buildAbout(UserData user) {
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
          user.id,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ]),
    );
  }

  Widget buildLogoutButton() {
    return ElevatedButton.icon(
        icon: const Icon(Icons.logout),
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            textStyle:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            shape:
                const BeveledRectangleBorder(borderRadius: BorderRadius.zero)),
        onPressed: () {
          authState.logoutFacebook();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginPage(
                        title: 'SIAM',
                      )));
        },
        label: const Text(
          'Logout',
          textAlign: TextAlign.center,
        ));
  }
}
