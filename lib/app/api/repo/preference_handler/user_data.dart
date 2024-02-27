// import 'dart:convert';

// import 'package:beemusic/app/api/repo/preference_handler/preference_handler.dart';

// class UserData {

//   static Future<String?> idUser() async {
//     Map<String, dynamic>? loginData = await _getLoginData();
//     if (loginData != null) {
//       String? userId = loginData["UserId"];
//       if (userId != null) {
//         return userId;
//       }
//     }
//     return null;
//   }

//   static Future<String?> tokenUser() async {
//     Map<String, dynamic>? loginData = await _getLoginData();
//     if (loginData != null) {
//       String? tokenUser = loginData["Token"];
//       if (tokenUser != null) {
//         return tokenUser;
//       }
//     }
//     return null;
//   }

//   static Future<String?> refreshTokenUser() async {
//     Map<String, dynamic>? loginData = await _getLoginData();
//     if (loginData != null) {
//       String? refreshToken = loginData["RefreshToken"];
//       if (refreshToken != null) {
//         return refreshToken;
//       }
//     }
//     return null;
//   }
// }
