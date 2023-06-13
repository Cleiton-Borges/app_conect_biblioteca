import 'package:app_conect_biblioteca/view/2.1_tela_editar_cadastro.dart';
import 'package:app_conect_biblioteca/view/3.1_tela_home_user.dart';
import 'package:app_conect_biblioteca/view/3_tela_home_admin.dart';
import 'package:app_conect_biblioteca/view/4_tela_senha.dart';
import 'package:app_conect_biblioteca/view/5_tela_sobre.dart';
import 'package:app_conect_biblioteca/view/6_tela_favorito.dart';
import 'package:app_conect_biblioteca/view/8_tela_reserva.dart';
import 'package:app_conect_biblioteca/view/9_tela_notificacao.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'view/1_tela_login.dart';
import 'view/2_tela_cadastro.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Conect Biblioteca',
        initialRoute: 'login',
        routes: {
          'login': (context) => TelaLogin(),
          'cadastro': (context) => TelaCadastro(),
          'editarCadastro': (context) => TelaEditarCadastro(),
          'homeAdmin': (context) => TelaHomeAdmin(),
          'home':(context) => TelaHomeUser(),
          'senha':(context) => TelaSenha(),
          'sobre':(context) => TelaSobre(),
          'favorito':(context) => TelaFavorito(),
          'reserva':(context) => TelaReserva(),
          'notificacao':(context) => TelaNotificacao(),
        }
      ),
    ),
  );
}
