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
      routes: {
        "/": (context) => BurcListe(),
        "/burcListesi": (context) => BurcListe(),
        //"/burcDetay/$index":(context)=>BurcDetay(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari =
            settings.name.split("/"); //   /  burcdetay   /  1
        if (pathElemanlari[1] == 'burcDetay') {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
