import 'package:ec_app/ui/tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:ec_app/ui/widgets/ec_drawer.dart';
import 'package:ec_app/ui/tab/categorias_tab.dart';


class EcHome extends StatefulWidget {
  @override
  _EcHomeState createState() => _EcHomeState();
}

class _EcHomeState extends State<EcHome> {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

       Scaffold(
           body: HomeTab(),
           drawer: EcDrawer(_pageController),
       ),

        Scaffold(

          appBar: AppBar(

            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: EcDrawer(_pageController),
          body: CategoriasTab(),

        ),


        Container(color: Colors.yellow,),
        Container(color: Colors.orangeAccent,),


      ],
    );
  }
}
