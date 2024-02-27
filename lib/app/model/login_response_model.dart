// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String loginId;
  String loginPassword;
  String loginStatus;
  String loginMsg;
  DataUser dataUser;

  LoginModel({
    required this.loginId,
    required this.loginPassword,
    required this.loginStatus,
    required this.loginMsg,
    required this.dataUser,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        loginId: json["loginId"],
        loginPassword: json["loginPassword"],
        loginStatus: json["loginStatus"],
        loginMsg: json["loginMsg"],
        dataUser: DataUser.fromJson(json["dataUser"]),
      );

  Map<String, dynamic> toJson() => {
        "loginId": loginId,
        "loginPassword": loginPassword,
        "loginStatus": loginStatus,
        "loginMsg": loginMsg,
        "dataUser": dataUser.toJson(),
      };
}

class DataUser {
  int id;
  String nama;
  String foto;
  String gender;
  String email;
  String hp;
  String phoneCode;
  String propinsi;
  String kota;
  String alamat;

  DataUser({
    required this.id,
    required this.nama,
    required this.foto,
    required this.gender,
    required this.email,
    required this.hp,
    required this.phoneCode,
    required this.propinsi,
    required this.kota,
    required this.alamat,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        nama: json["nama"],
        foto: json["foto"],
        gender: json["gender"],
        email: json["email"],
        hp: json["hp"],
        phoneCode: json["phone_code"],
        propinsi: json["propinsi"],
        kota: json["kota"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "foto": foto,
        "gender": gender,
        "email": email,
        "hp": hp,
        "phone_code": phoneCode,
        "propinsi": propinsi,
        "kota": kota,
        "alamat": alamat,
      };
}
