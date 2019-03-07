import 'package:flutter/material.dart';
import 'package:ec_app/ui/home.dart';

void main() => runApp(EcApp());

class EcApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Virtual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: EcHome(),
    );
  }
}

