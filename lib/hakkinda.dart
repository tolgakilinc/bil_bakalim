import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında',style: TextStyle(color: Colors.yellowAccent),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
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
              Expanded(child: Text('   Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir  ÇINAR tarafından yürütülen 331456 kodlu MOBİL PROGRAMLAMA DERSİ KAPSAMINDA 193301056 numaralı Tolga Furkan KILINÇ tarafından 30 Nisan 2021 günü yapılmıştır.',
                style: TextStyle(color:Colors.cyan ,fontSize: 17 ), textAlign: TextAlign.center,)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Anasayfaya Dön'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

