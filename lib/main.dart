import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './src/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delivery Udemy",
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const LoginPage())],
      navigatorKey: Get.key,
    );
  }
}
