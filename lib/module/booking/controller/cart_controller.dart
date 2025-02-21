import 'package:eman_zainaldeen_final/module/booking/controller/booking_controller.dart';
import 'package:get/get.dart';
import '../model/booking_model.dart';

class CartController extends GetxController {
  var cartList = <BookingModel>[].obs;
  var totalPrice = 0.0.obs;

  void addBooking(BookingModel booking) {
    cartList.add(booking);
    calculateTotalPrice();
  }

  void removeBooking(int index) {
    final removedEvent = cartList[index];
    cartList.removeAt(index);
    Get.find<BookingController>().restoreEvent(removedEvent);
    calculateTotalPrice();
    update();
  }

  void clearCart() {
    final removedEvents = List<BookingModel>.from(cartList);
   cartList.clear();
   final bookingController = Get.find<BookingController>();
   for (var event in removedEvents) {
      bookingController.restoreEvent(event);
    }
   totalPrice.value = 0.0;
   update();
  }

  void calculateTotalPrice() {
    totalPrice.value = cartList.fold(0, (sum, item) => sum + item.price);
  }

  void applyDiscount(String code) {
    double discount = 0.0;
    if (code == "123A") {
      discount = 0.10;
    } else if (code == "123B") {
      discount = 0.20;
    } else if (code == "123C") {
      discount = 0.30;
    } else {
      Get.snackbar("Error", "Coupone is not active");
      return;
    }

    totalPrice.value = totalPrice.value - (totalPrice.value * discount);
    Get.snackbar("Success", "Discount Successfully Applied");
  }
}
