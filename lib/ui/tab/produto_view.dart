import 'package:ec_app/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProdutoView extends StatefulWidget {
  final Produto _produto;

  ProdutoView(this._produto);

  @override
  _ProdutoViewState createState() => _ProdutoViewState(this._produto);
}

class _ProdutoViewState extends State<ProdutoView> {
   final Produto _produto;

   String _tamSelecionado;

  _ProdutoViewState(this._produto);

  @override
  Widget build(BuildContext context) {


    final Color _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(_produto.titulo),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 350.0,
            child: AspectRatio(
              aspectRatio: 0.8,
              child: Carousel(
                images: _produto.imagens.map((url) {
                  return NetworkImage(url);
                }).toList(),
                dotSize: 5.0,
                dotColor: _primaryColor,
                dotSpacing: 15.0,
                dotBgColor: Colors.transparent,
                autoplay: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  _produto.titulo,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text("R\$ ${_produto.preco.toStringAsFixed(2)}", style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, color: _primaryColor),
                ),
                SizedBox(
                  height: 17.0,
                ),
                Text(
                  "Tamanho",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5,
                      ),
                      children: _produto.tamanhos.map((s) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _tamSelecionado = s;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(
                                    color: s == _tamSelecionado ? _primaryColor : Colors.grey[500],
                                    width: 2.0)
                            ),
                            width: 50.0,
                            alignment: Alignment.center,
                            child: Text(s),
                          ),
                        );
                      }).toList()),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    color: _tamSelecionado == null ? null : Colors.green,
                    onPressed: () {},
                    child: Text(
                      "Adicionar ao Carrinho",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
