import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/elementos/estilo_general.dart';
import 'package:prueba_wigilabs/elementos/imagen_general.dart';
import 'package:prueba_wigilabs/elementos/logeo_general.dart';
import 'package:prueba_wigilabs/servicios/servicio_facebook.dart';
import 'package:prueba_wigilabs/servicios/servicio_google.dart';

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

Widget crearBotonCerrarSesion(BuildContext context) {
  LogueoGeneral logueoGeneral = LogueoGeneral();
  return ElevatedButton(
    child: Text(
      'Cerrar Sesión',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    onPressed: () async {
      ServicioFacebook servicioFacebook = ServicioFacebook();
      ServicioGoogle servicioGoogle = ServicioGoogle();
      try {
        if (!await servicioGoogle.logout()) logueoGeneral.desloguearse(context);
      } catch (e) {
        print('Error logout Google.');
        print(e);
      }
      try {
        if (!await servicioFacebook.logout())
          logueoGeneral.desloguearse(context);
      } catch (e) {
        print('Error logout Facebook.');
        print(e);
      }
    },
  );
}

void mostrarMensaje(BuildContext context, String titulo, String mensaje) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        //contentPadding: EstiloGeneral.paddingDialog,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.message_outlined,
                  color: Colors.amber,
                  /*size: EstiloGeneral.iconoH1,*/
                ),
                EstiloGeneral.espaciadorY1,
                Text(titulo /*, style: EstiloGeneral.h1AzulB*/),
              ],
            ),
            EstiloGeneral.espaciadorX1,
            EstiloGeneral.divisor,
            EstiloGeneral.espaciadorX1,
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(mensaje /*, style: EstiloGeneral.h3Gris4N*/),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('LISTO' /*, style: EstiloGeneral.h3RojoB*/),
          ),
        ],
      );
    },
  );
}
