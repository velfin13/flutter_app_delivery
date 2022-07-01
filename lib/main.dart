import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './src/pages/login/login_page.dart';
import './src/pages/register/register_page.dart';
import './src/pages/home/home_page.dart';
import './src/pages/roles/roles_page.dart';
import './src/pages/client/products/list/client_products_list_page.dart';
import './src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import './src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import './src/pages/client/profile/info/client_profile_info_page.dart';
import './src/pages/client/profile/update/client_profile_update_page.dart';

import './src/models/user.dart';

User userSession = User.fromJson(GetStorage().read("user") ?? {});

void main() async {
  await GetStorage.init();
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
      initialRoute: userSession.id != null
          ? userSession.roles!.length > 1
              ? "/roles"
              : "/client/products/list"
          : "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/roles", page: () => RolesPage()),
        GetPage(
            name: "/restaurant/orders/list",
            page: () => RestaurantOrdersListPage()),
        GetPage(
            name: "/client/products/list",
            page: () => ClientProductsListPage()),
        GetPage(
            name: "/delivery/orders/list",
            page: () => DeliveryOrdersListPage()),
        GetPage(
            name: "/client/profile/info", page: () => ClientProfileInfoPage()),
        GetPage(
            name: "/client/profile/update",
            page: () => ClientProfileUpdatePage()),
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
