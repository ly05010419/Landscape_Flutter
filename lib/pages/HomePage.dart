import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/RowView.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<Landmark> landmarks;

class _HomePageState extends State<HomePage> {
  Map<String, List<Landmark>> categories;

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text("Landschaft", style: TextStyle(color: Colors.black,fontSize: 26),),
        ),
        body: SingleChildScrollView(
          child: landmarks != null ? Column(
                  children: landmarks.map((landmark) => RowView(name: landmark.name, landmark: landmark,)).toList(),
          ) : Container(),
        ));
  }

  loadData() async {
    final url = 'https://firebasestorage.googleapis.com/v0/b/landschaft-955e6.appspot.com/o/landmarkData1.json?alt=media&token=c33203ee-ce39-4b04-a9e0-4079058d13ee';
    http.Response response = await http.get(url);
    final data = json.decode(response.body).cast<Map<String, dynamic>>();

//    String jsonString =
//    await rootBundle.loadString('assets/data/landmarkData.json');
//    final data = json.decode(jsonString).cast<Map<String, dynamic>>();
    landmarks = data.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    categories = groupBy(landmarks, (Landmark obj) => obj.category);
    setState(() {});
  }
}


