import 'package:flutter/material.dart';

class Login extends StatelessWidget {


  final  _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loja Virtual"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(

            child: Text(
              "Nova conta",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.yellow,
            onPressed: () {},
          )
        ],
      ),
      body: Form(
        key: _formkey,

        child: Card(
          margin: EdgeInsets.all(3.0),
          elevation: 10.0,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Email",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
                keyboardType: TextInputType.emailAddress,
                validator: (text){

                  if(text.isEmpty || ! text.contains("@")) return "Email inválido";

                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Senha",
                    hintStyle: TextStyle(color: Colors.blueAccent),
                    icon: Icon(Icons.email),
                    border: UnderlineInputBorder(),
                ),
                obscureText: true,
                validator:  (text){

                  if(text.isEmpty) return "Preencha sua senha";
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueci a senha",
                    textAlign: TextAlign.right, style: TextStyle(color: Colors.black38,),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                  height: 42.0,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formkey.currentState.validate()){

                        //TODO
                      }
                    },
                    child: Text(
                      "Entrar na Loja",
                      style: TextStyle(fontSize: 18.0,),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
