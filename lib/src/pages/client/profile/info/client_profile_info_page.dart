// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../src/pages/client/profile/info/client_profile_info_controller.dart';

class ClientProfileInfoPage extends StatelessWidget {
  ClientProfileInfoPage({Key? key}) : super(key: key);

  ClientProfileInfoController con = Get.put(ClientProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
        ),
        body: Stack(
          //El STACK Posisiona elementos uno encima del otro
          children: [
            _backgraundCover(context),
            _boxForm(context),
            _imagenUser(context),
            _SignOut()
          ],
        ));
  }

  Widget _backgraundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.28,
            left: 50,
            right: 50),
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
        ], color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.4,
        child: SingleChildScrollView(
            child: Column(
          children: [
            _textName(),
            _textEmail(),
            _textPhone(),
            _buttonUpdate(context)
          ],
        )));
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Actualizar datos",
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _imagenUser(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      child: CircleAvatar(
        backgroundImage: con.user.image != null
            ? NetworkImage(con.user.image!)
            : const AssetImage("assets/img/user_profile.png") as ImageProvider,
        radius: 60,
        backgroundColor: Colors.white,
      ),
    ));
  }

  Widget _textName() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            "${con.user.name ?? ""} ${con.user.lastname ?? ""}",
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: const Text(
            "Email",
          )),
    );
  }

  Widget _textEmail() {
    return ListTile(
        leading: const Icon(Icons.email),
        title: Text(con.user.email ?? ""),
        subtitle: const Text(
          "Email",
        ));
  }

  Widget _textPhone() {
    return ListTile(
        leading: const Icon(Icons.phone),
        title: Text(con.user.phone ?? ""),
        subtitle: const Text(
          "Celular",
        ));
  }

  Widget _SignOut() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(right: 15),
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => con.logOut(),
        icon: const Icon(
          Icons.power_settings_new,
          color: Colors.white,
          size: 40,
        ),
      ),
    ));
  }
}
