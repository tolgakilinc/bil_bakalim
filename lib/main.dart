import 'file:///C:/Users/furka/AndroidStudioProjects/bil_bakalim/lib/HataYonetimi/hata.dart';
import 'file:///C:/Users/furka/AndroidStudioProjects/bil_bakalim/lib/Oyun/sorular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/furka/AndroidStudioProjects/bil_bakalim/lib/Oyun/bitir.dart';
import 'package:bil_bakalim/hakkinda.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bil Bakalım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/sorular': (context) => Sorular(),
        '/bitir': (context) => Bitir(),
        '/hakkinda': (context) => Hakkinda(),
        '/hata': (context) => Hata(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String adSoyad = '';
  String ogrNo = '';
  String yas = '';

  void kontrol() {
    if ((adSoyad.length > 0) && (ogrNo.length == 9) && (yas.length > 0)) {
      var data = [];
      data.add(adSoyad);
      data.add(ogrNo);
      data.add(yas);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sorular(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    } else {
      Navigator.pushNamed(context, '/hata');
    }
  }

  void _adSoyadKaydet(String text) {
    setState(() {
      adSoyad = text;
    });
  }

  void _ogrNoKaydet(String text) {
    setState(() {
      ogrNo = text;
    });
  }

  void _yasKaydet(String text) {
    setState(() {
      yas = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool butonpasif = true;
    if ((adSoyad.length > 0) && (ogrNo.length == 9) && (yas.length >= 2)) {
      butonpasif = false;
    } else {
      butonpasif = true;
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.access_alarm,
          color: Colors.white,
        ),
        title: Text(
          'Bil Bakalım - Bilgi Yarışması',
          style: TextStyle(color: Colors.yellowAccent),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bil Bakalım',
                style: GoogleFonts.caveat(
                  textStyle: TextStyle(
                    fontSize: 72.0,
                    color: Colors.teal,
                  ),
                ),
              ),
              CircleAvatar(
                  radius: 55, child: Image.asset('assets/images/logo.png')),
              Divider(
                height: 25,
              ),
              Text('Yarışmaya başlamak için: '),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Adınız ve Soyadınız:',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Adınızı ve Soyadınızı Giriniz',
                          ),
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter
                          ],
                          onChanged: (text) {
                            _adSoyadKaydet(text);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Öğrenci Numaranız:',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: TextFormField(
                          maxLength: 9,
                          decoration: const InputDecoration(
                            hintText: 'Öğrenci Numaranızı Giriniz',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (text) {
                            _ogrNoKaydet(text);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Yaşınız:',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: TextFormField(
                          maxLength: 3,
                          decoration: const InputDecoration(
                            hintText: 'Lütfen Yaşınızı Giriniz',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (text) {
                            _yasKaydet(text);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: butonpasif ? null : kontrol,
                  child: Text('Yarışmaya Başla'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hakkinda()),
                    );
                  },
                  child: Text('Hakkında'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
