// ignore_for_file: file_names
import 'package:get/get.dart';
import '../../src/environment/environment.dart';
import '../../src/models/user.dart';

class UserProviders extends GetConnect {
  String url = Environment.API_URL + "/api/users";

  Future<Response> create(User user) async {
    Response response = await post("$url/create", user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<Response> test() async {
    Response response = await get("$url/");
    return response;
  }

}
