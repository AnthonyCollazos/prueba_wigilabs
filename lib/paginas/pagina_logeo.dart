import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:prueba_wigilabs/bloc/bloc_evento.dart';
import 'package:prueba_wigilabs/bloc/bloc_logueo.dart';
import 'package:prueba_wigilabs/elementos/elemento_general.dart';
import 'package:prueba_wigilabs/elementos/estilo_general.dart';
import 'package:prueba_wigilabs/elementos/logeo_general.dart';
import 'package:prueba_wigilabs/servicios/servicio_correo.dart';
import 'package:prueba_wigilabs/servicios/servicio_facebook.dart';
import 'package:prueba_wigilabs/servicios/servicio_google.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class PaginaLogueo extends StatefulWidget {
  @override
  _PaginaLogueoState createState() => _PaginaLogueoState();
}

class _PaginaLogueoState extends State<PaginaLogueo> {
  @override
  Widget build(BuildContext context) {
    final pantalla = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: EstiloGeneral.fondo,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: pantalla.width * 0.08),
            child: Form(
              child: Column(
                children: _crearContenido(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _crearContenido(BuildContext context) {
    final pro = Provider.of<BlocEvento>(context, listen: false);
    List<Widget> contenido = [
      EstiloGeneral.espaciadorX3,
      _crearInputCorreo(pro.blocLogueo),
      EstiloGeneral.espaciadorX3,
      _crearInputClave(pro.blocLogueo),
      EstiloGeneral.espaciadorX3,
      _crearBotonAcceder(context, pro.blocLogueo),
      EstiloGeneral.espaciadorX3,
      _crearBotonGoogle(context),
      EstiloGeneral.espaciadorX3,
      _crearBotonFacebook(context),
      EstiloGeneral.espaciadorX3,
    ];

    return contenido;
  }

  Widget _crearInputCorreo(BlocLogueo bloc) {
    return StreamBuilder(
      stream: bloc.correoStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.mail,
              color: Colors.amber,
            ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            errorText:
                (snapshot.error != null) ? snapshot.error.toString() : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
          ),
          onChanged: bloc.cambiarCorreo,
        );
      },
    );
  }

  Widget _crearInputClave(BlocLogueo bloc) {
    return StreamBuilder(
      stream: bloc.claveStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Colors.amber),
            labelText: 'Clave',
            errorText:
                (snapshot.error != null) ? snapshot.error.toString() : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
          ),
          onChanged: bloc.cambiarClave,
        );
      },
    );
  }

  Widget _crearBotonAcceder(BuildContext context, BlocLogueo bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Text(
            'ACCEDER',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed:
              snapshot.hasData ? () => _loguearUsuario(context, bloc) : null,
        );
      },
    );
  }

  void _loguearUsuario(BuildContext context, BlocLogueo bloc) async {
    ServicioCorreo servicioCorreo = ServicioCorreo();
    final info = await servicioCorreo.loguearUsuario(bloc.correo, bloc.clave);
    if (info['logueado'] == true) {
      LogueoGeneral logueoGeneral = LogueoGeneral();
      logueoGeneral.loguearse(context);
    } else {
      mostrarMensaje(context, 'Atención', info['mensaje']);
    }
  }

  Widget _crearBotonGoogle(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        'Logueo con Google',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
      onPressed: () async {
        ServicioGoogle servicioGoogle = ServicioGoogle();
        LogueoGeneral logueoGeneral = LogueoGeneral();
        if (await servicioGoogle.login()) logueoGeneral.loguearse(context);
      },
    );
  }

  Widget _crearBotonFacebook(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        'Logueo con Facebook',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue[800]),
      onPressed: () async {
        ServicioFacebook servicioFacebook = ServicioFacebook();
        LogueoGeneral logueoGeneral = LogueoGeneral();
        if (await servicioFacebook.login()) logueoGeneral.loguearse(context);
      },
    );
  }
}
