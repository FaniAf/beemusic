import 'package:beemusic/app/views/main_menu/home/tab/home/widget/discover.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/widget/tophits.dart';
import 'package:beemusic/app/views/main_menu/home/tab/song/widget/song.dart';
import 'package:flutter/material.dart';

class SongTabScreen extends StatelessWidget {
  const SongTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SongScreen(),
      ],
    );
  }
}
