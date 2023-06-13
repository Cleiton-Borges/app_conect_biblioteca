import 'package:app_conect_biblioteca/Controller/tela_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '0_classe_livros.dart';

class TelaNotificacao extends StatefulWidget {
  const TelaNotificacao({super.key});

  @override
  State<TelaNotificacao> createState() => _TelaNotificacaoState();
}

class _TelaNotificacaoState extends State<TelaNotificacao> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _opcaoSelecionada = 3;

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
        child: ListView(children: <Widget>[
          SizedBox(height: 3),
          Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'Notificações',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                width: 750.0,
                height: 2.0,
                child: Container(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    height: 250,
                    width: 100,
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
                          livros[0].imagem,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                livros[0].titulo,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                livros[0].autor,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Caro Cliente.\nSua reserva do livro \nacaba hoje\n20/04/2023!\n' 
                    'Atente-se ao prazo \nde devolução.\nGrato!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 750.0,
                height: 2.0,
                child: Container(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    height: 250,
                    width: 100,
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
                          livros[4].imagem,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                livros[4].titulo,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                livros[4].autor,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Caro Cliente.\nAcabamos de ter \ndisponivel \no livro' 
                    '"O Guarani",\nde José de Alencar.\nReserve já!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 750.0,
                height: 2.0,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao) {
          setState(() {
            _opcaoSelecionada = opcao;
          });

          if (opcao == 0)
            if (FirebaseAuth.instance.currentUser!.email == 'admin@gmail.com') {
              Navigator.popAndPushNamed(context, 'homeAdmin');
            } else {
              Navigator.popAndPushNamed(context, 'home');
            }
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
}