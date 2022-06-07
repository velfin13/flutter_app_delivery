// ignore_for_file: file_names
import 'package:get/get.dart';
import '../../src/environment/environment.dart';
import '../../src/models/user.dart';
import '../../src/models/response_api.dart';

class UserProviders extends GetConnect {
  String url = Environment.API_URL + "/api/users";

  Future<Response> create(User user) async {
    Response response = await post("$url/create", user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        "$url/login", {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});
    if (response.body == null) {
      Get.snackbar("error", "Hubo un error");
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
