import 'package:bil_bakalim/Model/Skor.dart';
import 'package:bil_bakalim/Services/Database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState();
}

class _BitirState extends State<Bitir> {

  TextDecoration after = TextDecoration.none;


  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;

    DatabaseManagement db = DatabaseManagement();
    db.insertItem(Skor(
        adSoyad: data[0].toString(),
        skor: data[3]
    ));

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
                child: AsagiYukari()
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Tebrikler ${data[0].toString()}, yarışmayı başarıyla bitirdiniz!", textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onDoubleTap: (){
                        setState(() {
                          if(after == TextDecoration.underline){
                            after = TextDecoration.none;
                          }else{
                            after = TextDecoration.underline;
                          }
                        });
                      },
                      child: Text(
                        'Puanınız : ' + data[3].toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            decoration: after),
                      ),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/skorListesi');
                },
                child: Text('Skor Tablosu', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AsagiYukari extends StatefulWidget {

  @override
  _AsagiYukariState createState() => _AsagiYukariState();
}

class _AsagiYukariState extends State<AsagiYukari> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: new Duration(seconds: 1),
    );
    _animation = Tween(
      begin: Offset.zero,
      end: Offset(0, 0.1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Text(
        'Bil Bakalım',
        style: GoogleFonts.caveat(
          textStyle: TextStyle(
            fontSize: 72.0,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
