// To parse this JSON data, do
//
//     final detailAlbumResponModel = detailAlbumResponModelFromJson(jsonString);

import 'dart:convert';

import 'package:beemusic/app/model/response/artist/detail_artist_respon.dart';

DetailAlbumResponModel detailAlbumResponModelFromJson(String str) =>
    DetailAlbumResponModel.fromJson(json.decode(str));

String detailAlbumResponModelToJson(DetailAlbumResponModel data) =>
    json.encode(data.toJson());

class DetailAlbumResponModel {
  String status;
  List<DetailAlbumRespon> detailAlbum;

  DetailAlbumResponModel({
    required this.status,
    required this.detailAlbum,
  });

  factory DetailAlbumResponModel.fromJson(Map<String, dynamic> json) =>
      DetailAlbumResponModel(
        status: json["status"],
        detailAlbum: List<DetailAlbumRespon>.from(
            json["data"].map((x) => DetailAlbumRespon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(detailAlbum.map((x) => x.toJson())),
      };
}

class DetailAlbumRespon {
  int id;
  String judul;
  String artis;
  DateTime rilis;
  String cover;
  List<Lagu> lagu;

  DetailAlbumRespon({
    required this.id,
    required this.judul,
    required this.artis,
    required this.rilis,
    required this.cover,
    required this.lagu,
  });

  factory DetailAlbumRespon.fromJson(Map<String, dynamic> json) =>
      DetailAlbumRespon(
        id: json["id"],
        judul: json["judul"],
        artis: json["artis"],
        rilis: DateTime.parse(json["rilis"]),
        cover: json["cover"],
        lagu: List<Lagu>.from(json["lagu"].map((x) => Lagu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "artis": artis,
        "rilis":
            "${rilis.year.toString().padLeft(4, '0')}-${rilis.month.toString().padLeft(2, '0')}-${rilis.day.toString().padLeft(2, '0')}",
        "cover": cover,
        "lagu": List<dynamic>.from(lagu.map((x) => x.toJson())),
      };
}
