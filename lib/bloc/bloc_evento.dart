import 'package:flutter/cupertino.dart';
import 'package:prueba_wigilabs/bloc/bloc_logueo.dart';

class BlocEvento extends ChangeNotifier {
  final blocLogueo = new BlocLogueo();

  void actualizar() {
    notifyListeners();
  }
}
