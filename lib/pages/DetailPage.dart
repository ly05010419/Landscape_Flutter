import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/Avatar.dart';
import '../component/RowWithEffect.dart';
import '../component/MapView.dart';

class DetailPage extends StatelessWidget {
  final Landmark landmark;
  final List<Landmark> landmarks;
  DetailPage({this.landmark, this.landmarks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(landmark.name,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: MapView(
                      landmark: landmark,
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Avatar(
                        imageName: landmark.avatarName,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  landmark.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RowWithEffect(
                name: "All",
                landmark: landmark,
              )
            ],
          ),
        ));
  }
}
