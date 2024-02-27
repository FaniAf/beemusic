// To parse this JSON data, do
//
//     final musicTitleModel = musicTitleModelFromJson(jsonString);

import 'dart:convert';

MusicTitleModel musicTitleModelFromJson(String str) =>
    MusicTitleModel.fromJson(json.decode(str));

String musicTitleModelToJson(MusicTitleModel data) =>
    json.encode(data.toJson());

class MusicTitleModel {
  String id;
  String title;
  String album;
  String artist;
  String genre;
  String duration;
  String artUri;
  bool playable;
  dynamic displayTitle;
  dynamic displaySubtitle;
  dynamic displayDescription;
  dynamic rating;
  dynamic extras;

  MusicTitleModel({
    required this.id,
    required this.title,
    required this.album,
    required this.artist,
    required this.genre,
    required this.duration,
    required this.artUri,
    required this.playable,
    required this.displayTitle,
    required this.displaySubtitle,
    required this.displayDescription,
    required this.rating,
    required this.extras,
  });

  factory MusicTitleModel.fromJson(Map<String, dynamic> json) =>
      MusicTitleModel(
        id: json["id"],
        title: json["title"],
        album: json["album"],
        artist: json["artist"],
        genre: json["genre"],
        duration: json["duration"],
        artUri: json["artUri"],
        playable: json["playable"],
        displayTitle: json["displayTitle"],
        displaySubtitle: json["displaySubtitle"],
        displayDescription: json["displayDescription"],
        rating: json["rating"],
        extras: json["extras"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "album": album,
        "artist": artist,
        "genre": genre,
        "duration": duration,
        "artUri": artUri,
        "playable": playable,
        "displayTitle": displayTitle,
        "displaySubtitle": displaySubtitle,
        "displayDescription": displayDescription,
        "rating": rating,
        "extras": extras,
      };
}
