// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../src/pages/restaurant/orders/list/restaurant_orders_list_controller.dart';

class RestaurantOrdersListPage extends StatelessWidget {
  RestaurantOrdersListPage({Key? key}) : super(key: key);

  RestaurantOrdersListController con =
      Get.put(RestaurantOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Restaurante orders list")),
    );
  }
}
