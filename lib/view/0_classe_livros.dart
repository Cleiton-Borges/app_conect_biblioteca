class Livro {
  final String titulo;
  final String autor;
  final String imagem;

  Livro({required this.titulo, required this.autor, required this.imagem});
}

final List<Livro> livros = [
  Livro(
    titulo: "O REI LEÃO",
    autor: "Elizabeth Rudnick, Raquel Nakasone",
    imagem: "https://m.media-amazon.com/images/I/812jgrk3q+L.jpg",
  ),
  Livro(
    titulo: "DOM QUIXOTE",
    autor: "Miguel de Cervantes",
    imagem: "https://m.media-amazon.com/images/I/71MnClIKzkL.jpg",
  ),
  Livro(
    titulo: "DOM CASMURRO",
    autor: "Machado de Assis",
    imagem: "https://m.media-amazon.com/images/I/61x1ZHomWUL.jpg",
  ),
  Livro(
    titulo: "O CORTIÇO",
    autor: "Aluísio Azevedo",
    imagem: "https://m.media-amazon.com/images/I/61KSQiD6CsL.jpg",
  ),
  Livro(
    titulo: "O GUARANI",
    autor: "José de Alencar",
    imagem: "https://m.media-amazon.com/images/I/7125-MeD+KL.jpg",
  ),
  Livro(
    titulo: "FLUTTER NA PRÁTICA",
    autor: "Frank Zammetti",
    imagem: "https://m.media-amazon.com/images/I/412hbqfegrL._SY346_.jpg",
  ),
  Livro(
    titulo: "O GUIA DE DART",
    autor: "Julio Bitencourt",
    imagem: "https://m.media-amazon.com/images/I/51nn2rWyTVL.jpg",
  ),
  Livro(
    titulo: "INTRODUÇÃO A LINGUAGEM SQL",
    autor: "Thomas Nield",
    imagem: "https://m.media-amazon.com/images/I/711siL1zU1L.jpg",
  ),
  Livro(
    titulo: "A CULPA É DAS ESTRELAS",
    autor: "John Green",
    imagem: "https://m.media-amazon.com/images/I/61oIS8ewc9L.jpg",
  ),
];