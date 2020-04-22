import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

class CarroPage extends StatelessWidget {

  Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.carro.nome)
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(this.carro.urlFoto),
              Text(
                this.carro.descricao ?? "Sem descrição",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),)
            ],
          ),
        );

  }
}
