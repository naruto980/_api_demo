import 'dart:convert';

import 'package:_api_demo/api%20manager/apimanager%20copy.dart';
import 'package:_api_demo/modal/demo_modal.dart';
import 'package:http/src/response.dart';

class Services {
  Future<Response> fetchUsers() async {
    var result = await api().getapi();
    return result;
  }

  Future<List<Demo>> fetchdata() async {
    List<Demo> user = [];
    var result = await Api_manager_().get_api();
    var jsondata = jsonDecode(result.body);
    user = List.from(jsondata['data'])
        .map((tagJson) => Demo.fromJson(tagJson))
        .toList();
    print(user);
    return user;
  }
}
