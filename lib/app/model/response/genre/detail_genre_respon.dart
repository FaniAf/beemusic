// To parse this JSON data, do
//
//     final detailGenreResponModel = detailGenreResponModelFromJson(jsonString);

import 'dart:convert';

DetailGenreResponModel detailGenreResponModelFromJson(String str) =>
    DetailGenreResponModel.fromJson(json.decode(str));

String detailGenreResponModelToJson(DetailGenreResponModel data) =>
    json.encode(data.toJson());

class DetailGenreResponModel {
  String status;
  List<DetailGenre> detailGenre;

  DetailGenreResponModel({
    required this.status,
    required this.detailGenre,
  });

  factory DetailGenreResponModel.fromJson(Map<String, dynamic> json) =>
      DetailGenreResponModel(
        status: json["status"],
        detailGenre: List<DetailGenre>.from(
            json["data"].map((x) => DetailGenre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(detailGenre.map((x) => x.toJson())),
      };
}

class DetailGenre {
  int id;
  String nama;
  List<Lagu> lagu;

  DetailGenre({
    required this.id,
    required this.nama,
    required this.lagu,
  });

  factory DetailGenre.fromJson(Map<String, dynamic> json) => DetailGenre(
        id: json["id"],
        nama: json["nama"],
        lagu: List<Lagu>.from(json["lagu"].map((x) => Lagu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "lagu": List<dynamic>.from(lagu.map((x) => x.toJson())),
      };
}

class Lagu {
  int id;
  String judul;
  String artis;
  String album;
  String url;

  Lagu({
    required this.id,
    required this.judul,
    required this.artis,
    required this.album,
    required this.url,
  });

  factory Lagu.fromJson(Map<String, dynamic> json) => Lagu(
        id: json["id"],
        judul: json["judul"],
        artis: json["artis"],
        album: json["album"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "artis": artis,
        "album": album,
        "url": url,
      };
}
