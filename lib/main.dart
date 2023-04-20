import 'package:app_conect_biblioteca/view/3_tela_home.dart';
import 'package:app_conect_biblioteca/view/4_tela_senha.dart';
import 'package:app_conect_biblioteca/view/5_tela_sobre.dart';
import 'package:app_conect_biblioteca/view/6_tela_favorito.dart';
import 'package:app_conect_biblioteca/view/8_tela_reserva.dart';
import 'package:app_conect_biblioteca/view/9_tela_notificacao.dart';
import 'package:flutter/material.dart';

import 'view/1_tela_login.dart';
import 'view/2_tela_cadastro.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conect Biblioteca',
      initialRoute: 'login',
      routes: {
        'login': (context) => TelaLogin(),
        'cadastro': (context) => TelaCadastro(),
        'home': (context) => TelaHome(),
        'senha':(context) => TelaSenha(),
        'sobre':(context) => TelaSobre(),
        'favorito':(context) => TelaFavorito(),
        'reserva':(context) => TelaReserva(),
        'notificacao':(context) => TelaNotificacao(),
      }
    ),
  );
}
