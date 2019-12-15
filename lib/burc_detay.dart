import 'package:burc_rehberi_flutter/burc_liste.dart';
import 'package:burc_rehberi_flutter/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:palette_generator/palette_generator.dart' as prefix0;

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  PaletteGenerator paletteGenerator;
  Color baskinRenk;

  void renkAra() {
    Future<PaletteGenerator> renk = PaletteGenerator.fromImageProvider(
        AssetImage("images/" + secilenBurc.burcBuyukResim));
    renk.then((value) {
      paletteGenerator = value;
      debugPrint(
          "seçilen renk=" + paletteGenerator.vibrantColor.color.toString());
      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  void initState() {
    // 1 kere çalıştırıyor başlangıçta
    secilenBurc = BurcListe.tumBurc[widget.gelenIndex];

    renkAra();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            // kaydırmak için
            primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi + " Burcunun Özellikleri"),
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover, // tüm alana yayılır
              ),
              centerTitle: true, //yazıyı ortalıyor
            ), // foto koymak için
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(
                secilenBurc.burcDetay,
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
        primary: false,
      ),
    );
  }
}
