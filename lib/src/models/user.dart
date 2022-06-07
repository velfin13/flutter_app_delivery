// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? name;
  String? image;
  String? lastname;
  String? phone;
  String? password;
  String? sesion_token;

  User({
    this.id,
    this.email,
    this.name,
    this.image,
    this.lastname,
    this.phone,
    this.password,
    this.sesion_token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        image: json["image"],
        lastname: json["lastname"],
        phone: json["phone"],
        password: json["password"],
        sesion_token: json["sesion_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "image": image,
        "lastname": lastname,
        "phone": phone,
        "password": password,
        "sesion_token": sesion_token,
      };
}
