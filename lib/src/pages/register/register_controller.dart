import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/usersProviders.dart';
import '../../models/user.dart';
import '../../../src/models/response_api.dart';

class RegisterController extends GetxController {
  TextEditingController emailControler = TextEditingController();
  TextEditingController nombreControler = TextEditingController();
  TextEditingController apellidoControler = TextEditingController();
  TextEditingController telefonnoControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  UserProviders userProviders = UserProviders();
  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register(BuildContext context) async {
    String email = emailControler.text.trim();
    String nombre = nombreControler.text;
    String apellido = apellidoControler.text;
    String telefono = telefonnoControler.text.trim();
    String password = passwordControler.text.trim();
    String confirmPassword = confirmPasswordControler.text.trim();

    if (isValidForm(
        email, nombre, apellido, telefono, password, confirmPassword)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: "Rgeistrando ..");

      User user = User(
          email: email,
          name: nombre,
          lastname: apellido,
          phone: telefono,
          password: password);

      Stream stream = await userProviders.createWithImage(user, imageFile!);
      stream.listen((res) {
        progressDialog.close();
        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
        if (responseApi.success == true) {
          GetStorage().write("user", responseApi.data);
          goToHomePage();
        } else {
          Get.snackbar("Error", "Error al crear usuario");
        }
      });
    }
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  }

  bool isValidForm(String email, String nombre, String apellido,
      String telefono, String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar("Formulario no valido", "El email es requrido");
      return false;
    }

    if (imageFile == null) {
      Get.snackbar("Formulario no valido", "Debes seleccionar una imagen");
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

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: const Text(
          "Galeria",
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: const Text(
          "Camara",
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Selecciona una opcion"),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }
}
