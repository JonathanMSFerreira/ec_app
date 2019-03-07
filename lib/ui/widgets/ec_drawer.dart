import 'package:flutter/material.dart';
import 'package:ec_app/ui/tab/tiles/drawer_tile.dart';

class EcDrawer extends StatelessWidget {


  final PageController _pageController;

  EcDrawer(this._pageController);

  @override
  Widget build(BuildContext context) {
    //Construção do fundo do drawer
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 73, 111, 184),
            Color.fromARGB(255, 121, 158, 202),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    Widget _displayDrawer() => ListView(
          padding: EdgeInsets.only(left: 10.0, top: 16.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
              height: 150.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: const Text(
                        "Loja Virtual",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         const  Text(
                            "Seja bem vindo,",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow),
                          ),

                         GestureDetector(

                           child: const Text(
                             "Entre ou cadastre-se",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.bold),
                           ),
                             onTap: (){
                             //TODO ação de cadastrar novo usuário
                             },
                         )
                        ],
                      ))
                ],
              ),
            ),
            Divider(height: 15.0,),
            DrawerTile(Icons.home, "Início", _pageController, 0),
            DrawerTile(Icons.list, "Produtos", _pageController, 1),
            DrawerTile(Icons.location_on, "Lojas", _pageController, 2),
            DrawerTile(Icons.playlist_add_check, "Meus Pedidos", _pageController, 3),
            DrawerTile(Icons.show_chart, "Estatísticas", _pageController, 4),


          ],
        );
    return Stack(
      children: <Widget>[_buildDrawerBack(), _displayDrawer()],
    );
  }
}
