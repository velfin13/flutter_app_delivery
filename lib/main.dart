import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './src/pages/login/login_page.dart';
import './src/pages/register/register_page.dart';

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
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
      ],
      navigatorKey: Get.key,
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              onBackground: Colors.grey,
              secondary: Colors.amberAccent,
              primary: Colors.amber,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              background: Colors.grey,
              onSecondary: Colors.grey)),
    );
  }
}
