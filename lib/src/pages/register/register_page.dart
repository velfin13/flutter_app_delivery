import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
            _imagenUser(),
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
            _buttonRegister()
          ],
        )));
  }

  Widget _textFielEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Correo Electronico", prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFielNombre() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(hintText: "Nombre", prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFielLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: "Apellido", prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFielPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: "Telefono", prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFielPassword() {
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

  Widget _textFielConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Confirmar Contraseña",
            prefixIcon: Icon(Icons.lock),
          )),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () {},
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

  Widget _imagenUser() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 25),
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {},
        child: const CircleAvatar(
          backgroundImage: AssetImage("assets/img/user_profile.png"),
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
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
