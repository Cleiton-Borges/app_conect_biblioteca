import 'package:app_conect_biblioteca/view/ultil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/login_controller.dart';
import '../Controller/tela_controller.dart';
import '../Controller/usuario_controller.dart';

class TelaEditarCadastro extends StatefulWidget {
  const TelaEditarCadastro({super.key});

  @override
  State<TelaEditarCadastro> createState() => _TelaEditarCadastroState();
}

class _TelaEditarCadastroState extends State<TelaEditarCadastro> {
  User? id = FirebaseAuth.instance.currentUser;
  bool _mostraSenha = false;
  var txtNome = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: BackgroundImage(
          imagePath: 'lib/images/Livro.png',
          child: Container(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Column(
              children: [
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Editar Cadastro',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  '            Caro usuário!!!\nAltere seu nome no campo abaixo ou volte a tela inicial.',
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: txtNome,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (FirebaseAuth.instance.currentUser!.email ==
                            'admin@gmail.com') {
                          Navigator.pushNamed(context, 'homeAdmin');
                        } else {
                          Navigator.pushNamed(context, 'home');
                        }
                      },
                      child: Text(
                        'Voltar',
                        style: GoogleFonts.lilitaOne(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(178, 220, 224, 226),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (txtNome.text.isEmpty) {
                          erro(context, 'Campo nome não preenchido');
                        } else {
                          UsuarioController()
                              .atualizarPerfil(context, id, txtNome.text);
                          if (FirebaseAuth.instance.currentUser!.email ==
                              'admin@gmail.com') {
                            Navigator.pushNamed(context, 'homeAdmin');
                          } else {
                            Navigator.pushNamed(context, 'home');
                          }
                        }
                      },
                      child: Text(
                        'Salvar',
                        style: GoogleFonts.lilitaOne(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(178, 220, 224, 226),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
