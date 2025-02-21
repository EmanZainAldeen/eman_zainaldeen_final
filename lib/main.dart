import 'package:eman_zainaldeen_final/module/booking/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eman_zainaldeen_final/route/app_pages.dart';
import 'package:eman_zainaldeen_final/theme/theme_service.dart';
import 'package:eman_zainaldeen_final/theme/themes.dart';
import 'package:eman_zainaldeen_final/translations/translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<CartController>(CartController());
  ThemeMode themeMode = await ThemeService().getThemeMode();
  String savedLanguage = await TranslationService.getSavedLanguage();
  runApp(MyApp(themeMode: themeMode, savedLanguage: savedLanguage));
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  final String savedLanguage;

  MyApp({required this.themeMode, required this.savedLanguage});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Booking App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      translations: TranslationService(),
      locale: Locale(savedLanguage),
      fallbackLocale: Locale('en'),
    );
  }
}
