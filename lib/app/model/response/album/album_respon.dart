// To parse this JSON data, do
//
//     final albumResponModel = albumResponModelFromJson(jsonString);

import 'dart:convert';

AlbumResponModel albumResponModelFromJson(String str) =>
    AlbumResponModel.fromJson(json.decode(str));

String albumResponModelToJson(AlbumResponModel data) =>
    json.encode(data.toJson());

class AlbumResponModel {
  String status;
  List<Album> album;

  AlbumResponModel({
    required this.status,
    required this.album,
  });

  factory AlbumResponModel.fromJson(Map<String, dynamic> json) =>
      AlbumResponModel(
        status: json["status"],
        album: List<Album>.from(json["data"].map((x) => Album.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(album.map((x) => x.toJson())),
      };
}

class Album {
  int id;
  String judul;
  String artis;
  DateTime rilis;
  String cover;

  Album({
    required this.id,
    required this.judul,
    required this.artis,
    required this.rilis,
    required this.cover,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        judul: json["judul"],
        artis: json["artis"],
        rilis: DateTime.parse(json["rilis"]),
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "artis": artis,
        "rilis":
            "${rilis.year.toString().padLeft(4, '0')}-${rilis.month.toString().padLeft(2, '0')}-${rilis.day.toString().padLeft(2, '0')}",
        "cover": cover,
      };
}
