import 'package:beemusic/app/api/repo/preference_handler/preference_handler.dart';
import 'package:beemusic/app/api/repo/preference_handler/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:beemusic/app/api/repo/auth/auth_repository.dart';
import 'package:beemusic/app/model/api_response_model.dart';
import 'package:beemusic/app/model/login_response_model.dart';
import 'package:beemusic/app/utils/constant/enum.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  // final KaryawanRepository _karyawanRepository;

  AuthCubit({
    required AuthRepository authRepository,
    // required KaryawanRepository karyawanRepository,
  })  : _authRepository = authRepository,
        // _karyawanRepository = karyawanRepository,
        super(AuthInitial());

  void recoverSession() async {
    String? data = await PreferenceHandler.retrieveLoginID();

    try {
      print("data $data");
      // final DataLoginModel response = await _authRepository.recoverSession();
      if (data != null) {
        emit(AuthRecoverSuccess(token: data));
      } else {
        emit(const AuthRecoverFailed(errorModel: "Sesi telah berakhir"));
      }
    } catch (e) {
      emit(const AuthRecoverFailed(errorModel: "Sesi telah "));
    }
  }

  // @override

  // @override
  // AuthState? fromJson(Map<String, dynamic> json) {
  //   try {
  //     final  loginModel = DataLoginModel.fromJson(json);
  //     return AuthSuccess(loginId: loginModel);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // @override
  // Map<String, dynamic>? toJson(AuthState state) {
  //   if (state is AuthSuccess) {
  //     return state.loginId.toJson();
  //   } else {
  //     return null;
  //   }
  // }
}
