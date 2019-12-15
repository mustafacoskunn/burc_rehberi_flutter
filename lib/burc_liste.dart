import 'package:burc_rehberi_flutter/model/burc.dart';
import 'package:burc_rehberi_flutter/utils/strings.dart';
import 'package:flutter/material.dart';

class BurcListe extends StatelessWidget {
  //staless sadece görüntü gibi düşün değişikilik kabul etmiyor
  static List<Burc> tumBurc;

  @override
  Widget build(BuildContext context) {
    tumBurc = loadData();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeHazirla(),
    );
  }

  List<Burc> loadData() {
    //sıra sıra alıp listeye atıcaz
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
      String burcAdi = Strings.BURC_ADLARI[i];
      String burcTarih = Strings.BURC_TARIHLERI[i];
      String burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      Burc burcEkle =
          Burc(burcAdi, burcTarih, burcDetay, buyukResim, kucukResim);
      burclar.add(burcEkle);
    }
    return burclar;
  }

  Widget listeHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        //listeyi oluşturmak için byilder
        return cardWidget(context, index);
      },
      itemCount: tumBurc.length,
    );
  }

  Widget cardWidget(BuildContext context, int index) {
    Burc listBurc = tumBurc[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
          // onTap: () => Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => BurcDetay())),
          leading: Image.asset(
            "images/" + listBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            listBurc.burcAdi,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              listBurc.burcTarih,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios), //sağdaki foto
        ),
      ), //hazır ListTile yapısı leading=kucuk resim
    );
  }
}
