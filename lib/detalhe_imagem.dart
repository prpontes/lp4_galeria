import 'package:flutter/material.dart';

import 'banco.dart';
import 'imagem.dart';

class DetalheImagem extends StatefulWidget {

  Imagem? img;
  Banco? bd;
  DetalheImagem({Key? key, this.img, this.bd}) : super(key: key);

  @override
  State<DetalheImagem> createState() => _DetalheImagemState();
}

class _DetalheImagemState extends State<DetalheImagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe imagem"),
        actions: [
          IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (contexto){
                      return AlertDialog(

                      );
                    }
                );
              },
              icon: Icon(Icons.edit)
          ),
          IconButton(
              onPressed: (){
                Navigator.pop(context, widget.img!.id);
              },
              icon: Icon(Icons.delete)
          ),
        ],
      ),
      body: Container(),
    );
  }
}
