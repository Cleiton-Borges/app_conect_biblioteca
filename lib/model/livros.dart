class Livro {
  final String uid;
  final String imagem;
  final String titulo;
  final String autor;

  Livro(this.uid, this.imagem, this.titulo, this.autor);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'imagem': imagem,
      'titulo': titulo,
      'autor': autor,
    };
  }

  factory Livro.fromJson(Map<String, dynamic> json) {
    return Livro(
      json['uid'],
      json['imagem'],
      json['titulo'],
      json['autor'],
    );
  }
}
