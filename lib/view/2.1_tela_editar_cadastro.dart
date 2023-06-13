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
  var txtCPF = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCep = TextEditingController();
  var txtCidade = TextEditingController();
  var txtRua = TextEditingController();
  var txtNumero = TextEditingController();
  var txtBairro = TextEditingController();

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
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 30
            ),
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
              SizedBox(height: 20),
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
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtCPF,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtTelefone,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtCep,
                      decoration: InputDecoration(
                        labelText: 'Cep',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtCidade,
                      decoration: InputDecoration(
                        labelText: 'Cidade',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtRua,
                      decoration: InputDecoration(
                        labelText: 'Rua',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtNumero,
                      decoration: InputDecoration(
                        labelText: 'Número',
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtBairro,
                      decoration: InputDecoration(
                        labelText: 'Bairro',
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
                      if (FirebaseAuth.instance.currentUser!.email == 'admin@gmail.com') {
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
                  SizedBox(width: 50,),
                  ElevatedButton(
                    onPressed: () {
                      UsuarioController().atualizarPerfil(context, id, txtNome.text);
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
      )
    );
  }
}