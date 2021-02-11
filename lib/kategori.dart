import 'package:flutter/material.dart';
import 'package:fmarket/urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key key, this.kategori}) : super(key: key);
  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<Widget> gosterilecekListe;

  @override
  void initState() {
    super.initState();

    if (widget.kategori == "temel gıda") {
      gosterilecekListe = [
        urunKarti("Zeytin Yağı", "23.50 TL",
            "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
            mevcut: true),
        urunKarti("Süt", "3.50 TL",
            "https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993_1280.jpg"),
        urunKarti("Et 1 Kg", "30 TL",
            "https://cdn.pixabay.com/photo/2016/03/05/23/02/barbecue-1239434_1280.jpg"),
        urunKarti("Yumurta 8'li", "12.50 TL",
            "https://cdn.pixabay.com/photo/2018/02/26/16/30/eggs-3183410_1280.jpg",
            mevcut: true),
        urunKarti("Makarna", "5.50 TL",
            "https://cdn.pixabay.com/photo/2010/12/13/10/00/pasta-2093_1280.jpg"),
        urunKarti("Peynir", "15.50 TL",
            "https://cdn.pixabay.com/photo/2018/06/08/23/30/cheese-3463368_1280.jpg"),
      ];
    } else if (widget.kategori == "şekerleme") {
      gosterilecekListe = [
        urunKarti("Çikolata", "23.50 TL",
            "https://cdn.pixabay.com/photo/2017/02/11/14/19/valentines-day-2057745_1280.jpg"),
      ];
    } else if (widget.kategori == "içecekler") {
      gosterilecekListe = [
        urunKarti("Portakal Suyu", "7.50 TL",
            "https://cdn.pixabay.com/photo/2016/12/20/21/43/orange-juice-1921548_1280.jpg"),
      ];
    } else if (widget.kategori == "temizlik") {
      gosterilecekListe = [
        urunKarti("Sıvı Sabun", "12.50 TL",
            "https://cdn.pixabay.com/photo/2016/02/11/14/49/soap-1193709_1280.jpg"),
      ];
    }
  }

  Widget urunKarti(String isim, String fiyat, String resimYolu,
      {bool mevcut = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UrunDetay(
                      isim: isim,
                      fiyat: fiyat,
                      resimYolu: resimYolu,
                      mevcut: mevcut,
                    )));
      },
      child: Hero(
        tag: resimYolu,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4.0,
                    spreadRadius: 2.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          resimYolu,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                isim,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                fiyat,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      childAspectRatio: 1,
      padding: EdgeInsets.all(10.0),
      children: gosterilecekListe,
    );
  }
}
