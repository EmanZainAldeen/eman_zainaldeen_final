import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.brightness_6, color: Get.isDarkMode ? Colors.yellow : Colors.blue),
                title: Text("dark_mode".tr, style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  value: controller.isDarkMode.value,
                  onChanged: (value) => controller.toggleTheme(),
                  activeColor: Colors.blue,
                ),
              ),
            )),

            SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.language, color: Colors.green),
                title: Text("language".tr, style: TextStyle(fontSize: 18)),
                trailing: DropdownButton<String>(
                  value: controller.selectedLanguage.value,
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.changeLanguage(newValue);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text("English", style: TextStyle(fontSize: 16)),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text("العربية", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
