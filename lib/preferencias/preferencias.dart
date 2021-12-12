import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  final Future<SharedPreferences> _instancia = SharedPreferences.getInstance();
  SharedPreferences? prefs;

  Future<void> initPrefs() async {
    this.prefs = await _instancia;
  }

  bool get logueado => prefs?.getBool('logueado') ?? false;
  set logueado(bool valor) => prefs?.setBool('logueado', valor);
}
