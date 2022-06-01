import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() {
    String email = emailControler.text.trim();
    String password = passwordControler.text.trim();

    if (isValidForm(email, password)) {
      Get.snackbar("Formulario valido", "Campos correctos");
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar("Formulario no valido", "El email es requrido");
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Formulario no valido", "El email no es valido!");
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar("Formulario no valido", "La contraseña es requrida");
      return false;
    }
    return true;
  }
}
