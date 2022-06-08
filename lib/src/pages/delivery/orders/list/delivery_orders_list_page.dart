// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../src/pages/delivery/orders/list/delivery_orders_list_controller.dart';

class DeliveryOrdersListPage extends StatelessWidget {
  DeliveryOrdersListPage({Key? key}) : super(key: key);

  DeliveryOrdersListController con = Get.put(DeliveryOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Delivery Orders list Page")),
    );
  }
}
