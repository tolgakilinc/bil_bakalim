import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Hata extends StatefulWidget {
  @override
  _HataState createState() => _HataState();
}

class _HataState extends State<Hata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hata'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bil Bakalım',
                style: GoogleFonts.caveat(
                  textStyle: TextStyle(
                    fontSize: 60.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              Text('Ad ve Soyad Giriniz , Öğrenci numarası 9 karakter olmalıdır ve yaşınız 9 dan büyük olmalıdır!'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Anasayfaya Dön'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
