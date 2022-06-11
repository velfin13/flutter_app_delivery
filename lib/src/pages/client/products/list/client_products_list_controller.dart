import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProductsListController extends GetxController {
  var indexTab = 0.obs;

  void changeTab(int indice) {
    indexTab.value = indice;
  }

  void logOut() {
    GetStorage().remove("user");
    Get.offNamedUntil('/', (route) => false); //elimina el hitorial de pantallas
  }
}
