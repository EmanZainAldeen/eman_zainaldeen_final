import 'package:eman_zainaldeen_final/module/booking/binding/booking_binding.dart';
import 'package:eman_zainaldeen_final/module/booking/binding/cart_binding.dart';
import 'package:eman_zainaldeen_final/module/booking/view/booking_screen.dart';
import 'package:eman_zainaldeen_final/module/booking/view/cart_screen.dart';
import 'package:eman_zainaldeen_final/module/settings/binding/settings_binding.dart';
import 'package:eman_zainaldeen_final/module/settings/view/settings_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.BOOKING;

  static final routes = [
    GetPage(
      name: Routes.BOOKING,
      page: () => BookingScreen(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsScreen(),
      binding: SettingsBinding(),
    ),

  ];


}
