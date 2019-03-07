import 'package:ec_app/model/produto.dart';
import 'package:ec_app/ui/tab/produto_view.dart';
import 'package:flutter/material.dart';


class ProdutoTile extends StatelessWidget {

  final String _tipo;

  final Produto _produto;


  ProdutoTile(this._tipo, this._produto);


  @override
  Widget build(BuildContext context) {



    return InkWell(

      onTap: (){
        
        
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProdutoView(_produto)));


      },

        child: Card(
            child:

            _tipo == "grid" ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(aspectRatio: 0.8,
                child: Image.network(_produto.imagens[0], fit: BoxFit.cover,),

              ),
              Expanded(child:
              Container(

                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[

                    Text(_produto.titulo, style: TextStyle(fontWeight: FontWeight.w500),),
                    Text("R\$ ${_produto.preco.toStringAsFixed(2)}", style: TextStyle(color: Colors.lightGreen),)

                  ],
                ),
              )

              )
            ],
          ): Row(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Image.network(_produto.imagens[0],
                    fit: BoxFit.cover,
                    height: 250.0,),

                ),

                Flexible(child: Container(

                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(_produto.titulo, style: TextStyle(fontWeight: FontWeight.w500),),
                      Text("R\$ ${_produto.preco.toStringAsFixed(2)}", style: TextStyle(color: Colors.lightGreen),)

                    ],
                  ),
                )
                ),
              ],
            ),
        ),
    );
  }
}
