class HavaDurumu{
  int derece;
  String aciklama;

  HavaDurumu({this.derece, this.aciklama});

  factory HavaDurumu.fromJson(Map data){
    return HavaDurumu(
        derece: (data['main']['temp'] is int) ? data['main']['temp'] : int.parse(data['main']['temp'].toStringAsFixed(0)),
        aciklama: data['weather'][0]['description']
    );
  }
}