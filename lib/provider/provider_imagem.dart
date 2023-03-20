import 'package:flutter/foundation.dart';
import '../model/imagem.dart';

class ImagemModel extends ChangeNotifier
{
  final List<Imagem> _imagem = [];

  set imagem(Imagem img){
    _imagem.add(img);

    notifyListeners();
  }

  List<Imagem> get listaImagem => _imagem;
}