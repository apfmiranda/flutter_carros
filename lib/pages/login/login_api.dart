import 'dart:convert';

import 'package:apfmiranda/pages/api_response.dart';
import 'package:apfmiranda/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params =  {
        "username": login,
        "password": senha
      };

      String s = json.encode(params);
      var response = await http.post(url, body: s, headers: headers );

      Map mapResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();


        return ApiResponse.ok(Usuario.fromJson(mapResponse));
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch(error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível efetuar o login");
    }


  }
}
