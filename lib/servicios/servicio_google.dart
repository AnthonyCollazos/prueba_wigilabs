import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServicioGoogle extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  Future<bool> login() async {
    bool isSigningIn = false;
    final user = await googleSignIn.signIn();

    if (user == null) {
      isSigningIn = false;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = true;
    }
    return isSigningIn;
  }

  Future<bool> logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    return false;
  }
}
