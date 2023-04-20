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

  void _abrirDrawerUser() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'notificacao');
          },
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Conect Biblioteca',
          style: GoogleFonts.lilitaOne(
            textStyle: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/Livro.png'),
              fit: BoxFit.fill,
            ),
          ),
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
                      'Caro Cliente.\nSua reserva do livro acaba hoje\n20/04/2023!\n' 
                      'Atente-se ao prazo de devolução.\nGrato!',
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
                      'Caro Cliente.\nAcabamos de ter disponivel \no livro' 
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
          ]
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao) {
          setState(() {
            _opcaoSelecionada = opcao;
          });

          if (opcao == 0) Navigator.popAndPushNamed(context, 'home');
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
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("pedro@gmail.com"),
              accountName: Text("Pedro Silva"),
              currentAccountPicture: CircleAvatar(
                child: Text("SZ"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text("Início"),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, 'home');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.black),
              title: Text("Favoritos"),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, 'favorito');
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book_outlined, color: Colors.black),
              title: Text("Minhas Reservas"),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, 'reserva');
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.black),
              title: Text("Notificações"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text("Sair"),
              onTap: () {
                Navigator.popAndPushNamed(context, 'login');
              },
            ),
            SizedBox(
              width: 20.0,
              height: 2.0,
              child: Container(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text("Sobre Conect Biblioteca"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'sobre');
              },
            ),
          ],
        ),
      ),
    );
  }
}