import 'package:beemusic/app/model/api_response_model.dart';

abstract class BaseMusicRepository {
  Future<ApiResponse> discoverGet();
  Future<ApiResponse> discoverDetailGet(id);
  Future<ApiResponse> topHitsGet();
  Future<ApiResponse> topHitsDetailGet(id);
  Future<ApiResponse> songGet();
  Future<ApiResponse> songDetailGet(id);
  Future<ApiResponse> artistGet();
  Future<ApiResponse> artistDetailGet(id);
  Future<ApiResponse> albumGet();
  Future<ApiResponse> albumDetailGet(id);
  Future<ApiResponse> genreGet();
  Future<ApiResponse> genreDetailGet(id);
}
