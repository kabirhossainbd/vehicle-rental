import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_rental_app/util/key.dart';

class ThemeController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  ThemeMode themeMode = ThemeMode.dark;
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    sharedPreferences.setInt(ShareKey.theme, themeMode.index);
    update();
  }

  void _loadCurrentTheme() async {
    themeMode = ThemeMode.values[sharedPreferences.getInt(ShareKey.theme) ?? 1];
    update();
  }
}
