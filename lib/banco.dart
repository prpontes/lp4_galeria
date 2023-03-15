import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'imagem.dart';

class Banco{

  Future<Database>? database;

  Future<void> CriarBanco() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'bancoimagem.db'),
      onCreate: (db, version){
        return db.execute(
          'CREATE TABLE imagem(id INTEGER PRIMARY KEY, url TEXT, titulo TEXT, descricao TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> inserirImagem(Imagem img) async{
    final db = await database;

    await db!.insert(
        'imagem',
        img.toMap()
    );
  }

  Future<List<Imagem>> obterImagens() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db!.query('imagem');

    // converte a lista de map para uma lista de imagens
    return List.generate(maps.length, (index) {
        return Imagem(
          id: maps[index]['id'],
          url: maps[index]['url'],
          titulo: maps[index]['titulo'],
          descricao: maps[index]['descricao'],
        );
      }
    );
  }

}