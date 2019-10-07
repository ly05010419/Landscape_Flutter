import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wwdcflutter/component/ItemView.dart';
import 'package:wwdcflutter/views/RowView.dart';
import 'package:wwdcflutter/views/RowWithEffect.dart';
import 'package:wwdcflutter/views/HalloView.dart';
import 'package:wwdcflutter/views/HomeView.dart';
import 'component/Avatar.dart';
import 'component/MapView.dart';
import 'views/LandmarkDetail.dart';
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

var items = const [
  "Home",
  "mapWithAvatar",
  "Avatar",
  "MapView",
];

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
      navigationBar: CupertinoNavigationBar(
        middle: Text("App"),
      ),
      child: SafeArea(
        child: ListView.separated(
          separatorBuilder: (_, index) => SizedBox(
            width: double.infinity,
            height: 1,
            child: Divider(
              indent: 16,
              color: Color.fromRGBO(200, 199, 204, 1.0),
            ),
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {

                switch(index){
                  case 0: Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(
                        landmark: landmarks[0],
                        landmarks: landmarks,
                      ),
                    ),
                  );break;
                  case 1: Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandmarkDetail(
                        landmark: landmarks[0],
                        landmarks: landmarks,
                      ),
                    ),
                  );break;

                }

              },
              child: Container(
                height: 44,
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[index],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromRGBO(200, 199, 204, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
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

//      body: landmarks != null ? LandmarkDetail(
//        landmark: landmarks[0],
//        landmarks: landmarks,
//      ):Container(),

//            body:  HalloView(),
//      body: landmarks != null
//          ? Center(
//              child: CategoryRow(
//              landmarks: landmarks,
//              name: "Lakes",
//            ))
//          : Container(),

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
