
class Imagem{
  String? _url;
  String? _descricao;

  Imagem(String url, String descricao){
    this._url = url;
    this._descricao = descricao;
  }

  String get url => this._url!;
  set url(String url){
    this._url = url;
  }

  String get descricao => this._descricao!;
  set descricao(String d){
    this._descricao = d;
  }
}