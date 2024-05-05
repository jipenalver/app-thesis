import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msit_thesis/states/signup_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var signupState = SignupState();

  int index = 0;

  final dummyPages = [
    Container(
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
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    ),
    Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: const Column(
        children: [],
      ),
    ),
    Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: const Column(
        children: [],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [Colors.white70, Colors.green])),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dummy App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: dummyPages[index],
        bottomNavigationBar: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.newspaper_outlined),
                selectedIcon: Icon(Icons.newspaper),
                label: 'News Feed'),
            NavigationDestination(
                icon: Icon(Icons.person_2_outlined),
                selectedIcon: Icon(Icons.person_2),
                label: 'Profile')
          ],
        ),
      ),
    );
  }
}
