import 'package:flutter/material.dart';
import 'view/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStado(),
    theme: ThemeData(
     primarySwatch: Colors.green
    ),
  ));
}