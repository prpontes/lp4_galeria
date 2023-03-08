import 'package:flutter/material.dart';
import 'imagem.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStado(),
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
  ));
}

class HomeStado extends StatefulWidget {
  const HomeStado({Key? key}) : super(key: key);

  @override
  State<HomeStado> createState() => _HomeStadoState();
}

class _HomeStadoState extends State<HomeStado> {
  int cont = 0;

  TextEditingController _controllerTitulo = TextEditingController();
  TextEditingController _controllerUrl = TextEditingController();
  TextEditingController _controllerDescricao = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Imagem> imagem = [
    Imagem("https://images.pexels.com/photos/1006121/pexels-photo-1006121.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "imagem 1"),
    Imagem("https://images.pexels.com/photos/1486974/pexels-photo-1486974.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "imagem 2"),
    Imagem("https://images.pexels.com/photos/1032653/pexels-photo-1032653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "imagem 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de imagens"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        child: Image.network(imagem[cont].url, height: 450,),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                      ),
                    ),
                    Text(imagem[cont].descricao)
                  ],
                ),
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
                )
              ],
            ),
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
                                      _controllerUrl.text,
                                      _controllerDescricao.text)
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
