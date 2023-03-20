import 'package:flutter/material.dart';
import 'package:teste/provider/provider_imagem.dart';
import 'data/banco.dart';
import 'model/imagem.dart';
import 'view/home.dart';
import 'package:provider/provider.dart';

void main() async {
  Banco bd = Banco();
  await bd.CriarBanco();
  await bd.inserirImagem(Imagem(url: "https://images.pexels.com/photos/1006121/pexels-photo-1006121.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", descricao: "imagem 1", titulo: "imagem 1"));
  await bd.inserirImagem(Imagem(url: "https://images.pexels.com/photos/1486974/pexels-photo-1486974.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", descricao: "imagem 2", titulo: "imagem 2"));
  await bd.inserirImagem(Imagem(url: "https://images.pexels.com/photos/1032653/pexels-photo-1032653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", descricao: "imagem 3", titulo: "imagem 3"));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
        create: (context) => ImagemModel(),
        child: HomeStado(bd: bd,)
    ),
    theme: ThemeData(
     primarySwatch: Colors.green
    ),
  ));
}