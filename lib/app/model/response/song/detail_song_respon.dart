// To parse this JSON data, do
//
//     final detailSongResponModel = detailSongResponModelFromJson(jsonString);

import 'dart:convert';

DetailSongResponModel detailSongResponModelFromJson(String str) =>
    DetailSongResponModel.fromJson(json.decode(str));

String detailSongResponModelToJson(DetailSongResponModel data) =>
    json.encode(data.toJson());

class DetailSongResponModel {
  String status;
  List<DetailSong> detailSong;

  DetailSongResponModel({
    required this.status,
    required this.detailSong,
  });

  factory DetailSongResponModel.fromJson(Map<String, dynamic> json) =>
      DetailSongResponModel(
        status: json["status"],
        detailSong: List<DetailSong>.from(
            json["data"].map((x) => DetailSong.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(detailSong.map((x) => x.toJson())),
      };
}

class DetailSong {
  int id;
  String judul;
  String artis;
  String url;

  DetailSong({
    required this.id,
    required this.judul,
    required this.artis,
    required this.url,
  });

  factory DetailSong.fromJson(Map<String, dynamic> json) => DetailSong(
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
