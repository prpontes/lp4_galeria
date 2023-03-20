import 'package:flutter/foundation.dart';
import '../model/imagem.dart';

class ImagemModel extends ChangeNotifier
{
  List<Imagem> _imagem = [];

  set imagem(Imagem img){
    _imagem.add(img);

    notifyListeners();
  }

  set listaImagem(List<Imagem> img){
    _imagem = img;

    notifyListeners();
  }
  List<Imagem> get listaImagem => _imagem;
}