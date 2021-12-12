import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogueoGeneral {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loguearse(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('logueado', true);
    Navigator.pushNamedAndRemoveUntil(
        context, 'inicial', (Route<dynamic> route) => false);
  }

  Future<void> desloguearse(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('logueado', false);
    Navigator.pushNamedAndRemoveUntil(
        context, 'logueo', (Route<dynamic> route) => false);
  }
}
