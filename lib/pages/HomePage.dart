import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/RowWidget.dart';
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
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: Text(
            "Landschaft",
            style: TextStyle(fontSize: 21),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: landmarks != null
                ? Column(
                    children: landmarks
                        .map((landmark) => RowWidget(
                              name: landmark.name,
                              landmark: landmark,
                            ))
                        .toList(),
                  )
                : Container(),
          ),
        ));
  }

  loadData() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/landschaft-955e6.appspot.com/o/landmarkData1.json?alt=media&token=60bb174e-261d-4b12-96f2-11a86ec07c00';
    http.Response response = await http.get(url);
    final data = json.decode(response.body).cast<Map<String, dynamic>>();
    landmarks = data.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    setState(() {});
  }
}
