import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> handleGoogleSignIn() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    print(1);
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final User? user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  } catch (error) {
    // Error occurred during sign-in.
    print('Error while signing in with Google: $error');
  }
}
