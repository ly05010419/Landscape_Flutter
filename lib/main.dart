import 'package:flutter/material.dart';
import 'package:wwdcflutter/views/CategoryItem.dart';
import 'package:wwdcflutter/views/CategoryItemLarge.dart';
import 'package:wwdcflutter/views/CategoryRow.dart';
import 'package:wwdcflutter/views/CategoryRowWithEffect.dart';
import 'package:wwdcflutter/views/HalloView.dart';
import 'views/Avatar.dart';
import 'views/MapView.dart';
import 'views/LandmarkDetail.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:wwdcflutter/model/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class _MyHomePageState extends State<MyHomePage> {
  List<Landmark> landmarks;

  @override
  void initState() {
    super.initState();
    loadLandmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  HalloView(),

//      body: landmarks != null
//          ? Center(
//          child: CategoryRowWithEffect(
//            landmarks: landmarks,
//            name: "All",
//          ))
//          : Container(),

//            body: landmarks != null ? CategoryItem(
//        landmark: landmarks[0],
//      ):Container(),

//      body: landmarks != null
//          ? Center(
//          child: CategoryRow(
//            landmarks: landmarks,
//            name: "Lakes",
//          ))
//          : Container(),

//      body: landmarks != null ? LandmarkDetail(
//        landmark: landmarks[0],
//        landmarks: landmarks,
//      ):Container(),




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

//  loadLandmark() async {
//    String jsonString = await rootBundle.loadString('assets/data/landmarkData.json');
//    var jsonResponse = json.decode(jsonString);
//    landmark = List<Landmark>.fromJson(jsonResponse);
//    setState(() {
//
//    });
//  }
}
