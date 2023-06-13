import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/login_controller.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});
  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool _mostraSenha = false;
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/capa.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 35),
                Text(
                  'E-mail',
                  style: GoogleFonts.lilitaOne(fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'example@email.com',
                  hintStyle: TextStyle(color: Color.fromARGB(76, 37, 36, 36)),
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 35),
                Text(
                  'Senha',
                  style: GoogleFonts.lilitaOne(fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
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
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cadastro');
                  },
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                SizedBox(width: 130),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'senha');
                  },
                  child: Text(
                    'Esqueci a senha',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                LoginController().login(
                  context,
                  txtEmail.text,
                  txtSenha.text,
                );
              },
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
