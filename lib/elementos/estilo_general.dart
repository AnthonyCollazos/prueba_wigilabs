import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/elementos/color_general.dart';
import 'package:prueba_wigilabs/elementos/imagen_general.dart';

class EstiloGeneral {
  static final fondo = BoxDecoration(
    image: DecorationImage(image: ImagenGeneral.fondo, fit: BoxFit.cover),
  );

  static final tema = ThemeData(
    primaryColorDark: ColorGeneral.VIOLETA,
    primaryColorLight: const Color(0xFFB2EBF2),
    primaryColor: ColorGeneral.VIOLETA,
    accentColor: const Color(0xFF009688),
    scaffoldBackgroundColor: const Color(0xFFE0F2F1),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static final divisor = Divider(color: Colors.black26);
  static final espaciadorX1 = SizedBox(height: 10.0);
  static final espaciadorX2 = SizedBox(height: 20.0);
  static final espaciadorX3 = SizedBox(height: 30.0);
  static final espaciadorY1 = SizedBox(width: 10.0);
  static final espaciadorY2 = SizedBox(width: 20.0);
  static final espaciadorY3 = SizedBox(width: 30.0);
}
