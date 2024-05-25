import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/e-commerce/cart.dart';
import 'package:getx_project/e-commerce/controller/cart_controller.dart';
import 'package:getx_project/e-commerce/controller/product_controller.dart';

import 'package:getx_project/login.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenProducts extends StatelessWidget {
  const ScreenProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff003459),
            automaticallyImplyLeading: false,
            title: Text(
              'Shoes For Men',
              style: GoogleFonts.acme(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(() => ScreenCart());
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ))
            ],
          ),
          body: Obx(
            () => GridView.count(
              // itemCount: 12,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 10,
              //   crossAxisSpacing: 10,
              // ),
              // itemBuilder: (context, index) {
              //   return Container(
              //     // height: 300,
              //     // width: 150,
              //     color: Colors.red,
              //   );
              // },
              crossAxisCount: 2,
              padding: const EdgeInsets.all(5),
              childAspectRatio: 0.53,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: List.generate(
                controller.productsList.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 220,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: NetworkImage(
                                controller.productsList[index].image,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: CircleAvatar(
                                  backgroundColor: box.read('mode')
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade200,
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: !box.read('mode')
                                              ? Colors.black45
                                              : Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      controller.productsList[index].name,
                      style: GoogleFonts.dosis(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.productsList[index].description,
                      maxLines: 1,
                      style: GoogleFonts.dosis(
                        color:
                            !box.read('mode') ? Colors.black54 : Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      '₹ ${controller.productsList[index].price.toString()}',
                      style: GoogleFonts.acme(),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.addItem(
                          controller.productsList[index].id,
                          controller.productsList[index].name,
                          controller.productsList[index].price,
                          1.obs,
                          controller.productsList[index].image,
                        );
                        log('added to cart');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff003459),
                        ),
                        width: double.infinity,
                        height: 40,
                        child: Center(
                            child: Text(
                          'Add to Cart',
                          style: GoogleFonts.dosis(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
