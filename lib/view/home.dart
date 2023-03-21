import 'package:flutter/material.dart';
import '../data/banco.dart';
import 'tela_grid_imagens.dart';
import 'tela_imagem.dart';
import 'tela_listagem_imagens.dart';

class HomeStado extends StatefulWidget {
  Banco? bd;
  HomeStado({Key? key, this.bd}) : super(key: key);

  @override
  State<HomeStado> createState() => _HomeStadoState();
}

class _HomeStadoState extends State<HomeStado> {

  int barraNavegacaoIndex = 0;
  var telaImagem;
  var telaListagemImagens;
  var telaGridImagens;

  List<Widget>? telas;

  @override
  Widget build(BuildContext context) {

    telaImagem = TelaImagem(bd: widget.bd,);
    telaListagemImagens = ListagemImagens(bd: widget.bd,);
    telaGridImagens = GridImagens();

    telas = [telaImagem, telaListagemImagens, telaGridImagens];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de imagens"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
                  children: const [
                    CircleAvatar(
                      child: Icon(Icons.account_circle),
                    ),
                    ListTile(
                      title: Text("Nome do usuario"),
                      subtitle: Text("usuario@usuario.com.br"),
                    )
                  ],
                )
            ),
            const ListTile(
              leading: Icon(Icons.image),
              title: Text("Galeria"),
            ),
            const ListTile(
              leading: Icon(Icons.account_box),
              title: Text("Usuário"),
            ),
            const Divider(
              color: Colors.black,
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
            ),
          ],
        ),
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
            label: "listagem",
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
