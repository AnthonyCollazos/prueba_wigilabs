import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/estilos/estilo_general.dart';
import 'package:prueba_wigilabs/estilos/imagen_general.dart';

AppBar mostrarCabecera(BuildContext context, GlobalKey<ScaffoldState> llave) {
  return AppBar(
    title: ImagenGeneral.logo,
    leading: Navigator.canPop(context)
        ? IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.blueAccent,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        : null,
  );
}

Widget pantallaCargando() {
  return Scaffold(
    appBar: AppBar(title: ImagenGeneral.logo, automaticallyImplyLeading: false),
    body: SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: EstiloGeneral.fondo,
        child: Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}

double obtenerMarco(Size pantalla) => pantalla.width * 0.06;
double obtenerAncho(Size pantalla) => pantalla.width * 0.94;
