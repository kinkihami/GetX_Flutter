import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_project/e-commerce/controller/login_controller.dart';
import 'package:getx_project/home.dart';
import 'package:getx_project/signup.dart';
import 'package:google_fonts/google_fonts.dart';

final box = GetStorage();

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

Future<bool> exit(context) async {
  final shouldPop = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          'Do you want to go back?',
          style: TextStyle(color: Colors.white),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
  return shouldPop!;
}

class ScreenLogin extends GetView<LoginController> {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    RxBool obsecure = true.obs;
    return WillPopScope(
      onWillPop: () => exit(context),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/736x/f1/8d/d9/f18dd9da7cf0da65a8d7fa7366f44a59.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.2),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
                child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      'Welcome Back!, Enter your email and password to login.',
                      style:
                          GoogleFonts.lora(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return 'enter valid email';
                        } else {
                          return null;
                        }
                      },
                      style:
                          GoogleFonts.lora(color: Colors.white, fontSize: 15),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white.withOpacity(0.6),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: 'Email',
                        hintStyle: GoogleFonts.lora(
                            color: Colors.white.withOpacity(0.6), fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.6),
                                width: 2)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color:
                                    Colors.redAccent.shade700.withOpacity(0.6),
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.6),
                                width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color:
                                    Colors.redAccent.shade700.withOpacity(0.6),
                                width: 2)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: obsecure.value,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'password must contain 8 characters';
                          } else {
                            return null;
                          }
                        },
                        style:
                            GoogleFonts.lora(color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                obsecure.value = !obsecure.value;
                              },
                              icon: !obsecure.value
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.white.withOpacity(0.6),
                                    )),
                          border: InputBorder.none,
                          hintText: 'Password',
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 5),
                          hintStyle: GoogleFonts.lora(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 15),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.redAccent.shade700
                                      .withOpacity(0.6),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 2)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.redAccent.shade700
                                      .withOpacity(0.6),
                                  width: 2)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('clicked');
                        if (formKey.currentState!.validate()) {
                          final Future<Map<String, dynamic>?>
                              successfullMessage = controller.login(
                                  emailController.text,
                                  passwordController.text);
                          successfullMessage.then((response) async {
                            if (response!['message'] == "success") {
                              Get.off(() => const ScreenHome());
                              box.write('email', emailController.text);
                            } else {
                              return Get.snackbar('Login failed',
                                  'you have entered wrong login details');
                            }
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Login',
                            style: GoogleFonts.dmSerifDisplay(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Doesn't have an account?",
                          style: GoogleFonts.lora(
                              color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => ScreenSignup(),
                              transition: Transition.native),
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.lora(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
