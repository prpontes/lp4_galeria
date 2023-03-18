import 'package:flutter/material.dart';
import 'package:teste/tela_grid_imagens.dart';
import 'package:teste/tela_imagem.dart';
import 'tela_listagem_imagens.dart';

class HomeStado extends StatefulWidget {
  const HomeStado({Key? key}) : super(key: key);

  @override
  State<HomeStado> createState() => _HomeStadoState();
}

class _HomeStadoState extends State<HomeStado> {

  int barraNavegacaoIndex = 0;
  final telaImagem = TelaImagem();
  final telaListagemImagens = ListagemImagens();
  final telaGridImagens = GridImagens();

  List<Widget>? telas;

  @override
  Widget build(BuildContext context) {

    telas = [telaImagem, telaListagemImagens, telaGridImagens];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de imagens"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: telas!.elementAt(barraNavegacaoIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: "imagem",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "lista",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_4x4),
            label: "grid",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "configuração",
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: barraNavegacaoIndex,
        selectedItemColor: Colors.black,
        onTap: (index){
          setState(() {
            barraNavegacaoIndex = index;
          });
        },
      ),
    );
  }
}
