import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ec_app/ui/tab/tiles/categoria_tile.dart';



class CategoriasTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return FutureBuilder<QuerySnapshot>(


      future: Firestore.instance.collection("categorias").getDocuments(),
      builder: (context, snapshot){

        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);

        else {
          var dividerTiles = ListTile.divideTiles(
              tiles: snapshot.data.documents.map(
                      (doc) {
                    return CategoriaTile(doc);
                  }
              ).toList(),
              color: Colors.blue[500]).toList();

          return ListView(
            children:  dividerTiles,
          );
        }
      },


    );
  }
}
