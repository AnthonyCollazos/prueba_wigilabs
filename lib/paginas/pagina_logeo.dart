import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/estilos/elemento_general.dart';
import 'package:prueba_wigilabs/estilos/estilo_general.dart';

class PaginaLogueo extends StatefulWidget {
  @override
  _PaginaLogueoState createState() => _PaginaLogueoState();
}

class _PaginaLogueoState extends State<PaginaLogueo> {
  bool _cargando = false;
  final _usuario = TextEditingController();
  final _clave = TextEditingController();
  final _llave = GlobalKey<FormState>();
  final llaveScaffold = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _usuario.dispose();
    _clave.dispose();
    super.dispose();
  }

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
                  child: Form(
                    key: _llave,
                    child: Column(
                      children: <Widget>[
                        Text('Inicial'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
