

import 'package:cloud_firestore/cloud_firestore.dart';

class Produto{


  String categoria;

  String id;


  String descricao;


  String titulo;


  double preco;

  List tamanhos;


  List imagens;


  Produto.fromDocument(DocumentSnapshot snapshot){

    id = snapshot.documentID;

    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descricao"];
    preco = snapshot.data["preco"];
    tamanhos = snapshot.data["tamanhos"];
    imagens = snapshot.data["imagens"];



  }

}

