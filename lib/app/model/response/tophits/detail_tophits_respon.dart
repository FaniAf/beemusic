// To parse this JSON data, do
//
//     final detailTopHitsResponModel = detailTopHitsResponModelFromJson(jsonString);

import 'dart:convert';

DetailTopHitsResponModel detailTopHitsResponModelFromJson(String str) =>
    DetailTopHitsResponModel.fromJson(json.decode(str));

String detailTopHitsResponModelToJson(DetailTopHitsResponModel data) =>
    json.encode(data.toJson());

class DetailTopHitsResponModel {
  String status;
  List<DetailTopHits> detailTopHits;

  DetailTopHitsResponModel({
    required this.status,
    required this.detailTopHits,
  });

  factory DetailTopHitsResponModel.fromJson(Map<String, dynamic> json) =>
      DetailTopHitsResponModel(
        status: json["status"],
        detailTopHits: List<DetailTopHits>.from(
            json["data"].map((x) => DetailTopHits.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(detailTopHits.map((x) => x.toJson())),
      };
}

class DetailTopHits {
  int id;
  String judul;
  String artis;
  String lagu;
  String url;

  DetailTopHits({
    required this.id,
    required this.judul,
    required this.artis,
    required this.lagu,
    required this.url,
  });

  factory DetailTopHits.fromJson(Map<String, dynamic> json) => DetailTopHits(
        id: json["id"],
        judul: json["judul"],
        artis: json["artis"],
        lagu: json["lagu"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "artis": artis,
        "lagu": lagu,
        "url": url,
      };
}
