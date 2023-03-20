import 'package:flutter/material.dart';

import '../data/banco.dart';
import '../model/imagem.dart';

class DetalheImagem extends StatefulWidget {

  Imagem? img;
  Banco? bd;
  DetalheImagem({Key? key, this.img, this.bd}) : super(key: key);

  @override
  State<DetalheImagem> createState() => _DetalheImagemState();
}

class _DetalheImagemState extends State<DetalheImagem> {

  TextEditingController _controllerTitulo = TextEditingController();
  TextEditingController _controllerUrl = TextEditingController();
  TextEditingController _controllerDescricao = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void carregarImagem() async{

    widget.img = await widget.bd!.obterImagem(widget.img!.id);

    setState(() {
      widget.img;
    });
  }

  void formulario(){
    _controllerTitulo.text = widget.img!.titulo;
    _controllerUrl.text = widget.img!.url;
    _controllerDescricao.text = widget.img!.descricao;

    showDialog(
        context: context,
        builder: (contexto){
          return AlertDialog(
            title: Text("Editar imagem"),
            content:  Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Título",
                          hintText: "Digite um título"
                      ),
                      controller: _controllerTitulo,
                      validator: (campoTitulo){
                        if(campoTitulo == null || campoTitulo.isEmpty) {
                          return "Preencha o título";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                          labelText: "URL",
                          hintText: "Digite a url"
                      ),
                      controller: _controllerUrl,
                      validator: (campoUrl){
                        if(campoUrl == null || campoUrl.isEmpty) {
                          return "Preencha a url";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Descrição",
                          hintText: "Digite uma descrição"
                      ),
                      controller: _controllerDescricao,
                      validator: (campoDescricao){
                        if(campoDescricao == null || campoDescricao.isEmpty) {
                          return "Preencha a descrição";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      await widget.bd!.atualizarImagem(
                          Imagem(
                              id: widget.img!.id,
                              url: _controllerUrl.text,
                              descricao: _controllerDescricao.text,
                              titulo: _controllerTitulo.text
                          )
                      );
                      widget.img = await widget.bd!.obterImagem(widget.img!.id);
                      _controllerDescricao.clear();
                      _controllerUrl.clear();
                      _controllerTitulo.clear();
                      Navigator.pop(context);

                      setState(() {
                        widget.img;
                      });
                    }
                  },
                  child: Text("Editar")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe imagem"),
        actions: [
          IconButton(
              onPressed: (){
                formulario();
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
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Título",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(widget.img!.titulo,
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              title: const Text("Url",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(widget.img!.url,
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              title: const Text("Descrição",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(widget.img!.descricao,
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
