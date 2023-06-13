import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/favoritos.dart';
import '../view/ultil.dart';
import 'login_controller.dart';

class FavoritosController{

  //
  // ADICIONAR LIVRO AO FAVORITO DO USUÁRIO
  //
  void adicionar(context, Favorito f){

    FirebaseFirestore.instance
      .collection('favoritos')
      .add(f.toJson())
      .then((value) => sucesso(context,'Livro adicionado com sucesso'))
      .catchError((e)=> erro(context,'Não foi possível adicionar o livro.'))
      .whenComplete(() => Navigator.pop(context));

  }


  void atualizar(context, id, Favorito f) {
    FirebaseFirestore.instance.collection('favoritos')
      .doc(id)
      .update(f.toJson())
      .then((value) => sucesso(context, 'Livro atualizado com sucesso'))
      .catchError((e) => erro(context, 'Não foi possível atualizar o livro.'))
      .whenComplete(() => Navigator.pop(context));
  }


  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('favoritos')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Livro excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o livro.'));
  }

  //
  // Listar todos os livros da coleção
  //
  listar(){
    return FirebaseFirestore.instance
    .collection('favoritos')
    .where('uid', isEqualTo: LoginController().idUsuario());
  }
}