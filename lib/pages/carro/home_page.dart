import 'package:apfmiranda/pages/carro/carro.dart';
import 'package:apfmiranda/pages/carro/carros_api.dart';
import 'package:apfmiranda/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();
    
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context,index){
            Carro c = carros[index];
            return Card(
              color: Colors.grey[150],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto,
                        width: 150,
                      ),
                    ),
                    Text(
                        c.nome,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Descrição...",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () { /* ... */ },
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),

                  ]
                ),
              ),
            );


          }),
    );
  }
}
