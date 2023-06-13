import 'package:app_conect_biblioteca/Controller/favoritos_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/livros_controller.dart';
import '../Controller/login_controller.dart';
import '../Controller/tela_controller.dart';
import '../model/favoritos.dart';
import '../model/livros.dart';
import '0_classe_livros.dart';
import '1_tela_login.dart';

class TelaHomeUser extends StatefulWidget {
  const TelaHomeUser({super.key});

  @override
  State<TelaHomeUser> createState() => _TelaHomeUserState();
}

class _TelaHomeUserState extends State<TelaHomeUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _opcaoSelecionada = 0;
  final List<bool> _favoritos = [];
  var txtimagem = TextEditingController();
  var txttitulo = TextEditingController();
  var txtautor = TextEditingController();
  var _pesquisarTitulo = '';
  bool orderByTitulo = false;

  void _abrirDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: buildEndDrawer(context),
      key: _scaffoldKey,
      body: BackgroundImage(
          imagePath: 'lib/images/Livro.png',
          child: Column(children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _pesquisarTitulo = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Procurar Livros',
                    hintText: 'Informe o nome do Livro',
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Ação a ser executada quando o ícone for clicado
                      },
                    ),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      orderByTitulo = !orderByTitulo;
                    });
                  },
                  icon: Icon(
                    orderByTitulo ? Icons.arrow_downward : Icons.sort_by_alpha_outlined,
                  ),
                  label: orderByTitulo ? Text('A-Z') : Text('Ordernar de A-Z'),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              //child: Text('Nenhum Livro Encontrado')
              child: Container(
                child: (() {
                  if (_pesquisarTitulo == '') {
                    return listarLivros();
                  } else {
                    return listaPesquisa(_pesquisarTitulo);
                  }
                })(),
              ),
            )
          ])),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao) {
          setState(() {
            _opcaoSelecionada = opcao;
          });

          if (opcao == 1) Navigator.popAndPushNamed(context, 'favorito');
          if (opcao == 2) Navigator.popAndPushNamed(context, 'reserva');
          if (opcao == 3) _abrirDrawer();
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black, size: 40),
            label: 'Início',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: Colors.black, size: 40),
            label: 'Favorito',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined, color: Colors.black, size: 40),
            label: 'Reserva',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.black, size: 40),
            label: 'Menu',
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

  listarLivros() {
    Query query = LivrosController().listarAdmin();

    if (orderByTitulo) {
      query = query.orderBy('titulo');
    }

    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text('Não foi possível conectar.'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            final dados = snapshot.requireData;
            if (dados.size > 0) {
              return GridView.builder(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                itemCount: dados.size,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  String id = dados.docs[index].id;
                  dynamic item = dados.docs[index].data();
                  if (_favoritos.length <= index) {
                    _favoritos.add(
                        false); // Inicializa o estado do favorito para cada livro
                  }
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item['imagem'],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['titulo'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  item['autor'],
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    _favoritos[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        _favoritos[index] ? Colors.red : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _favoritos[index] = !_favoritos[
                                          index]; // Altera o estado do favorito para o livro correspondente
                                    });
                                    var f = Favorito(
                                        LoginController().idUsuario(),
                                        txtimagem.text = item['imagem'],
                                        txttitulo.text = item['titulo'],
                                        txtautor.text = item['autor'],
                                        _favoritos[index]);
                                    FavoritosController().adicionar(context, f);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Nenhum Livro encontrado.'),
              );
            }
        }
      },
    );
  }
  listaPesquisa(pesquisa) {
    String pesquisaUpperCase = pesquisa.toUpperCase();
    Query query = LivrosController().pesquisarLivros(pesquisaUpperCase);

    if ((orderByTitulo) && (pesquisa == '')) {
      query = query.orderBy('titulo');
    }

    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text('Não foi possível conectar.'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            final dados = snapshot.requireData;
            if (dados.size > 0) {
              return GridView.builder(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                itemCount: dados.size,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  String id = dados.docs[index].id;
                  dynamic item = dados.docs[index].data();
                  if (_favoritos.length <= index) {
                    _favoritos.add(
                        false); // Inicializa o estado do favorito para cada livro
                  }
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item['imagem'],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['titulo'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  item['autor'],
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    _favoritos[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        _favoritos[index] ? Colors.red : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _favoritos[index] = !_favoritos[
                                          index]; // Altera o estado do favorito para o livro correspondente
                                    });
                                    var f = Favorito(
                                        LoginController().idUsuario(),
                                        txtimagem.text = item['imagem'],
                                        txttitulo.text = item['titulo'],
                                        txtautor.text = item['autor'],
                                        _favoritos[index]);
                                    FavoritosController().adicionar(context, f);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Nenhum Livro Pesquisado encontrado.'),
              );
            }
        }
      },
    );
  }
}
