import 'dart:convert';

import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/api/repo/auth/base_auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:beemusic/app/model/api_response_model.dart';

class AuthRepository extends BaseAuthRepository {
  @override
  Future<ApiResponse> signinUser({String? email, String? password}) async {
    const url = EndPoints.urlLogin;
    final body = json.encode({
      'login_id': email,
      'login_password': password,
    });
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Future<String> login(String loginId, String loginPassword) async {
  //   const url = 'http://example.com/login';
  //   final body = json.encode({
  //     'login_id': loginId,
  //     'login_password': loginPassword,
  //   });
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: body,
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //     return response.body;
  //   } catch (e) {
  //     print('Error: $e');
  //     return '';
  //   }
  // }
}
