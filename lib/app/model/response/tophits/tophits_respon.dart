// To parse this JSON data, do
//
//     final topHitsResponModel = topHitsResponModelFromJson(jsonString);

import 'dart:convert';

TopHitsResponModel topHitsResponModelFromJson(String str) =>
    TopHitsResponModel.fromJson(json.decode(str));

String topHitsResponModelToJson(TopHitsResponModel data) =>
    json.encode(data.toJson());

class TopHitsResponModel {
  String status;
  List<TopHits> topHits;

  TopHitsResponModel({
    required this.status,
    required this.topHits,
  });

  factory TopHitsResponModel.fromJson(Map<String, dynamic> json) =>
      TopHitsResponModel(
        status: json["status"],
        topHits:
            List<TopHits>.from(json["data"].map((x) => TopHits.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(topHits.map((x) => x.toJson())),
      };
}

class TopHits {
  int id;
  String judul;
  String artis;
  String lagu;
  String url;

  TopHits({
    required this.id,
    required this.judul,
    required this.artis,
    required this.lagu,
    required this.url,
  });

  factory TopHits.fromJson(Map<String, dynamic> json) => TopHits(
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
