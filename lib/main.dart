import 'package:burc_rehberi_flutter/burc_detay.dart';
import 'package:burc_rehberi_flutter/burc_liste.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //arrow function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/":(context)=>BurcListe(),
        "/burcListesi":(context)=>BurcListe(),
        //"/burcDetay/$index":(context)=>BurcDetay(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

    );
  }
}
