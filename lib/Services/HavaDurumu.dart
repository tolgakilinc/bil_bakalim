import 'dart:convert';
import 'package:bil_bakalim/Model/HavaDurumu.dart';
import 'package:http/http.dart' as http;

Future<HavaDurumu> havaBilgisi() async{
  String url = 'http://api.openweathermap.org/data/2.5/weather?q=Konya&appid=bbeb14f98e27e2e1cde1096e17b6d547&units=metric&lang=tr';
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    return HavaDurumu.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('');
  }
}