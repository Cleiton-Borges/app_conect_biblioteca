import 'package:app_conect_biblioteca/Controller/usuario_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/3_tela_home_admin.dart';
import 'login_controller.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget buildEndDrawer(BuildContext context) {
  final FirebaseAuth user = FirebaseAuth.instance;
  var usuario;
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail:
              Text(FirebaseAuth.instance.currentUser!.email.toString()),
          accountName: FutureBuilder<String>(
            future: UsuarioController().usuarioLogado(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, 'editarCadastro');
                    },
                    icon: Icon(Icons.edit, size: 20),
                    label: Text(snapshot.data.toString()),
                  ),
                );
              }
              return Text('');
            },
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
            Navigator.popAndPushNamed(context, 'notificacao');
          },
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.black),
          title: Text("Sair"),
          onTap: () {
            LoginController().logout();
            Navigator.pop(context);
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
            Navigator.pushNamed(context, 'sobre');
          },
        ),
      ],
    ),
  );
}

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const BackgroundImage({
    required this.imagePath,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child,
      ],
    );
  }
}
