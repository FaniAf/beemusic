// To parse this JSON data, do
//
//     final detailArtistResponModel = detailArtistResponModelFromJson(jsonString);

import 'dart:convert';

DetailArtistResponModel detailArtistResponModelFromJson(String str) =>
    DetailArtistResponModel.fromJson(json.decode(str));

String detailArtistResponModelToJson(DetailArtistResponModel data) =>
    json.encode(data.toJson());

class DetailArtistResponModel {
  String status;
  List<DetailArtist> detailArtist;

  DetailArtistResponModel({
    required this.status,
    required this.detailArtist,
  });

  factory DetailArtistResponModel.fromJson(Map<String, dynamic> json) =>
      DetailArtistResponModel(
        status: json["status"],
        detailArtist: List<DetailArtist>.from(
            json["data"].map((x) => DetailArtist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(detailArtist.map((x) => x.toJson())),
      };
}

class DetailArtist {
  int id;
  String nama;
  String urlPhoto;
  List<Album> album;
  List<Lagu> lagu;

  DetailArtist({
    required this.id,
    required this.nama,
    required this.urlPhoto,
    required this.album,
    required this.lagu,
  });

  factory DetailArtist.fromJson(Map<String, dynamic> json) => DetailArtist(
        id: json["id"],
        nama: json["nama"],
        urlPhoto: json["url_photo"],
        album: List<Album>.from(json["album"].map((x) => Album.fromJson(x))),
        lagu: List<Lagu>.from(json["lagu"].map((x) => Lagu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url_photo": urlPhoto,
        "album": List<dynamic>.from(album.map((x) => x.toJson())),
        "lagu": List<dynamic>.from(lagu.map((x) => x.toJson())),
      };
}

class Album {
  int id;
  String judul;

  Album({
    required this.id,
    required this.judul,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        judul: json["judul"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
      };
}

class Lagu {
  int id;
  String judul;
  String url;

  Lagu({
    required this.id,
    required this.judul,
    required this.url,
  });

  factory Lagu.fromJson(Map<String, dynamic> json) => Lagu(
        id: json["id"],
        judul: json["judul"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "url": url,
      };
}
