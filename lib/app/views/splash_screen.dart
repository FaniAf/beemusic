import 'dart:async';

import 'package:beemusic/app/bloc/auth/auth_cubit.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/app_color.dart';
import 'package:beemusic/app/views/auth/auth_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const id = "/";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthCubit _authCubit = getIt<AuthCubit>();

  @override
  void initState() {
    super.initState();
    _authCubit.recoverSession();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: _authCubit,
      builder: (context, state) {
        // Cek apakah pengguna sudah login atau belum
        if (state is AuthRecoverSuccess) {
          // EasyLoading.show(
          //   status: 'loading...',
          //   // indicator:,
          // );
          // Pengguna sudah login, arahkan ke halaman home setelah 3 detik
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed(MainScreen.id);
          }).then((value) => EasyLoading.dismiss());
        } else if (state is AuthRecoverFailed) {
          // Pengguna belum login, arahkan ke halaman login setelah 3 detik
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed(AuthScreen.id);
          }).then((value) => EasyLoading.dismiss());
        } else if (state is AuthInitial) {
          // Pengguna belum login, arahkan ke halaman login setelah 3 detik
        }
        return Scaffold(
          body: Container(
            color: AppColor.kBlackColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: sizePadding * 2,
                  child: Center(
                    child: Image.asset(
                      AppImage.kImageLogoPNG,
                      // height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
