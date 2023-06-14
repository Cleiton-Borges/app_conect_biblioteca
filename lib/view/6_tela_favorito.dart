import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/favoritos_controller.dart';
import '../Controller/tela_controller.dart';

class TelaFavorito extends StatefulWidget {
  const TelaFavorito({super.key});

  @override
  State<TelaFavorito> createState() => _TelaFavoritoState();
}

class _TelaFavoritoState extends State<TelaFavorito> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _opcaoSelecionada = 1;
  final List<bool> _favoritos = [];

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
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Meus Favoritos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: listarFavoritos(),
            )
          ])
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao) {
          setState(() {
            _opcaoSelecionada = opcao;
          });

          if (opcao == 0) if (FirebaseAuth.instance.currentUser!.email ==
              'admin@gmail.com') {
            Navigator.popAndPushNamed(context, 'homeAdmin');
          } else {
            Navigator.popAndPushNamed(context, 'home');
          }
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

  listarFavoritos() {
    Query query = FavoritosController().listar();

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
                        true); // Inicializa o estado do favorito para cada livro
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
                                  onPressed: () {
                                    setState(() {
                                      _favoritos[index] = !_favoritos[
                                          index]; // Altera o estado do favorito para o livro correspondente
                                    });
                                    FavoritosController()
                                        .excluir(context, id);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
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
                child: Text('Nenhum livro encontrado.'),
              );
            }
        }
      },
    );
  }
}
