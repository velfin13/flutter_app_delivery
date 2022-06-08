// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/pages/roles/roles_controller.dart';
import '../../../src/models/rol.dart';

class RolesPage extends StatelessWidget {
  RolesPage({Key? key}) : super(key: key);

  RolesController con = Get.put(RolesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Debes seleccionar el rol",
        style: TextStyle(color: Colors.black),
      )),
      body: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.17),
          child: ListView(
            children: con.user.roles!.map((Rol rol) {
              return _cardRol(rol);
            }).toList(),
          )),
    );
  }

  Widget _cardRol(Rol rol) {
    return GestureDetector(
        onTap: (() => con.goToPageRol(rol)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 100,
              child: FadeInImage(
                image: NetworkImage(rol.image!),
                fit: BoxFit.contain,
                fadeInDuration: const Duration(milliseconds: 50),
                placeholder: const AssetImage('assets/img/no-image.png'),
              ),
            ),
            Text(
              rol.name!,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ));
  }
}
