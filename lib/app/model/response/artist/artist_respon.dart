// To parse this JSON data, do
//
//     final artistResponModel = artistResponModelFromJson(jsonString);

import 'dart:convert';

ArtistResponModel artistResponModelFromJson(String str) =>
    ArtistResponModel.fromJson(json.decode(str));

String artistResponModelToJson(ArtistResponModel data) =>
    json.encode(data.toJson());

class ArtistResponModel {
  String status;
  List<Artist> artist;

  ArtistResponModel({
    required this.status,
    required this.artist,
  });

  factory ArtistResponModel.fromJson(Map<String, dynamic> json) =>
      ArtistResponModel(
        status: json["status"],
        artist: List<Artist>.from(json["data"].map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(artist.map((x) => x.toJson())),
      };
}

class Artist {
  int id;
  String nama;
  String urlPhoto;

  Artist({
    required this.id,
    required this.nama,
    required this.urlPhoto,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        nama: json["nama"],
        urlPhoto: json["url_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url_photo": urlPhoto,
      };
}
