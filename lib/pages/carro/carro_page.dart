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
        title: Text(this.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected:_onClickPopupMenu,
            itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(value: "Editar", child: Text("Editar"),),
              PopupMenuItem(value: "Deletar", child: Text("Deletar"),),
              PopupMenuItem(value: "Share", child: Text("Share"),),
            ];
          },
            
          )

        ],
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

  void _onClickMapa() {
  }

  void _onClickVideo() {
  }

  _onClickPopupMenu(String value) {
    switch(value) {
      case "Editar":
        print("editar");
        break;
      case "Deletar":
        print("deletar");
        break;
      case "Share":
        print("Share");
        break;
    }
  }
}
