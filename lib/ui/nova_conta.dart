import 'package:ec_app/ui/home.dart';
import 'package:flutter/material.dart';

class NovaConta extends StatelessWidget {


  final  _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Conta"),
        centerTitle: true,

      ),
      body: Form(
        key: _formkey,

        child: Card(
          margin: EdgeInsets.all(3.0),
          elevation: 10.0,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[

              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Nome completo",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
                keyboardType: TextInputType.emailAddress,
                validator: (text){

                  if(text.isEmpty) return "Preencha seu nome completo!";

                },
              ),
              SizedBox(
                height: 16.0,
              ),

              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: "Telefone",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
                keyboardType: TextInputType.phone,
                validator: (text){

                  if(text.isEmpty) return "Preencha um número de telefone!";

                },
              ),
              SizedBox(
                height: 16.0,
              ),


              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
                keyboardType: TextInputType.emailAddress,
                validator: (text){

                  if(text.isEmpty || ! text.contains("@")) return "Email inválido!";

                },
              ),
              SizedBox(
                height: 16.0,
              ),


              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    labelText: "Endereço",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
                keyboardType: TextInputType.emailAddress,
                validator: (text){

                  if(text.isEmpty) return "Informe o seu endereço!";

                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  hintStyle: TextStyle(color: Colors.blueAccent),
                  icon: Icon(Icons.lock),
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
                validator:  (text){

                  if(text.isEmpty) return "É necessário cadastrar uma senha!";
                },
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
                      "Criar nova conta",
                      style: TextStyle(fontSize: 18.0,),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                  )),

              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {


                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=> EcHome()));



                  },
                  child: Text(
                    "Cancelar cadastro",
                    textAlign: TextAlign.right, style: TextStyle(color: Colors.black38,),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
