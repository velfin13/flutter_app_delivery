import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProfileInfoController extends GetxController {
  User user = User.fromJson(GetStorage().read("user"));

  void test() {
    print(user.toJson());
  }
}
