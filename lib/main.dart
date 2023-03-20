import 'package:flutter/material.dart';
import 'package:teste/provider/provider_imagem.dart';
import 'data/banco.dart';
import 'view/home.dart';
import 'package:provider/provider.dart';

void main() async {
  Banco bd = Banco();
  await bd.CriarBanco();

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