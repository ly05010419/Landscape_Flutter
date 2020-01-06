import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:wwdcflutter/component/ItemWidget.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/RowWidget.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<Landmark> landmarks;

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

//    return Scaffold(
//      body: landmarks != null ? Center(child: ItemView(
//        imageName: "https://firebasestorage.googleapis.com/v0/b/landschaft-955e6.appspot.com/o/Deutschland%20%2Fneuschwanstein-532850_640.jpg?alt=media&token=d4f1b23f-3be7-49a3-bf60-4ed9671f4cca",
//        width: 150,
//        height: 200,
//      )): Container(),
//    );

    return Scaffold(
      body: landmarks != null ? Center(child: RowWidget(name: landmarks[0].name, landmark: landmarks[0],)): Container(),
    );

//    return Scaffold(
//        appBar: AppBar(
//          elevation: 2.0,
//          backgroundColor: Colors.white,
//          title: Text("Landschaft", style: TextStyle(color: Colors.black,fontSize: 26),),
//        ),
//        body: Padding(
//          padding: const EdgeInsets.only(top: 20),
//          child: SingleChildScrollView(
//            child: landmarks != null ? Column(
//                    children: landmarks.map((landmark) => RowView(name: landmark.name, landmark: landmark,)).toList(),
//            ) : Container(),
//          ),
//        )
//    );
  }

  loadData() async {
    final url = 'https://firebasestorage.googleapis.com/v0/b/landschaft-955e6.appspot.com/o/landmarkData1.json?alt=media&token=60bb174e-261d-4b12-96f2-11a86ec07c00';
    http.Response response = await http.get(url);
    final data = json.decode(response.body).cast<Map<String, dynamic>>();
    landmarks = data.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    setState(() {});
  }
}


