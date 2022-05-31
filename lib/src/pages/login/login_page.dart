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
