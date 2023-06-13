import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/livros.dart';
import '../view/ultil.dart';
import 'login_controller.dart';

class LivrosController{

  //
  // ADICIONAR uma novo Livro
  //
  void adicionar(context, Livro l){

    FirebaseFirestore.instance
      .collection('livros')
      .add(l.toJson())
      .then((value) => sucesso(context,'Livro adicionado com sucesso'))
      .catchError((e)=> erro(context,'Não foi possível adicionar o livro.'))
      .whenComplete(() => Navigator.pop(context));

  }


  void atualizar(context, id, Livro l) {
    FirebaseFirestore.instance.collection('livros')
      .doc(id)
      .update(l.toJson())
      .then((value) => sucesso(context, 'Livro atualizado com sucesso'))
      .catchError((e) => erro(context, 'Não foi possível atualizar o livro.'))
      .whenComplete(() => Navigator.pop(context));
  }


  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('livros')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Livro excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o livro.'));
  }

  //
  // Listar todos os livros da coleção
  //
  listarAdmin({String? orderBy}){
    return FirebaseFirestore.instance
    .collection('livros')
    .where('u7dUGuz3wMP6BfZFstq8ZofGqkt1');
  }

  pesquisarLivros(pesquisa, {String? orderBy}){
    return FirebaseFirestore.instance
    .collection('livros')
    .where('u7dUGuz3wMP6BfZFstq8ZofGqkt1')
    .where('titulo', isGreaterThanOrEqualTo: pesquisa)
    .where('titulo', isLessThan: pesquisa + '\uf8ff');
  }
}