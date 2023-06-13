import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:app_conect_biblioteca/view/ultil.dart';

import 'login_controller.dart';

class UsuarioController {
  //
  // NOME do Usuário Logado
  //
  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: LoginController().idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }

  Future atualizarPerfil(context, uid, nome) async {
    String docId = '';
    await FirebaseFirestore.instance
    .collection('usuarios')
    .where('uid', isEqualTo: LoginController().idUsuario())
    .get()
    .then((resultado) {
      docId = resultado.docs[0].id.toString();
    },);

    FirebaseFirestore.instance.
    collection('usuarios')
    .doc(docId)
    .update({'nome': nome,}
    );
  }
}
