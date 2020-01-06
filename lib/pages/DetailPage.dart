import 'package:flutter/material.dart';
import 'package:wwdcflutter/component/RowWidget.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/Avatar.dart';
import '../component/RowWithEffect.dart';
import '../component/MapViewWidget.dart';

class DetailPageWidget extends StatelessWidget {
  final Landmark landmark;
  DetailPageWidget({this.landmark});

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
                    child: MapViewWidget(
                      landmark: landmark,
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: AvatarWidget(
                        imageName: landmark.avatarName,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RowWidget(
                  name: "All",
                  landmark: landmark,
                ),
              )
            ],
          ),
        ));
  }
}
