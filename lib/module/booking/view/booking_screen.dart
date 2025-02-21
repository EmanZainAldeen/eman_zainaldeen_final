import 'package:eman_zainaldeen_final/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/booking_controller.dart';
import '../widgets/event_card.dart';

class BookingScreen extends GetView<BookingController> {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events".tr),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.toNamed(Routes.SETTINGS);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.bookingList.isEmpty) {
            return Center(
              child: Text("No events available".tr, style: TextStyle(fontSize: 18)),
            );
          }
          return ListView.builder(
            itemCount: controller.bookingList.length,
            itemBuilder: (context, index) {
              final booking = controller.bookingList[index];
              return EventCard(
                imageUrl: booking.imageUrl,
                name: booking.name,
                address: booking.address,
                price: booking.price,
                rating: booking.rating,
                onAddToCart: () {
                  controller.addToCart(booking);
                },
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Get.toNamed(Routes.CART);
        },
      ),
    );
  }
}
