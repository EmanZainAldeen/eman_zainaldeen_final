import 'package:get/get.dart';
import 'package:eman_zainaldeen_final/helper/shared_prefs.dart';
import 'package:eman_zainaldeen_final/theme/theme_service.dart';
import 'package:eman_zainaldeen_final/translations/translation_service.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var selectedLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    isDarkMode.value = await SharedPrefs.getTheme();
    selectedLanguage.value = await SharedPrefs.getLanguage();
    update();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    SharedPrefs.setTheme(isDarkMode.value);
    ThemeService().switchTheme();
    update();
  }

  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    TranslationService.changeLocale(langCode);
    update();
  }
}
