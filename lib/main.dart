import 'package:flutter/material.dart';
import 'package:wwdcflutter/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.lightBlueAccent,
      ),
      home: HomePageWidget(),
    );
  }
}



