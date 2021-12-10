import 'package:flutter/material.dart';
import 'package:prueba_wigilabs/paginas/pagina_logeo.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perú Compras',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.blueAccent,
        canvasColor: Colors.white,
      ),
      initialRoute: 'logueo',
      routes: {
        'logueo': (BuildContext context) => PaginaLogueo(),
      },
    );
  }
}
