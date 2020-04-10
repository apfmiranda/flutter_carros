import 'package:apfmiranda/widgets/app_button.dart';
import 'package:apfmiranda/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _focusSenha = FocusScopeNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body()
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText("Login", "Digite o login", controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(height: 10,),
            AppText("Senha", "Digite a senha", controller: _tSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.none,
              focusNode: _focusSenha,
            ),
            SizedBox(height: 20,),
            AppButton("Login", onPressed: _onClickLogin)
          ],
        ),
      ),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }


  _onClickLogin() {
    if(!_formKey.currentState.validate()){
      return;
    }
    String login  = _tLogin.text;
    String senha  = _tSenha.text;
    print("Login: $login, Senha: $senha");
  }
}
