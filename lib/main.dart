import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wwdcflutter/views/HomeView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeView(),
    );
  }
}
