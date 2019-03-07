import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ec_app/ui/produtos.dart';
import 'package:flutter/material.dart';


class CategoriaTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoriaTile(this.snapshot);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      
      
      
      leading: CircleAvatar(

        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["urlIcone"]),
      ),
      title: Text(snapshot.data["titulo"]),
      onTap: (){

        Navigator.of(context).push(

            MaterialPageRoute(builder: (context) => Produtos(snapshot))

        );




      },

    );
  }
}
