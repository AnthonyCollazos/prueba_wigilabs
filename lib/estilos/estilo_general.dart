import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/estilos/imagen_general.dart';

class EstiloGeneral {
  static final fondo = BoxDecoration(
    image: DecorationImage(image: ImagenGeneral.fondo, fit: BoxFit.cover),
  );
}
