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
    Future<List<Carro>> carros = CarrosApi.getCarros();
    
    return FutureBuilder(
      future: carros, builder: (context, snapshot) {
        List<Carro> carros = snapshot.data;
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        return _listView(carros);
    },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
    padding: EdgeInsets.all(16),
    child: ListView.builder(
        itemCount: carros != null ? carros.length: 0,
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
