import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/login.dart';
import 'package:getx_project/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool? mode;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    mode = box.read('mode') ?? false;
    print(mode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: !mode! ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, primary: Colors.white),
        useMaterial3: true,
      ),
      home: const ScreenSplash(),
    );
  }
}
