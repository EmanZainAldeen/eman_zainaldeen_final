import 'package:eman_zainaldeen_final/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_card.dart';

class CartScreen extends GetView<CartController> {
  final TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Cart (${controller.cartList.length})".tr)),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.clearCart();
            },
          ),
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
          if (controller.cartList.isEmpty) {
            return Center(
              child: Text(
                "The List is Empty".tr,
                style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white : Colors.black),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: controller.cartList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = controller.cartList[index];
                    return CartCard(
                      imageUrl: item.imageUrl,
                      name: item.name,
                      address: item.address,
                      price: item.price,
                      onRemove: () => controller.removeBooking(index),
                    );
                  },
                ),
              ),
              Card(
                color: isDarkMode ? Colors.grey[900] : Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: couponController,
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                        decoration: InputDecoration(
                          labelText: "Have Coupon?".tr,
                          labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.discount, color: isDarkMode ? Colors.white70 : Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: isDarkMode ? Colors.white30 : Colors.black26),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          controller.applyDiscount(couponController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Text(
                          "CHECK".tr,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      Obx(() => Text(
                        "Total Order Value: ${controller.totalPrice.value} SR",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
