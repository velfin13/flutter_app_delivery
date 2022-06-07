// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterController con = Get.put(RegisterController());

  RegisterPage({Key? key}) : super(key: key);

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
            _backButton()
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
        height: MediaQuery.of(context).size.height * 0.7,
        child: SingleChildScrollView(
            child: Column(
          children: [
            _textYourInfo(),
            _textFielEmail(),
            _textFielNombre(),
            _textFielLastName(),
            _textFielPhone(),
            _textFielPassword(),
            _textFielConfirmPassword(),
            _buttonRegister(context)
          ],
        )));
  }

  Widget _textFielEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.emailControler,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: "Correo Electronico", prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFielNombre() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.nombreControler,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Nombre", prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFielLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.apellidoControler,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Apellido", prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFielPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.telefonnoControler,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: "Telefono", prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFielPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
          controller: con.passwordControler,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Contraseña",
            prefixIcon: Icon(Icons.lock),
          )),
    );
  }

  Widget _textFielConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
          controller: con.confirmPasswordControler,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Confirmar Contraseña",
            prefixIcon: Icon(Icons.lock),
          )),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () => con.register(context),
          child: const Text(
            "Register",
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _backButton() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 50,
        ),
      ),
    ));
  }

  Widget _imagenUser(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap: () {
            con.showAlertDialog(context);
          },
          child: GetBuilder<RegisterController>(
            builder: (value) => CircleAvatar(
              backgroundImage: con.imageFile != null
                  ? FileImage(con.imageFile!)
                  : const AssetImage("assets/img/user_profile.png")
                      as ImageProvider,
              radius: 60,
              backgroundColor: Colors.white,
            ),
          )),
    ));
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      child: const Text(
        "Ingresa tu informacion",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
