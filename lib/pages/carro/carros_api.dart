import 'package:apfmiranda/pages/carro/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async{

    final carros  = List<Carro>();
    
    await Future.delayed(Duration(seconds: 2));

    carros.add(Carro(nome: "Lamborghini Aventador", urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png"));
    carros.add(Carro(nome: "Chevrolet Corvette Z06", urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Chevrolet_Corvette_Z06.png"));
    carros.add(Carro(nome: "BMW M5", urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/BMW.png"));

    return carros;

  }
}
