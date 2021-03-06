import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProfileInfoController extends GetxController {
  var user = User.fromJson(GetStorage().read("user")).obs;
  

  void logOut() {
    GetStorage().remove("user");
    Get.offNamedUntil('/', (route) => false); //elimina el hitorial de pantallas
  }

  void goToUpdateProfile() {
    Get.toNamed("/client/profile/update");
  }
}
