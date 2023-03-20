import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/banco.dart';
import '../model/imagem.dart';
import '../provider/provider_imagem.dart';
import 'detalhe_imagem.dart';

class ListagemImagens extends StatefulWidget {
  Banco? bd;
  ListagemImagens({Key? key, this.bd}) : super(key: key);

  @override
  State<ListagemImagens> createState() => _ListagemImagensState();
}

class _ListagemImagensState extends State<ListagemImagens> {

  List<Imagem> listaimg = [];

  @override
  Widget build(BuildContext context) {

    listaimg = Provider.of<ImagemModel>(context, listen: true).listaImagem;

    return ListView.builder(
      itemCount: listaimg.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(listaimg[index].titulo),
            subtitle: Text(listaimg[index].descricao),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listaimg[index].url),
            ),
            onTap: ()async {
              final id = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetalheImagem(img: listaimg[index], bd: widget.bd,)
                  )
              );
              if(id != null){
                widget.bd!.deletaImagem(id);
              }
            },
          );
        },
    );
  }
}
