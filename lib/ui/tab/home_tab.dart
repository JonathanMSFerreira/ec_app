import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Widget _buildBodyBack() => Container(

        decoration: BoxDecoration(

            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 73, 111, 184),
                  Color.fromARGB(255, 121, 158, 202),

                ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )

        ),

    );

      return Stack(

        children: <Widget>[
          _buildBodyBack(),

          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Novidades"),
                  centerTitle: true,
                ),
              ),

            FutureBuilder<QuerySnapshot> (

              future: Firestore.instance.collection("homeImages")
                  .orderBy("pos").getDocuments(),
              builder: (context, snapshot){

                if(!snapshot.hasData)
                  return SliverToBoxAdapter(

                    child: Container(

                        height: 300.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),

                    ),

                  );

                return SliverStaggeredGrid.count(

                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                  staggeredTiles: snapshot.data.documents.map(
                      (doc){
                        return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                      }
                  ).toList(),
                  children: snapshot.data.documents.map(
                      (doc){

                        return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: doc.data["urlImage"],
                            fit: BoxFit.cover,);
                      }

                  ).toList()
                );
              },
            )
            ],
          )
        ],
      );
  }
}
