// To parse this JSON data, do
//
//     final songResponModel = songResponModelFromJson(jsonString);

import 'dart:convert';

SongResponModel songResponModelFromJson(String str) =>
    SongResponModel.fromJson(json.decode(str));

String songResponModelToJson(SongResponModel data) =>
    json.encode(data.toJson());

class SongResponModel {
  String status;
  List<Song> song;

  SongResponModel({
    required this.status,
    required this.song,
  });

  factory SongResponModel.fromJson(Map<String, dynamic> json) =>
      SongResponModel(
        status: json["status"],
        song: List<Song>.from(json["data"].map((x) => Song.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(song.map((x) => x.toJson())),
      };
}

class Song {
  int id;
  String judul;
  String artis;
  String url;

  Song({
    required this.id,
    required this.judul,
    required this.artis,
    required this.url,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        judul: json["judul"],
        artis: json["artis"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "artis": artis,
        "url": url,
      };
}
