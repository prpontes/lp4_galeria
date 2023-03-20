import 'package:flutter/material.dart';
import '../data/banco.dart';
import '../model/imagem.dart';
import '../provider/provider_imagem.dart';
import 'detalhe_imagem.dart';
import 'package:provider/provider.dart';

class TelaImagem extends StatefulWidget {
  Banco? bd;

  TelaImagem({Key? key, this.bd}) : super(key: key);

  @override
  State<TelaImagem> createState() => _TelaImagemState();
}

class _TelaImagemState extends State<TelaImagem> {


  int cont = 0;
  int barraNavegacaoIndex = 0;

  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerUrl = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Imagem> imagem = [];

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    iniBanco();
  }

  Future<void> iniBanco() async {
    await widget.bd!.inserirImagem(Imagem(url: "https://images.pexels.com/photos/1006121/pexels-photo-1006121.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", descricao: "imagem 1", titulo: "imagem 1"));
    await widget.bd!.inserirImagem(Imagem(url: "https://images.pexels.com/photos/1486974/pexels-photo-1486974.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", descricao: "imagem 2", titulo: "imagem 2"));
    await widget.bd!.inserirImagem(Imagem(url: "https://images.pexels.com/photos/1032653/pexels-photo-1032653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", descricao: "imagem 3", titulo: "imagem 3"));
    await carregarImagens();
  }

  Future<void> carregarImagens() async{
    imagem = await widget.bd!.obterImagens();

    carregarProvider();
    setState((){
      imagem;
    });
  }

  void carregarProvider(){
    Provider.of<ImagemModel>(context, listen: false).listaImagem = imagem;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        if(cont > 0) {
                          cont = cont - 1;
                        }
                      }
                      );
                    },
                    child: Text("<<"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 30),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        if(cont<imagem.length-1) {
                          cont = cont + 1;
                        }
                      }
                      );
                    },
                    child: Text(">>"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 30),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: imagem.isEmpty ? Text("carregando...") :
                    GestureDetector(
                        onTap: () async {
                          final id = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetalheImagem(img: imagem[cont], bd: widget.bd,)
                              )
                          );
                          if(id != null){
                            widget.bd!.deletaImagem(id);
                          }
                          carregarImagens();
                        },
                        child: Image.network(imagem[cont].url, height: 400,)
                    ),
                  ),
                  imagem.isEmpty ? Text("carregando...") :Text(imagem[cont].descricao)
                ],
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Nova imagem"),
                  content:  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
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
                            decoration: InputDecoration(
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
                            decoration: InputDecoration(
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
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            imagem.add(
                                Imagem(
                                    url: _controllerUrl.text,
                                    descricao: _controllerDescricao.text,
                                    titulo: _controllerTitulo.text
                                )
                            );
                            _controllerDescricao.clear();
                            _controllerUrl.clear();
                            _controllerTitulo.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Salvar")
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
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
