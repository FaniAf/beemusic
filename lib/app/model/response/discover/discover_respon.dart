// To parse this JSON data, do
//
//     final discoverResponModel = discoverResponModelFromJson(jsonString);

import 'dart:convert';

DiscoverResponModel discoverResponModelFromJson(String str) =>
    DiscoverResponModel.fromJson(json.decode(str));

String discoverResponModelToJson(DiscoverResponModel data) =>
    json.encode(data.toJson());

class DiscoverResponModel {
  String status;
  List<Discover> discover;

  DiscoverResponModel({
    required this.status,
    required this.discover,
  });

  factory DiscoverResponModel.fromJson(Map<String, dynamic> json) =>
      DiscoverResponModel(
        status: json["status"],
        discover:
            List<Discover>.from(json["data"].map((x) => Discover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(discover.map((x) => x.toJson())),
      };
}

class Discover {
  int id;
  String judul;
  String artis;
  DateTime rilis;
  String cover;

  Discover({
    required this.id,
    required this.judul,
    required this.artis,
    required this.rilis,
    required this.cover,
  });

  factory Discover.fromJson(Map<String, dynamic> json) => Discover(
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
