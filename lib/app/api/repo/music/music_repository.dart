import 'dart:convert';

import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/api/repo/auth/base_auth_repository.dart';
import 'package:beemusic/app/api/repo/music/base_music_repository.dart';
import 'package:http/http.dart' as http;
import 'package:beemusic/app/model/api_response_model.dart';

class MusicRepository extends BaseMusicRepository {
  @override
  Future<ApiResponse> albumDetailGet(id) async {
    final url = "${EndPoints.urlAlbum}/$id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> albumGet() async {
    const url = EndPoints.urlAlbum;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> artistDetailGet(id) async {
    final url = "${EndPoints.urlArtist}/$id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> artistGet() async {
    const url = EndPoints.urlArtist;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> discoverDetailGet(id) async {
    final url = "${EndPoints.urlDiscover}/$id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> discoverGet() async {
    const url = EndPoints.urlAlbum;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> genreGet() async {
    const url = EndPoints.urlGenre;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> genreDetailGet(id) async {
    const url = "${EndPoints.urlGenre}/id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> songDetailGet(id) async {
    final url = "${EndPoints.urlSong}/$id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> songGet() async {
    const url = EndPoints.urlSong;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> topHitsDetailGet(id) async {
    final url = "${EndPoints.urlTophits}/$id";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<ApiResponse> topHitsGet() async {
    const url = EndPoints.urlTophits;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = json.decode(response.body);
      return ApiResponse(response.statusCode, responseBody);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }
}
