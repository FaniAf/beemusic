import 'package:beemusic/app/views/main_menu/home/tab/artist/widget/artist_screen.dart';
import 'package:flutter/material.dart';

class ArtistTabScreen extends StatelessWidget {
  const ArtistTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ArtistScreen(),
      ],
    );
  }
}
