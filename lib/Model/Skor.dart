class Skor{
  String adSoyad;
  int skor;

  Skor({this.adSoyad, this.skor});

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["adSoyad"] = adSoyad;
    map["skor"] = skor;
    return map;
  }

  Skor.fromMap(Map<String, dynamic> map){
    adSoyad = map['adSoyad'];
    skor = map['skor'];
  }
}