import 'package:get/get.dart';
import '../model/booking_model.dart';
import 'cart_controller.dart';

class BookingController extends GetxController {
  var bookingList = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

  void loadBookings() {
    bookingList.addAll([
      BookingModel(
          id: 1,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 500,
          rating: 4.5,
          isAvailable: true,
          imageUrl: "assets/images/event1.png"),
      BookingModel(
          id: 2,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 300,
          rating: 4.2,
          isAvailable: false,
          imageUrl: "assets/images/event1.png"),
    BookingModel(
          id: 1,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 500,
          rating: 4.5,
          isAvailable: true,
          imageUrl: "assets/images/event1.png"),
      BookingModel(
          id: 2,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 200,
          rating: 4.2,
          isAvailable: true,
          imageUrl: "assets/images/event2.png"),
    BookingModel(
          id: 1,
          name: "New  Event",
          address: "Riyadh, Tower",
          price: 600,
          rating: 4.5,
          isAvailable: true,
          imageUrl: "assets/images/event1.png"),
      BookingModel(
          id: 2,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 300,
          rating: 4.2,
          isAvailable: true,
          imageUrl: "assets/images/event2.png"),
    BookingModel(
          id: 1,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 500,
          rating: 4.5,
          isAvailable: false,
          imageUrl: "assets/images/event1.png"),
      BookingModel(
          id: 2,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 300,
          rating: 4.2,
          isAvailable: false,
          imageUrl: "assets/images/event2.png"),
    BookingModel(
          id: 1,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 500,
          rating: 4.5,
          isAvailable: true,
          imageUrl: "assets/images/event1.png"),
      BookingModel(
          id: 2,
          name: "New Music Event",
          address: "Riyadh, Marash Tower",
          price: 300,
          rating: 4.2,
          isAvailable: true,
          imageUrl: "assets/images/event2.png"),
    ]);
  }

  void addToCart(BookingModel booking) {
    if (booking.isAvailable) {
      Get.find<CartController>().addBooking(booking);
      bookingList.remove(booking);

      update();
    } else {
      Get.snackbar("Error", "This booking is not available!");
    }
  }
  void restoreEvent(BookingModel booking) {
    if (!bookingList.contains(booking)) {
      bookingList.add(booking); // ✅ إرجاع الحدث إلى قائمة العرض
      update();
    }
  }
}
