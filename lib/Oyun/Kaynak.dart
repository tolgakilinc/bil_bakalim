import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Kaynak extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Kaynaklar"),
        ),

        body: Container(

          child: Padding(

            padding: const EdgeInsets.all(8.0),
            /*  children: <Widget>[
                RichText(
                    text: TextSpan(
                      text: "1.link\n2.link\n3.link",
                        style: TextStyle(fontSize: 25),
                    )
                )


              ]*/
            child: Text("1.Kaynak\nhttps://www.guvenlicocuk.org.tr/genel-kultur-soru"
                "\n\n2.Kaynak\nhttps://onedio.com/haber/40-soruluk-devasa-genel-kultur-testinde-kac-soruyu-bilebileceksin--721999"
                "\n\n3.Kaynak\nhttps://www.ntv.com.tr/galeri/sanat/hadi-bilgi-yarismasi-sorulari-ve-cevaplari-kendini-test-et,3xyYhiAC_EGKLLtDj54v8Q/rRnt7lLCYEypX3TukrOZZw"
                "\n\n4.Kaynak\nhttps://tr.wikipedia.org/wiki/Anasayfa",  style: TextStyle(color:Colors.blue ,fontSize: 17 ),),

          ),
        ),
      );
  }
}
