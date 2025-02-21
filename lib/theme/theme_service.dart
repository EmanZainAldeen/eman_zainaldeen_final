import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final _key = 'isDarkMode';

  void switchTheme() async {
    final isDarkMode = await getTheme();
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!isDarkMode);
  }

  Future<ThemeMode> getThemeMode() async {
    return await getTheme() ? ThemeMode.dark : ThemeMode.light;
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  void saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }
}
