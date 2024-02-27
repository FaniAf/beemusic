import 'package:beemusic/app/bloc/auth/auth_google.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/component/snackbar.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/home/home_screen.dart';
import 'package:beemusic/app/views/main_menu/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const id = "/auth_screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthBloc _authCubit = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticatedState) {
          context.pushNamed(MainScreen.id);
        } else if (state is AuthErrorState) {
          showSnackBar(context, state.errorMessage);
        }
      },
      child: SafeArea(
          child: Scaffold(
              body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 24, // Sesuaikan ukuran font sesuai kebutuhan Anda
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: sizePadding * 2,
              child: Center(
                child: Image.asset(
                  AppImage.kImageLogoPNG,
                  // height: 50,
                ),
              ),
            ),
            spaceHeight04,
            Bounceable(
              onTap: () {
                _authCubit.handleGoogleSignIn();
                // context.pushNamed(HomeScreen.id);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In with Google",
                          style: AppStyle.whiteTextSemiBoldStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}
