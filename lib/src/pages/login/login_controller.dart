import 'package:flutter/cupertino.dart';
import 'package:flutter_app_delivery/src/models/response_api.dart';
import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:get_storage/get_storage.dart';
import '../../../src/providers/usersProviders.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  UserProviders userProviders = UserProviders();

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() async {
    String email = emailControler.text.trim();
    String password = passwordControler.text.trim();

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await userProviders.login(email, password);
      if (responseApi.success == true) {
        GetStorage().write("user", responseApi.data);
        User userSession = User.fromJson(GetStorage().read("user") ?? {});

        if (userSession.roles!.length > 1) {
          goToRolesPage();
        } else {
          goToClientProductListPage();
        }
      } else {
        Get.snackbar("Error de login", responseApi.message ?? "");
      }
    }
  }

  void goToClientProductListPage() {
    Get.offNamedUntil('/client/products/list', (route) => false);
  }

  void goToRolesPage() {
    Get.offNamedUntil('/roles', (route) => false);
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
