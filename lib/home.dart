import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_project/e-commerce/products.dart';
import 'package:getx_project/login.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GetX Project',
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff003459),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            GestureDetector(
              onTap: () => Get.snackbar(
                'Welcome',
                'Have a wonderful day!',
                snackPosition: SnackPosition.BOTTOM,
                // backgroundColor: Colors.black54,
                // colorText: Colors.white,
                borderRadius: 20,
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff003459),
                ),
                child: Center(
                    child: Text(
                  'Snackbar',
                  style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
            GestureDetector(
              onTap: () => Get.defaultDialog(
                title: 'Error',
                middleText: 'Error occured while fetching data',
                // backgroundColor: Colors.deepOrange[300],
                // titleStyle: const TextStyle(color: Colors.white),
                // middleTextStyle: const TextStyle(color: Colors.white),
                textCancel: 'Cancel',
                textConfirm: 'Ok',
                // buttonColor: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff003459),
                ),
                child: Center(
                    child: Text(
                  'Dialog Box',
                  style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(
                () => ScreenProducts(),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff003459),
                ),
                child: Center(
                    child: Text(
                  'e-commerce',
                  style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (box.read('mode') != true) {
                  box.write('mode', true);
                } else {
                  box.write('mode', false);
                }
                Get.changeTheme(box.read('mode') == true
                    ? ThemeData.dark()
                    : ThemeData.light());
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff003459),
                ),
                child: Center(
                    child: Text(
                  'Theme',
                  style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(
                  () => const ScreenLogin(),
                );
                box.write('isLogged', false);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff003459),
                ),
                child: Center(
                    child: Text(
                  'Logout',
                  style: GoogleFonts.lora(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
            Spacer(),
            Text(
              'Logged in as: ' + box.read('email'),
              style: GoogleFonts.lora(
                color: const Color(0xff003459),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
