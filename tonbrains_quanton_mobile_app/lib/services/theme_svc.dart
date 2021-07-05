import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';

class MyTheme with ChangeNotifier {
  ThemeMode currentTheme() {
    if (darkTheme) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
  // Future<QuanTonUser> getUser() => Future<QuanTonUser>.value(_user);

  // // wrapping the firebase calls
  Future setTheme(String theme) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'currentTheme', value: theme);
    await initAppTheme();
    notifyListeners();
  }
}
