import 'dart:convert';

import 'package:apfmiranda/pages/carro/carro.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<Carro>> getCarros() async{
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';

    var response = await http.get(url);
    List list = json.decode(response.body);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    return carros;

  }
}
