import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../src/models/user.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read("user") ?? {});
  HomeController() {
    // print(user.toJson());
  }

  void logOut() {
    GetStorage().remove("user");
    Get.offNamedUntil('/', (route) => false); //elimina el hitorial de pantallas
  }
}
