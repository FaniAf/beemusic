import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int? _currentlyPlayingMediaID;

  int? get currentlyPlayingMediaID => _currentlyPlayingMediaID;

  void setCurrentlyPlayingMediaID(int? mediaID) {
    _currentlyPlayingMediaID = mediaID!;
    notifyListeners();
  }

  bool _isMediaPlaying = false;

  bool get isMediaPlaying => _isMediaPlaying;

  void setMediaPlaying(bool isPlaying) {
    _isMediaPlaying = isPlaying;
    notifyListeners();
  }
}
