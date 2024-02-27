import 'package:beemusic/app/audio/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

bool? isAudioPlaying = false;
ValueNotifier<String> currentTrackTitle =
    ValueNotifier<String>("No Track Playing");
ValueNotifier<String> currentTrackArtist = ValueNotifier<String>("No Artist");

ValueNotifier<Uri?> currentTrackImageUri = ValueNotifier<Uri?>(null);
ValueNotifier<bool> isAudioPlayingNotifier =
    ValueNotifier<bool>(isAudioPlaying!);
ValueNotifier<Duration> currentTrackPosition =
    ValueNotifier<Duration>(Duration.zero);
ValueNotifier<Duration?> currentTrackDuration = ValueNotifier<Duration?>(null);

void getCurrentTrackTitle() {
  if (isAudioPlayingNotifier.value && audioPlayerService.audioSource != null) {
    final audioSource = audioPlayerService.audioSource!;
    if (audioSource is ConcatenatingAudioSource) {
      final currentIndex = audioPlayerService.currentIndex;
      if (currentIndex != null) {
        final MediaItem mediaItem = audioSource.sequence[currentIndex].tag;
        print("mediaItem.playable ${mediaItem.playable}");
        print(mediaItem);

        // Memperbarui nilai currentTrackTitle
        currentTrackTitle.value = mediaItem.title;

        print(" disidnisdni");
        return;
      }
    } else if (audioSource is UriAudioSource) {
      // Memperbarui nilai currentTrackTitle
      currentTrackTitle.value = audioSource.tag ?? "Unknown Track";
      return;
    }
  }

  // Jika tidak ada trek yang sedang diputar
  currentTrackTitle.value = "No Track Playing";
}

void getCurrentTrackArtist() {
  if (isAudioPlayingNotifier.value && audioPlayerService.audioSource != null) {
    final audioSource = audioPlayerService.audioSource!;
    if (audioSource is ConcatenatingAudioSource) {
      final currentIndex = audioPlayerService.currentIndex;
      if (currentIndex != null) {
        final MediaItem mediaItem = audioSource.sequence[currentIndex].tag;
        print("mediaItem.playable ${mediaItem.playable}");
        print(mediaItem);

        // Memperbarui nilai currentTrackTitle
        currentTrackArtist.value = mediaItem.artist!;

        print(" disidnisdni");
        return;
      }
    } else if (audioSource is UriAudioSource) {
      // Memperbarui nilai currentTrackArtist
      currentTrackArtist.value = audioSource.tag ?? "Unknown Artist";
      return;
    }
  }

  // Jika tidak ada trek yang sedang diputar
  currentTrackTitle.value = "No Track Playing";
}

void getCurrentTrackImageUri() {
  if (isAudioPlayingNotifier.value && audioPlayerService.audioSource != null) {
    final audioSource = audioPlayerService.audioSource!;
    if (audioSource is ConcatenatingAudioSource) {
      final currentIndex = audioPlayerService.currentIndex;
      if (currentIndex != null &&
          currentIndex >= 0 &&
          currentIndex < audioSource.sequence.length) {
        final MediaItem mediaItem = audioSource.sequence[currentIndex].tag;
        if (mediaItem.artUri != null) {
          currentTrackImageUri.value = Uri.parse(mediaItem.artUri.toString());
        }
      }
    } else if (audioSource is UriAudioSource) {
      if (audioSource.tag is Uri) {
        currentTrackImageUri.value = audioSource.tag as Uri;
      } else {
        currentTrackImageUri.value =
            null; // Handle the case when tag is not a URI.
      }
    }
  } else {
    currentTrackImageUri.value =
        null; // Handle the case when no track is playing.
  }
}

void initAudioPlayer() {
  audioPlayerService.positionStream.listen((position) {
    currentTrackPosition.value = position;
  });

  audioPlayerService.durationStream.listen((duration) {
    currentTrackDuration.value = duration;
  });
  audioPlayerService.playingStream.listen((playerState) {
    print("playerState $playerState");
    if (playerState) {
      getCurrentTrackTitle();
      getCurrentTrackImageUri();
      isAudioPlayingNotifier.value = true;
    } else {
      isAudioPlayingNotifier.value = false;
    }
  });
}
