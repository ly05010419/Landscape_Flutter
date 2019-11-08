import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wwdcflutter/views/HomeView.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:wwdcflutter/model/models.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 10.0;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Landmark> landmarks;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadLandmarks();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: landmarks!=null?HomeView(
        landmark: landmarks[0],
        landmarks: landmarks,
      ):Container(),
    );
  }

  loadLandmarks() async {
    String jsonString =
        await rootBundle.loadString('assets/data/landmarkData.json');
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    landmarks = parsed.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    setState(() {});
  }
}
