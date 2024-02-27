// To parse this JSON data, do
//
//     final detailDiscoverResponModel = detailDiscoverResponModelFromJson(jsonString);

import 'dart:convert';

import 'package:beemusic/app/model/response/artist/detail_artist_respon.dart';

DetailDiscoverResponModel detailDiscoverResponModelFromJson(String str) =>
    DetailDiscoverResponModel.fromJson(json.decode(str));

String detailDiscoverResponModelToJson(DetailDiscoverResponModel data) =>
    json.encode(data.toJson());

class DetailDiscoverResponModel {
  String status;
  List<DetailDiscover> detailDiscover;

  DetailDiscoverResponModel({
    required this.status,
    required this.detailDiscover,
  });

  factory DetailDiscoverResponModel.fromJson(Map<String, dynamic> json) =>
      DetailDiscoverResponModel(
        status: json["status"],
        detailDiscover: List<DetailDiscover>.from(
            json["data"].map((x) => DetailDiscover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(detailDiscover.map((x) => x.toJson())),
      };
}

class DetailDiscover {
  int id;
  String judul;
  String artis;
  DateTime rilis;
  String cover;
  List<Lagu> lagu;

  DetailDiscover({
    required this.id,
    required this.judul,
    required this.artis,
    required this.rilis,
    required this.cover,
    required this.lagu,
  });

  factory DetailDiscover.fromJson(Map<String, dynamic> json) => DetailDiscover(
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
