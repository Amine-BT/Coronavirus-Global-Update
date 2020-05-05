import 'package:coronavirus/screens/home.dart';
import 'package:flutter/material.dart';

import 'screens/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoronsVirus Updates',
//      theme: ThemeData.dark(),
      home: Loading(),
      routes: {
        Loading.id : (context) => Loading(),
        Home.id : (context) => Home(),
      },
      initialRoute: Loading.id,
    );
  }
}

