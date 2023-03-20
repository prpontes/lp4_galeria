import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/imagem.dart';

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

  Future<void> atualizarImagem(Imagem img) async{
    final db = await database;

    await db!.update(
        'imagem',
        img.toMap(),
        where: 'id = ?',
        whereArgs: [img.id],
    );
  }

  Future<void> deletaImagem(int id) async{
    final db = await database;

    await db!.delete(
        'imagem',
        where: 'id = ?',
        whereArgs: [id],
    );
  }

  Future<Imagem> obterImagem(int id) async{
    final db = await database;

    final List<Map<String, dynamic>> maps = await db!.query('imagem', where: "id = ?", whereArgs: [id]);

    Imagem? img;
    if(maps.isNotEmpty) {
      img = Imagem(
          id: maps.first['id'],
          url: maps.first['url'],
          titulo: maps.first['titulo'],
          descricao: maps.first['descricao']
      );
    }
    return img!;
  }
}