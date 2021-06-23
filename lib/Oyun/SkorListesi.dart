import 'package:bil_bakalim/Model/Skor.dart';
import 'package:flutter/material.dart';
import 'package:bil_bakalim/Services/Database.dart';

class SkorListesi extends StatefulWidget {
  @override
  _SkorListesiState createState() => _SkorListesiState();
}

class _SkorListesiState extends State<SkorListesi> {
  DatabaseManagement _database;
  String titleName = "Skor Tablosu";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database = DatabaseManagement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${titleName}"),
        ),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(
                  child: FutureBuilder(
                    future: _database.getSkor(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                          );
                        },
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Skor score = snapshot.data[index];
                          if(index == 10){
                            return null;
                          }else {
                            return Card(
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    titleName = "Tabloda seçilen: " + score.adSoyad;
                                  });
                                },
                                onTapCancel: (){
                                  setState(() {
                                    titleName = "Skor Tablosu";
                                  });
                                },
                                onLongPress: (){
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Seçilen yarışmacı"),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text("${score.adSoyad}"),
                                              Text('Yarışmacının puanı: ${score.skor}'),
                                              Text("Yarışmacının sırası: ${index+1}" ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Tamam'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text("${index + 1}. ${score.adSoyad}"),
                                  subtitle: Text("${score.skor}"),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                Card(
                  child: GestureDetector(
                    onHorizontalDragDown: (DragDownDetails){
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      tileColor: Colors.blue, // sonra burası değiştirelecek.
                      title: Text("Bitir sayfasına dönmek için kaydırınız."),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
