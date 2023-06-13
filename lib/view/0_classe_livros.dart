class Livros {
  final String titulo;
  final String autor;
  final String imagem;

  Livros({required this.titulo, required this.autor, required this.imagem});
}

final List<Livros> livros = [
  Livros(
    titulo: "O REI LEÃO",
    autor: "Elizabeth Rudnick, Raquel Nakasone",
    imagem: "https://m.media-amazon.com/images/I/812jgrk3q+L.jpg",
  ),
  Livros(
    titulo: "DOM QUIXOTE",
    autor: "Miguel de Cervantes",
    imagem: "https://m.media-amazon.com/images/I/71MnClIKzkL.jpg",
  ),
  Livros(
    titulo: "DOM CASMURRO",
    autor: "Machado de Assis",
    imagem: "https://m.media-amazon.com/images/I/61x1ZHomWUL.jpg",
  ),
  Livros(
    titulo: "O CORTIÇO",
    autor: "Aluísio Azevedo",
    imagem: "https://m.media-amazon.com/images/I/61KSQiD6CsL.jpg",
  ),
  Livros(
    titulo: "O GUARANI",
    autor: "José de Alencar",
    imagem: "https://m.media-amazon.com/images/I/7125-MeD+KL.jpg",
  ),
  Livros(
    titulo: "FLUTTER NA PRÁTICA",
    autor: "Frank Zammetti",
    imagem: "https://m.media-amazon.com/images/I/412hbqfegrL._SY346_.jpg",
  ),
  Livros(
    titulo: "O GUIA DE DART",
    autor: "Julio Bitencourt",
    imagem: "https://m.media-amazon.com/images/I/51nn2rWyTVL.jpg",
  ),
  Livros(
    titulo: "INTRODUÇÃO A LINGUAGEM SQL",
    autor: "Thomas Nield",
    imagem: "https://m.media-amazon.com/images/I/711siL1zU1L.jpg",
  ),
  Livros(
    titulo: "A CULPA É DAS ESTRELAS",
    autor: "John Green",
    imagem: "https://m.media-amazon.com/images/I/61oIS8ewc9L.jpg",
  ),
];