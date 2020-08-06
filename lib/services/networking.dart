import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/constants.dart';

class Networking{

  final String url;
  Networking({this.url});

  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }

}