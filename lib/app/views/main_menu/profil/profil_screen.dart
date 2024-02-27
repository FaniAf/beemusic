import 'package:beemusic/app/api/repo/preference_handler/preference_handler.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/auth/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);
  static const id = "/profil_screen";
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> _signOut() async {
    EasyLoading.show(
      status: 'loading...',
      // indicator:,
    );
    final googleSignIn = GoogleSignIn();

    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      PreferenceHandler.removeLoginID();
      context
          .pushNamedAndRemoveAll(AuthScreen.id)
          .then((value) => EasyLoading.dismiss());
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Hello, ",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Text(
          user!.displayName!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        // Text(user!.email!),
        spaceHeight04,
        Bounceable(
          onTap: _signOut,
          child: Container(
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
                  "Sign Out",
                  style: AppStyle.whiteTextSemiBoldStyle,
                ),
              ],
            ),
          ),
        )
      ],
    ))));
  }
}
