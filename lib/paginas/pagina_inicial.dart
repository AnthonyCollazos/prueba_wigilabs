//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/elementos/elemento_general.dart';
import 'package:prueba_wigilabs/elementos/estilo_general.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  bool _cargando = false;
  final llaveScaffold = GlobalKey<ScaffoldState>();
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
/*  final _usuario = TextEditingController();
  final _clave = TextEditingController();
  final _llave = GlobalKey<FormState>();
  
  
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void dispose() {
    _usuario.dispose();
    _clave.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    final pantalla = MediaQuery.of(context).size;

    return (_cargando)
        ? pantallaCargando()
        : Scaffold(
            key: llaveScaffold,
            appBar: mostrarCabecera(context, llaveScaffold),
            body: SafeArea(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: EstiloGeneral.fondo,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: pantalla.width * 0.08),
                  child: Column(
                    children: _crearContenido(context),
                  ),
                ),
              ),
            ),
          );
  }

  List<Widget> _crearContenido(BuildContext context) {
    List<Widget> contenido = [
      EstiloGeneral.espaciadorX3,
      crearBotonCerrarSesion(context),
    ];

    return contenido;
  }
}
