import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/e-commerce/controller/cart_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenCart extends GetView<CartController> {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    RxList<CartModel> cartList = <CartModel>[].obs;
    cartList.addAll(controller.getItems);

    return Scaffold(
        bottomNavigationBar: Card(
          elevation: 10,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    '₹ ${controller.totalPrice}',
                    style: GoogleFonts.acme(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () => log(controller.getItems.toString()),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff003459),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style:
                            GoogleFonts.acme(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          backgroundColor: Color(0xff003459),
          title: Text(
            'My Cart',
            style: GoogleFonts.acme(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: controller.count == 0
            ? Center(
                child: Text(
                  'Cart is Empty',
                  style: GoogleFonts.acme(fontSize: 20),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.count,
                      itemBuilder: (ctx, index) => Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            margin: EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12,
                            ),
                            child: ListTile(
                              leading: Transform.scale(
                                scale: 1.2,
                                child: SizedBox(
                                  width: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      cartList[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                cartList[index].title,
                                style: GoogleFonts.dosis(),
                              ),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size: S',
                                    style: GoogleFonts.dosis(),
                                  ),
                                  Text(
                                    '₹ ${cartList[index].price}',
                                    style: GoogleFonts.acme(),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        cartList[index].qty.toInt() != 1
                                            ? controller
                                                .decrement(cartList[index])
                                            : controller
                                                .removeItem(cartList[index]);
                                        print(controller.count);
                                      },
                                      child: cartList[index].qty.toInt() != 1
                                          ? const Icon(
                                              Icons.remove,
                                              size: 18,
                                            )
                                          : Icon(
                                              Icons.delete,
                                              size: 20,
                                              color: Colors.red.shade900,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Obx(
                                    () => Text(
                                      cartList[index].qty.toString(),
                                      style: GoogleFonts.acme(fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.increment(cartList[index]);
                                      log(cartList[index].qty.toString());
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ));
  }
}
