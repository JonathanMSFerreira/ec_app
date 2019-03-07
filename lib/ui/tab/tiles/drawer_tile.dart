import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData _iconData;

  final String _descricao;

  final PageController _pageController;

  final int _page;

  DrawerTile(this._iconData, this._descricao, this._pageController, this._page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          _pageController.jumpToPage(_page);

        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                _iconData,
                size: 32.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                _descricao,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
