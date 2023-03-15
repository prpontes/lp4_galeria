import 'package:flutter/material.dart';

class DetalheImagem extends StatefulWidget {
  const DetalheImagem({Key? key}) : super(key: key);

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
              onPressed: (){},
              icon: Icon(Icons.delete)
          ),
        ],
      ),
      body: Container(),
    );
  }
}
