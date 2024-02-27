import 'package:beemusic/app/model/api_response_model.dart';

abstract class BaseAuthRepository {
  Future<ApiResponse> signinUser({String? email, String? password});
}
