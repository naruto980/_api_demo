// ignore_for_file: file_names

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class api {
  Future<http.Response> getapi() async {
    var response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    return response;
  }
}

class Api_manager_ {
  Future<http.Response> get_api() async {
    var _responce =
        await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    return _responce;
  }
}
