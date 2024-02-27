import 'package:beemusic/app/views/main_menu/home/tab/home/widget/discover.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/widget/tophits.dart';
import 'package:flutter/material.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: const Text(
            'Welcome to,',
            style: TextStyle(
              fontSize: 24,

              color: Colors.white, // Sesuaikan dengan tema warna aplikasi Anda
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Beemusic!',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Sesuaikan dengan tema warna aplikasi Anda
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const DiscoverScreen(),
        const TopHitsScreen(),
      ],
    );
  }
}
