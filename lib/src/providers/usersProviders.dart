// ignore_for_file: file_names
import 'package:get/get.dart';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
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

  Future<Stream> createWithImage(User user, File imagen) async {
    Uri uri = Uri.http(Environment.API_URL_OLD, "/api/users/createWithImage");
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile('image',
        http.ByteStream(imagen.openRead().cast()), await imagen.length(),
        filename: basename(imagen.path)));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }
}
