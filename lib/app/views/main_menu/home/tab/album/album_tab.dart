import 'package:beemusic/app/views/main_menu/home/tab/album/widget/album_screen.dart';
import 'package:flutter/material.dart';

class AlbumTabScreen extends StatelessWidget {
  const AlbumTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AlbumScreen(),
      ],
    );
  }
}
