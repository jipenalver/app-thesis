import 'package:flutter/material.dart';

final appBars = [
  AppBar(
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
  AppBar(
    title: const Text('News Feed'),
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
  AppBar(
    title: const Text('Profile'),
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications_active),
        onPressed: () {},
      )
    ],
  ),
];
