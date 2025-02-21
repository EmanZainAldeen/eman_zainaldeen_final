import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ar.dart';
import 'en.dart';

class TranslationService extends Translations {
  static const String _languageKey = 'language';

  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'SA'),
  ];

  static final langs = ['English', 'العربية'];

  static Locale getDefaultLocale() {
    return locales.firstWhere((locale) => locale.languageCode == Get.deviceLocale?.languageCode,
        orElse: () => Locale('en', 'US'));
  }

  static Future<void> saveLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, langCode);
  }

  static Future<String> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'en';
  }

  static Future<void> changeLocale(String langCode) async {
    final locale = locales.firstWhere((locale) => locale.languageCode == langCode);
    Get.updateLocale(locale);
    await saveLanguage(langCode);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'ar_SA': ar,
  };
}
