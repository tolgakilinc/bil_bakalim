import 'dart:async';
import 'package:bil_bakalim/Oyun/bitir.dart';
import 'package:flutter/material.dart';

class Sorular extends StatefulWidget {
  @override
  _SorularState createState() => _SorularState();
}

String zamaniFormatla(int milisaniye) {
  var saniye = milisaniye ~/ 1000; // ~/ Tam sayı bölme işlemidir
  var dakika = ((saniye % 3600) ~/ 60).toString().padLeft(2, '0');
  var saniyeler = (saniye % 60).toString().padLeft(2, '0');

  return "$dakika:$saniyeler";
}

class _SorularState extends State<Sorular> {
  String adSoyad = '';
  String ogrNo = '';
  String yas = '';

  int mevcutsoru = 0;
  String mevcutcevap = '';
  int puan = 0;
  int kullanilansure = 0;

  Stopwatch _sayac;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _sayac = Stopwatch();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {});
    });
    mevcutsoru = 0;
    mevcutcevap = '';
    puan = 0;
    kullanilansure = 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void BitireYolla() {
    var data = [];
    data.add(adSoyad);
    data.add(ogrNo);
    data.add(yas);
    data.add(puan);
    data.add(zamaniFormatla(kullanilansure));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bitir(),
          settings: RouteSettings(
            arguments: data,
          ),
        ));
  }

  var sorular = [
    {
      'soru': 'Türkiye\'nin başkenti neresidir?',
      'cevaplar': ['İstanbul', 'Ankara', 'Mersin', 'İzmir'],
      'dogrucevap': 'Ankara'
    },
    {
      'soru': 'Türkiye\' de kaç tane coğrafi bölge vardır?',
      'cevaplar': ['Beş(5)', 'Altı(6)', 'Yedi(7)', 'Sekiz(8)'],
      'dogrucevap': 'Yedi(7)'
    },
    {
      'soru':
      'Aşagıdakilerden hangisi Türkiye\' nin komşusu bir ülke değildir?',
      'cevaplar': ['Suriye', 'İran', 'Gürcistan', 'Almanya'],
      'dogrucevap': 'Almanya'
    },
    {
      'soru': 'Aşağıdakilerden hangisi doğal ışık kaynağıdır?',
      'cevaplar': ['Mum', 'Ateş Böceği', 'Florasan Lamba', 'Fener'],
      'dogrucevap': 'Ateş Böceği'
    },
    {
      'soru': 'Türkçe hangi dil grubuna girmektedir?',
      'cevaplar': ['Çin-Tibet', 'Bantu', 'Ural-Altay', 'Hami-Sami'],
      'dogrucevap': 'Ural-Altay'
    },
    {
      'soru':
      'Türkiye\'nin ilk Safari Parkı hangi ilimizde açılmıştır?',
      'cevaplar': ['Mersin', 'İzmir', 'Gaziantep', 'Konya'],
      'dogrucevap': 'Gaziantep'
    },
    {
      'soru': 'Gülü ile meşhur olan ilimiz hangisidir?',
      'cevaplar': ['Tekirdağ', 'Isparta', 'Eskişehirspor', 'Adana'],
      'dogrucevap': 'Isparta'
    },
    {
      'soru': 'Asya kıtasında kaç ülke vardır?',
      'cevaplar': ['140', '76', '24', '52'],
      'dogrucevap': '52'
    },
    {
      'soru': 'Mehmet Akif Ersoy İstiklal Marşı telif ödülünü hangi kuruma bağışlamıştır?',
      'cevaplar': ['Darülfünun', 'Darülbedai', 'Darüleytam', 'Darülmesai'],
      'dogrucevap': 'Darülmesai'
    },
    {
      'soru': 'Türkiye\'nin en büyük kış ve doğa sporları merkezi olan Uludağ\'ın eski adı nedir?',
      'cevaplar': ['Ulu Kuş Dağı', 'Buz Dağı', 'Yeşil Dağ', 'Keşiş Dağı'],
      'dogrucevap': 'Keşiş Dağı'
    },
    {
      'soru': 'Akreplerin bilinen kaç türü zehirlidir?',
      'cevaplar': ['25', '50', '75', '100'],
      'dogrucevap': '25'
    },
    {
      'soru': 'İstiklal Şairi olarak anılan şair aşagıdakilerden hangisidir?',
      'cevaplar': ['Yahya Kemal Beyatlı', 'Mehmet Akif Ersoy', 'Cemal Süreya', 'Ahmet Arif'],
      'dogrucevap': 'Mehmet Akif Ersoy'
    },
    {
      'soru': 'Depremin büyüklüğünü ve süresini ölçen alete ne ad verilir?',
      'cevaplar': ['Takograf', 'Tomograf', 'Sismograf', 'Trapman'],
      'dogrucevap': 'Sismograf'
    },
    {
      'soru':
      '1071\' de yapılan Malazgirt Savaşıyla Anadolu\'nun Kapılarını Türklere açan Selçuklu Sultanı kimdir?',
      'cevaplar': ['Sultan Süleyman', 'Sultan Alparslan', 'Sultan Alaaddin', 'Sultan Tuğrul'],
      'dogrucevap': 'Sultan Alparslan'
    },
    {
      'soru': 'Aşağıdaki hayvanlardan hangisi çöl ortamına daha dayanıklıdır?',
      'cevaplar': ['Köpek', 'Ayı', 'Deve', 'Kedi'],
      'dogrucevap': 'Deve'
    },
    {
      'soru': 'Rumeli hisarını hangi padişah yaptırmıştır?',
      'cevaplar': [
        'Yavuz Sultan Selim',
        'Kanuni Sultan Süleyman',
        'Fatih Sultan Mehmet',
        'II. Bayezid',
      ],
      'dogrucevap': 'Fatih Sultan Mehmet'
    },
    {
      'soru': 'En büyük uydusu olan gezegen aşağıdakilerden hangisidir?',
      'cevaplar': ['Dünya', 'Mars', 'Satürn', 'Jupiter'],
      'dogrucevap': 'Satürn'
    },
    {
      'soru':
      'Gezilerini \'Seyahatname \' adlı eserde toplayan Türk gezgin kimdir?',
      'cevaplar': ['Nadir Paksoy', 'Katip Çelebi', 'Evliya Çelebi', 'Sadun Boro'],
      'dogrucevap': 'Evliya Çelebi'
    },
    {
      'soru': 'Tiger Woods hangi sporun en önemli temsilcisidir?',
      'cevaplar': ['Basketbol', 'Golf', 'Tenis', 'Futbol'],
      'dogrucevap': 'Golf'
    },
    {
      'soru': '\'Bozkırın tezenesi\' lakaplı rahmetli halk ozanı kimdir ?',
      'cevaplar': [
        'Aşık Veysel',
        'Kıvırcık Ali',
        'Neşet Ertaş',
        'Aşık Mahzuni Şerif',
      ],
      'dogrucevap': 'Neşet Ertaş'
    },
  ];

  void kontrolEt() {
    if (mevcutsoru > 18) {
      puan +=100;
      mevcutsoru = 0;
      _timer.cancel();
      BitireYolla();
    } else {
      if (mevcutcevap == sorular[mevcutsoru]['dogrucevap']) {
        puan = puan + 100;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      } else {
        puan = puan - 50;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    adSoyad = data[0];
    ogrNo = data[1];
    yas = data[2];

    _sayac.start();
    if (_sayac.elapsedMilliseconds > 9999.9999 && mevcutsoru < 19) {
      kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
      _sayac.reset(); // 10 saniyede cevap verilmezse diğer soruya geçiyor
      mevcutsoru++;
    }

    if (mevcutsoru == 9 && _sayac.elapsedMilliseconds > 9999) {
      Future.delayed(Duration.zero, () async {
        _sayac.reset(); // Sıfırlama
        _sayac.stop(); // Bitiş ekranına geldik artık
        _timer.cancel(); // Yeni ekrana geçtiğinde saymayı bitirsin
        mevcutsoru = 0;
        BitireYolla();
      });
    }

    List cevaplistesi = [];
    for (var u in sorular[mevcutsoru]['cevaplar']) {
      cevaplistesi.add(u);
    }

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('Soru: ${mevcutsoru + 1} - Puanın: ${puan}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        sorular[mevcutsoru]['soru'].toString(),
                        style: TextStyle(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mevcutcevap = cevaplistesi[0].toString();
                                });
                                kontrolEt();
                              },
                              child: Text(
                                cevaplistesi[0],
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mevcutcevap = cevaplistesi[1].toString();
                                });
                                kontrolEt();
                              },
                              child: Text(
                                cevaplistesi[1],
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    mevcutcevap = cevaplistesi[2].toString();
                                  });
                                  kontrolEt();
                                },
                                child: Text(
                                  cevaplistesi[2],
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    mevcutcevap = cevaplistesi[3].toString();
                                  });
                                  kontrolEt();
                                },
                                child: Text(
                                  cevaplistesi[3],
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(zamaniFormatla(_sayac.elapsedMilliseconds),
                  style: TextStyle(fontSize: 15.0)),
              Text('Kullanılan Süre: ' + zamaniFormatla(kullanilansure),
                  style: TextStyle(fontSize: 15.0)),
              Text(
                'Toplam Soru : ' + sorular.length.toString(),
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child:
                  Text('Yarışmadan Çık', style: TextStyle(fontSize: 20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
