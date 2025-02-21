import 'package:eman_zainaldeen_final/module/booking/controller/cart_controller.dart';
import 'package:get/get.dart';
import '../controller/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(() => BookingController());
    Get.lazyPut<CartController>(() => CartController());
  }
}