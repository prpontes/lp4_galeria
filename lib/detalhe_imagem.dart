import 'package:flutter/material.dart';

import 'imagem.dart';

class DetalheImagem extends StatefulWidget {

  Imagem? img;
  DetalheImagem({Key? key, this.img}) : super(key: key);

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
              onPressed: (){},
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
