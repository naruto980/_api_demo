// To parse this JSON data, do
//
//     final demo = demoFromJson(jsonString);

import 'dart:convert';

Demo demoFromJson(String str) => Demo.fromJson(json.decode(str));

String demoToJson(Demo data) => json.encode(data.toJson());

class Demo {
  Demo({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Demo.fromJson(Map<String, dynamic> json) => Demo(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
