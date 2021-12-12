import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServicioFacebook extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  Future<bool> login() async {
    bool respuesta = false;
    final LoginResult result =
        await FacebookAuth.instance.login(permissions: ['email']);

    if (result.status == LoginStatus.success) {
      await FacebookAuth.instance.getUserData();
      respuesta = true;
    } else {
      respuesta = false;
      print(result.message);
    }

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    return respuesta;
  }

  Future<bool> logout() async {
    await FacebookAuthPlatform.instance.logOut();
    return false;
  }
}
