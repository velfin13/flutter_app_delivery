import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../../../src/models/user.dart';

class ClientProfileUpdateController extends GetxController {
  User user = User.fromJson(GetStorage().read("user"));

  TextEditingController nombreControler = TextEditingController();
  TextEditingController apellidoControler = TextEditingController();
  TextEditingController telefonnoControler = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  ClientProfileUpdateController() {
    nombreControler.text = user.name ?? "";
    apellidoControler.text = user.lastname ?? "";
    telefonnoControler.text = user.phone ?? "";
  }

  bool isValidForm(String nombre, String apellido, String telefono) {
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
    return true;
  }

  void actualizarInfo(BuildContext context) async {
    String nombre = nombreControler.text;
    String apellido = apellidoControler.text;
    String telefono = telefonnoControler.text.trim();

    if (isValidForm(nombre, apellido, telefono)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: "Actualizando ..");

      User myUser =
          User(id: user.id, name: nombre, lastname: apellido, phone: telefono);

      // Stream stream = await userProviders.createWithImage(user, imageFile!);
      // stream.listen((res) {
      //   progressDialog.close();
      //   ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
      //   if (responseApi.success == true) {
      //     GetStorage().write("user", responseApi.data);
      //     goToClientProductListPage();
      //   } else {
      //     Get.snackbar("Error", "Error al crear usuario");
      //   }
      // });
    }
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
