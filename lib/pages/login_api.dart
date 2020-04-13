import 'dart:convert';

import 'package:apfmiranda/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String login, String senha) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map params =  {
      "username": login,
      "password": senha
    };

    String s = json.encode(params);
    var response = await http.post(url, body: s, headers: headers );

    Map mapResponse = json.decode(response.body);
    return Usuario.fromJson(mapResponse);
  }
}
