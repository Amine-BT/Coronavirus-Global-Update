import 'dart:convert';

import 'package:http/http.dart' as http;
class MyData{
  final String url;

  MyData(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
      print("ALL IS FINE");
      return jsonDecode(data);
    }else{
      print("Error ${response.statusCode}");
    }
  }
}