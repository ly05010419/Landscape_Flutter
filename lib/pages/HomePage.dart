import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/RowView.dart';
import '../component/RowWithEffect.dart';
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
    loadLandmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: landmarks != null
                ? Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/Los_Angeles.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      RowWithEffect(
                        name: "All",
                        landmarks: landmarks,
                      ),
                      Column(
                        children: categories.keys
                            .map((k) => RowView(
                                  name: k,
                                  landmarks: categories[k],
                                ))
                            .toList(),
                      ),
                    ],
                  )
                : Container(),
          ),
        ));
  }

  loadLandmarks() async {
    var url =
        'https://firebasestorage.googleapis.com/v0/b/landschaft-955e6.appspot.com/o/landmarkData.json?alt=media&token=b958fe71-2fbb-495b-9376-bae91736fd3f';

    http.Response response = await http.get(url);

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    landmarks = parsed.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    categories = groupBy(landmarks, (Landmark obj) => obj.category);
    setState(() {});
  }

//  loadLandmarks() async {
//    String jsonString =
//        await rootBundle.loadString('assets/data/landmarkData.json');
//    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
//
//    landmarks = parsed.map<Landmark>((json) {
//      return Landmark.fromJson(json);
//    }).toList();
//    categories = groupBy(landmarks, (Landmark obj) => obj.category);
//    setState(() {});
//  }
}
