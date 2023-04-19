import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaSenha extends StatelessWidget {
  const TelaSenha({super.key});

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
        body: Container(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/Livro.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: <Widget>[
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
                    ' /  Esqueci minha senha',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('lib/images/Livro.png', fit: BoxFit.contain),
              ),
              SizedBox(height: 20),
              Text(
                "Esqueceu sua Senha?",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Por Favor, informe seu E-mail associado a sua conta, que enviaremos "
                "um link para você com as instruções para restaurar a sua senha.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@email.com',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(76, 37, 36, 36)),
                      fillColor: Colors.white.withOpacity(0.5),
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    //padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ));
  }
}