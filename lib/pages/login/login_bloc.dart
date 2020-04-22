import 'dart:async';

import 'package:apfmiranda/pages/api_response.dart';
import 'package:apfmiranda/pages/carro/simple_bloc.dart';
import 'package:apfmiranda/pages/login/login_api.dart';
import 'package:apfmiranda/pages/login/usuario.dart';

class LoginBloc extends SimpleBloc<bool>{

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    add(true);

    ApiResponse response = await LoginApi.login(login, senha ) ;

    add(false);

    return response;
  }

}