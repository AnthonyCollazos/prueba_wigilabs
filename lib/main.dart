import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_wigilabs/bloc/bloc_evento.dart';
import 'package:prueba_wigilabs/elementos/estilo_general.dart';
import 'package:prueba_wigilabs/paginas/pagina_inicial.dart';
import 'package:prueba_wigilabs/paginas/pagina_logeo.dart';
import 'package:prueba_wigilabs/preferencias/preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _prefs = Preferencias();
  await _prefs.initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<BlocEvento>(create: (context) => BlocEvento()),
      ],
      child: MiApp(logueado: _prefs.logueado),
    ),
  );
}

class MiApp extends StatefulWidget {
  final bool? logueado;
  MiApp({Key? key, @required this.logueado}) : super(key: key);

  @override
  _MiAppState createState() => _MiAppState(logueado: logueado);
}

class _MiAppState extends State<MiApp> {
  final bool? logueado;
  _MiAppState({@required this.logueado});

  @override
  Widget build(BuildContext context) {
    String? ruta;

    (logueado == true) ? ruta = 'inicial' : ruta = 'logueo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Wigilabs',
      theme: EstiloGeneral.tema,
      initialRoute: ruta,
      routes: {
        'logueo': (BuildContext context) => PaginaLogueo(),
        'inicial': (BuildContext context) => PaginaInicial(),
      },
    );
  }
}
