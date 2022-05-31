// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: _textDontHaveSccount(),
        ),
        body: Stack(
          //El STACK Posisiona elementos uno encima del otro
          children: [
            _backgraundCover(context),
            _boxForm(context),
            Column(
              //el COLUMN posisiona los elementos de forma vertical
              children: [_imagenCover(), _textAppName()],
            )
          ],
        ));
  }

  Widget _backgraundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,
    );
  }

  Widget _textAppName() {
    return const Text(
      "Delivery Mysql",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 50,
            right: 50),
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
        ], color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.45,
        child: SingleChildScrollView(
            child: Column(
          children: [
            _TextYourInfo(),
            _TextFielEmail(),
            _TextFielPassword(),
            _buttonLogin()
          ],
        )));
  }

  Widget _TextFielEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Correo Electronico", prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _TextFielPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña",
            prefixIcon: Icon(Icons.lock),
          )),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _TextYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 50),
      child: const Text(
        "Ingresa tu informacion",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _textDontHaveSccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "No tienes cuenta",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(width: 7),
        Text(
          "Registrate aqui",
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 17),
        )
      ],
    );
  }

  Widget _imagenCover() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 20, bottom: 18),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/img/delivery.png",
        width: 130,
        height: 130,
      ),
    ));
  }
}
