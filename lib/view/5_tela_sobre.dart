import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/tela_controller.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({super.key});

  @override
  State<TelaSobre> createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
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
        child:Container(
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
                      'Sobre Conect Biblioteca',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Conect Biblioteca',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3),
                Text(
                  'Conect Biblioteca Mobile para android\nV1.0',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500.0,
                  height: 2.0,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '   O aplicativo Conect Biblioteca foi desenvolvido para você, usuário, consultar um livro '
                  'na biblioteca pública de sua cidade, adiantando o seu cadastro, realizando consultas '
                  'da disponibilidade do livro na biblioteca e já gerando sua reserva no app. O intuito é '
                  'que você não perca seu tempo indo reservar um livro que já esteja reservado!!! '
                  'Aqui você já pode realizar essa consulta e ir na Biblioteca na certeza que seu livro já '
                  'esteja separado e pronto para retirada.',
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 500.0,
                  height: 2.0,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '- Desenvolvedores:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 35),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('lib/images/dev1.png'),
                          ),
                        ),
                        Text(
                          'Cleiton\nBorges',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('lib/images/dev2.png'),
                          ),
                        ),
                        Text(
                          'José\nAugusto',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500.0,
                  height: 2.0,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '   O aplicativo foi desenvolvido pelos alunos do 4º Semestre do curso de '
                  'Análise e Desenvolvimento de Sistemas do período diurno da faculdade de '
                  'Tecnologia de Ribeirão Preto (Fatec), na disciplina de '
                  'Programação de Dispositivos Móveis ministrada pelo Professor DR. Rodrigo Plotze.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ]),
            ),
          ]),
        ),
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
          if (opcao == 1) 
            Navigator.popAndPushNamed(context, 'favorito');
          if (opcao == 2) 
            Navigator.popAndPushNamed(context, 'reserva');
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