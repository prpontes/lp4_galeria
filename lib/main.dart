import 'package:flutter/material.dart';
import 'package:teste/provider/provider_imagem.dart';
import 'view/home.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
        create: (context) => ImagemModel(),
        child: HomeStado()
    ),
    theme: ThemeData(
     primarySwatch: Colors.green
    ),
  ));
}