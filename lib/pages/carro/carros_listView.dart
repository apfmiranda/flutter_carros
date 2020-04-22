import 'dart:async';

import 'package:apfmiranda/pages/carro/carro.dart';
import 'package:apfmiranda/pages/carro/carro_page.dart';
import 'package:apfmiranda/pages/carro/carros_api.dart';
import 'package:apfmiranda/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {
  String tipo;
  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}


class _CarrosListViewState extends State<CarrosListView> with AutomaticKeepAliveClientMixin<CarrosListView>{

  List<Carro> carros;
  final _streamController = StreamController<List<Carro>>();

  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    List<Carro> carros = await CarrosApi.getCarros(widget.tipo);
    _streamController.add(carros);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text(
                "Não foi possível ober lista de carros",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 22
                )
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return _listView(carros);
      },
    );


  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (context, index) {
            Carro c = carros[index];
            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image.network(
                          c.urlFoto ??
                              "http://storage.googleapis.com/carros-flutterweb.appspot.com/IMG_20200412_112527.jpg",
                          width: 150,
                        ),
                      ),
                      Text(
                        c.nome ?? "Sem nome",
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
                            onPressed: () {
                              push(context, CarroPage(c));
                            },
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ]),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }


}
