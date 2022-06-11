// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:flutter_app_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:get/get.dart';
import '../../../../../src/pages/client/products/list/client_products_list_controller.dart';
import '../../../../../src/utils/custom_animated_bottom_bar.dart';

class ClientProductsListPage extends StatelessWidget {
  ClientProductsListPage({Key? key}) : super(key: key);

  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottonBar(),
        body: Obx(
          () => IndexedStack(
            index: con.indexTab.value,
            children: [RestaurantOrdersListPage(), DeliveryOrdersListPage()],
          ),
        ));
  }

  Widget _bottonBar() {
    return Obx(
      () => CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.amber,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        selectedIndex: con.indexTab.value,
        onItemSelected: (indice) => con.changeTab(indice),
        items: [
          BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text("Home"),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: const Icon(Icons.list),
              title: const Text("Pedidos"),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Perfil"),
              activeColor: Colors.white,
              inactiveColor: Colors.black)
        ],
      ),
    );
  }
}
