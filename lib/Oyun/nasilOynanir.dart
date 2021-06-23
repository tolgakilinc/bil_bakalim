import 'package:flutter/material.dart';

class nasilOynanir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nasıl oynanır?"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset("assets/images/nasiloynanir.png"),
            ),
            SizedBox(
              height: 25,
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Positioned(
                      top: 5,
                      child: Text("   Bil Bakalım 20 sorudan oluşan bir bilgi yarışmasıdır. Bu yarışmada  her soru için  cevap verme süresi 10 sn olmakla beraber 10 sn sonunda cevaplanmayan soru otomatik olarak atlanarak bir diğer soruya geçmektedir. Her doğru cevabınız için 100 puan kazanılmakta ve her yanlış cevap için 50 puanınız gitmektedir cevap verilmeyen sorular için ise puanınız gitmemektedir.Herkese iyi yarışmalar...",
                        style: TextStyle(color:Colors.black87 ,fontSize: 17 ), textAlign: TextAlign.center,)),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
