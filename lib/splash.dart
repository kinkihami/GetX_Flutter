import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/home.dart';
import 'package:getx_project/login.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    isLogged();
    super.initState();
  }

  void isLogged() async {
    await Future.delayed(const Duration(seconds: 1));
    if (box.read('isLogged') == true) {
      Get.off(() => const ScreenHome());
    } else {
      Get.off(() => const ScreenLogin());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'GetX',
          style: GoogleFonts.anton(
            letterSpacing: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
