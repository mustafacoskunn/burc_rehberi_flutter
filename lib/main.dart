import 'package:burc_rehberi_flutter/burc_liste.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //arrow function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BurcListe(),
    );
  }
}
