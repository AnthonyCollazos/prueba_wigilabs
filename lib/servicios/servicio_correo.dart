import 'dart:convert';

import 'package:http/http.dart' as http;

class ServicioCorreo {
  final String _firebaseToken = 'AIzaSyBDMjjF4whvbEuAnAETqR1Na6sQHRIX6pc';

  Future<Map<String, dynamic>> loguearUsuario(
      String correo, String clave) async {
    final data = {
      'email': correo,
      'password': clave,
      'returnSecureToken': true
    };

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken');
    final respuesta = await http.post(url, body: json.encode(data));

    print('respuestaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(respuesta);

    Map<String, dynamic> resDecodificada = json.decode(respuesta.body);

    if (resDecodificada.containsKey('idToken')) {
      return {
        'logueado': true,
        'token': resDecodificada['idToken'],
      };
    } else {
      return {
        'logueado': false,
        'mensaje': resDecodificada['error']['message'],
      };
    }
  }
}
