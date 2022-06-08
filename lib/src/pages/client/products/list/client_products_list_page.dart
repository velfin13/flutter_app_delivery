// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../src/pages/client/products/list/client_products_list_controller.dart';
import 'package:get/get.dart';

class ClientProductsListPage extends StatelessWidget {
  ClientProductsListPage({Key? key}) : super(key: key);

  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("ClientProductsListPage"),
          ElevatedButton(
            onPressed: () {
              con.logOut();
            },
            child: const Text(
              "cerrar sesion",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      )),
    );
  }
}
