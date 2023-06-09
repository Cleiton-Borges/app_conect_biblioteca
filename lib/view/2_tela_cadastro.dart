import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/login_controller.dart';
import '../Controller/tela_controller.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool _mostraSenha = false;
  var txtNome = TextEditingController();
  var txtCPF = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCep = TextEditingController();
  var txtCidade = TextEditingController();
  var txtRua = TextEditingController();
  var txtNumero = TextEditingController();
  var txtBairro = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

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
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),                
                  Text(
                    ' /  Cadastro',
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
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: txtEmail,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
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
                    child: TextFormField(
                      controller: txtSenha,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: Color.fromARGB(76, 37, 36, 36)),
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _mostraSenha == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onTap: () {
                            setState(() {
                              _mostraSenha = !_mostraSenha;
                            });
                          },
                        ),
                      ),
                      obscureText: _mostraSenha == false ? true : false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                LoginController().criarConta(
                  context,
                  txtNome.text,
                  txtCPF.text,
                  txtTelefone.text,
                  txtCep.text,
                  txtCidade.text,
                  txtRua.text,
                  txtNumero.text,
                  txtBairro.text,
                  txtEmail.text,
                  txtSenha.text,
                );
              },
              child: Text(
                'Cadastrar',
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
        ),
      )
    );
  }
}