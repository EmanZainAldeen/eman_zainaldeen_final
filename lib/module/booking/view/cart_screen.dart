import 'package:eman_zainaldeen_final/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  final TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart".tr),
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
              child: Text("The List is Empty".tr, style: TextStyle(fontSize: 18)),
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
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.image_not_supported, size: 80, color: Colors.grey);
                                },
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text("${item.address} - ${item.price} SR",
                                      style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                ],
                              ),
                            ),

                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => controller.removeBooking(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: couponController,
                        decoration: InputDecoration(
                          labelText: "Have Coupon?".tr,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.discount),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          controller.applyDiscount(couponController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Text("CHECK".tr, style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                      Obx(() => Text(
                        "Total Order Value: ${controller.totalPrice.value} SR",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
