import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState();
}

class _BitirState extends State<Bitir> {
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('İşte Yarışma Sonucunuz', style: TextStyle(color: Colors.yellowAccent),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  'Bil Bakalım',
                  style: GoogleFonts.caveat(
                    textStyle: TextStyle(
                      fontSize: 72.0,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Tebrikler ${data[0].toString()}, yarışmayı başarıyla bitirdiniz!", textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Puanınız : ' + data[3].toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Öğrenci Numaranız : ' + data[1].toString(),
                      style: TextStyle(color: Colors.cyan, fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Yaşınız : ' + data[2].toString(),
                      style: TextStyle(color: Colors.cyan, fontSize: 16),
                    ),


                  ],
                ),
              ),
              //Text('Github değişiklik kontrolü için eklendi'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Yeniden Oyna', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
