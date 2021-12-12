import 'dart:async';

class Validadores {
  final validarCorreo = StreamTransformer<String, String>.fromHandlers(
      handleData: (correo, sink) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(correo)) {
      sink.add(correo);
    } else {
      sink.addError('Correo no es correcto.');
    }
  });

  final validarClave =
      StreamTransformer<String, String>.fromHandlers(handleData: (clave, sink) {
    if (clave.length >= 6) {
      sink.add(clave);
    } else {
      sink.addError('Más de 5 caracteres.');
    }
  });
}
