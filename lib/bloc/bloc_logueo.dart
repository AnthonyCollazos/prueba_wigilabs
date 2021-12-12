import 'dart:async';

import 'package:prueba_wigilabs/bloc/bloc_validadores.dart';
import 'package:rxdart/rxdart.dart';

class BlocLogueo with Validadores {
  final _correoControlador = BehaviorSubject<String>();
  final _claveControlador = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get correoStream =>
      _correoControlador.stream.transform(validarCorreo);
  Stream<String> get claveStream =>
      _claveControlador.stream.transform(validarClave);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(correoStream, claveStream, (e, p) => true);

  // Insertar valores al Stream
  Function(String) get cambiarCorreo => _correoControlador.sink.add;
  Function(String) get cambiarClave => _claveControlador.sink.add;

  // Obtener el último valor ingresado a los streams
  String get correo => _correoControlador.value;
  String get clave => _claveControlador.value;

  dispose() {
    _correoControlador.close();
    _claveControlador.close();
  }
}
