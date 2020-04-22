import 'dart:async';

import 'package:apfmiranda/pages/carro/carro.dart';
import 'package:apfmiranda/pages/carro/carros_api.dart';

class CarrosBloc {

  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  fetch(String tipo) async {
    List<Carro> carros = await CarrosApi.getCarros(tipo);
    _streamController.add(carros);
  }

  void dispose() {
    _streamController.close();
  }
}