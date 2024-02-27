// To parse this JSON data, do
//
//     final genreResponModel = genreResponModelFromJson(jsonString);

import 'dart:convert';

GenreResponModel genreResponModelFromJson(String str) =>
    GenreResponModel.fromJson(json.decode(str));

String genreResponModelToJson(GenreResponModel data) =>
    json.encode(data.toJson());

class GenreResponModel {
  String status;
  List<Genre> genre;

  GenreResponModel({
    required this.status,
    required this.genre,
  });

  factory GenreResponModel.fromJson(Map<String, dynamic> json) =>
      GenreResponModel(
        status: json["status"],
        genre: List<Genre>.from(json["data"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(genre.map((x) => x.toJson())),
      };
}

class Genre {
  int id;
  String nama;

  Genre({
    required this.id,
    required this.nama,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
