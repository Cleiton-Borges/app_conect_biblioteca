import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaNotificacao extends StatefulWidget {
  const TelaNotificacao({super.key});

  @override
  State<TelaNotificacao> createState() => _TelaNotificacaoState();
}

class _TelaNotificacaoState extends State<TelaNotificacao> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _opcaoSelecionada = 4;

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
            icon: Icon(Icons.person),
            onPressed: () {
              _abrirDrawerUser();
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
        actions: [
          IconButton(
          color: Colors.black,
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'notificacao');
          },
        ),
        ],
      ),
      key: _scaffoldKey,
      body: Stack(children: [
        Container(
          //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/Livro.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: [
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 25),
                Text(
                  'Notificações',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ]),
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
          if (opcao == 2) Navigator.popAndPushNamed(context, 'pesquisa');
          if (opcao == 3) Navigator.popAndPushNamed(context, 'reserva');
          if (opcao == 4) _abrirDrawer();
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
            icon: Icon(Icons.search_outlined, color: Colors.black, size: 40),
            label: 'Pesquisa',
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
              accountEmail: Text("user@mail.com"),
              accountName: Text("Seu zé"),
              currentAccountPicture: CircleAvatar(
                child: Text("SZ"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.pop(context, 'login');
                //Navegar para outra página
              },
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
              leading: Icon(Icons.search, color: Colors.black),
              title: Text("Pesquisar"),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, 'pesquisa');
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
      drawer: Drawer(
        
      ),
    );
  }
}