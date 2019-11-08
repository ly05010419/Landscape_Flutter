import 'package:flutter/cupertino.dart';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'RowView.dart';
import 'RowWithEffect.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

List<Landmark> landmarks;

class _HomeViewState extends State<HomeView> {
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
    String jsonString =
        await rootBundle.loadString('assets/data/landmarkData.json');
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    landmarks = parsed.map<Landmark>((json) {
      return Landmark.fromJson(json);
    }).toList();
    categories = groupBy(landmarks, (Landmark obj) => obj.category);
    setState(() {});
  }
}
