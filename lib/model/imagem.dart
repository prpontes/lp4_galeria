class Imagem{
  int? _id;
  String? _url;
  String? _descricao;
  String? _titulo;

  Imagem({int? id, required String url, required String descricao, String? titulo}){
    _id = id;
    _url = url;
    _descricao = descricao;
    _titulo = titulo;
  }

  int get id => _id!;

  String get url => _url!;
  set url(String url){
    _url = url;
  }

  String get descricao => _descricao!;
  set descricao(String d){
    _descricao = d;
  }

  String get titulo => _titulo!;
  set titulo(String t){
    _titulo = t;
  }

  Map<String, dynamic> toMap(){
    return {
      'id': _id,
      'url': _url,
      'titulo': _titulo,
      'descricao': _descricao
    };
  }
}