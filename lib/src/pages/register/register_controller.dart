import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../providers/usersProviders.dart';
import '../../models/user.dart';

class RegisterController extends GetxController {
  TextEditingController emailControler = TextEditingController();
  TextEditingController nombreControler = TextEditingController();
  TextEditingController apellidoControler = TextEditingController();
  TextEditingController telefonnoControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  UserProviders userProviders = UserProviders();

  void register() async {
    String email = emailControler.text.trim();
    String nombre = nombreControler.text;
    String apellido = apellidoControler.text;
    String telefono = telefonnoControler.text.trim();
    String password = passwordControler.text.trim();
    String confirmPassword = confirmPasswordControler.text.trim();

    if (isValidForm(
        email, nombre, apellido, telefono, password, confirmPassword)) {
      User user = User(
          email: email,
          name: nombre,
          lastname: apellido,
          phone: telefono,
          password: password);

      Response response = await userProviders.create(user);

      // Get.snackbar("Formulario valido", "Campos correctos");
    }
  }

  bool isValidForm(String email, String nombre, String apellido,
      String telefono, String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar("Formulario no valido", "El email es requrido");
      return false;
    }

    if (nombre.isEmpty) {
      Get.snackbar("Formulario no valido", "El Nombre es requrido");
      return false;
    }

    if (apellido.isEmpty) {
      Get.snackbar("Formulario no valido", "El Apellido es requrido");
      return false;
    }

    if (telefono.isEmpty) {
      Get.snackbar("Formulario no valido", "El Telefono es requrido");
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar("Formulario no valido", "La Contraseña es requrida");
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar("Formulario no valido", "Debes confirmar la contraseña");
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar("Formulario no valido", "Las contraseñas no son iguales");
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Formulario no valido", "El email no es valido!");
      return false;
    }
    return true;
  }
}
