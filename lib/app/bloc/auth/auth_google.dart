import 'package:beemusic/app/api/repo/preference_handler/preference_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthState {}

class AuthAuthenticatedState extends AuthState {
  final User user;

  AuthAuthenticatedState(this.user);
}

class AuthUnauthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState(this.errorMessage);
}

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthUnauthenticatedState());

  Future<void> handleGoogleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in process.
        emit(AuthUnauthenticatedState());
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // Sign-in successful, store the user ID and emit authenticated state.
          PreferenceHandler.storingUserID(user.uid);
          emit(AuthAuthenticatedState(user));
        } else {
          // Unhandled case where user is null, emit unauthenticated state.
          emit(AuthUnauthenticatedState());
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthErrorState('An error occurred: ${e.message}'));
      } catch (e) {
        emit(AuthErrorState('An error occurred: $e'));
      }
    } catch (error) {
      // Error occurred during sign-in with Google Sign-In.
      emit(AuthErrorState('An error occurred: $error'));
    }
  }
}
