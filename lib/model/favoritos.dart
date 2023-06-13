class Favorito {
  final String uid;
  final String imagem;
  final String titulo;
  final String autor;
  final bool isFavorito;

  Favorito(this.uid, this.imagem, this.titulo, this.autor, this.isFavorito);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'imagem': imagem,
      'titulo': titulo,
      'autor': autor,
      'favorito': isFavorito
    };
  }

  factory Favorito.fromJson(Map<String, dynamic> json) {
    return Favorito(
      json['uid'],
      json['imagem'],
      json['titulo'],
      json['autor'],
      json['favorito']
    );
  }
}
