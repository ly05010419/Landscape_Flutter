import 'package:flutter/material.dart';
import 'package:wwdcflutter/component/RowWidget.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/Avatar.dart';
import '../component/MapViewWidget.dart';

class DetailPageWidget extends StatelessWidget {
  final Landmark landmark;
  DetailPageWidget({this.landmark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: Text(landmark.name, style: TextStyle(fontSize: 21)),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Align( alignment: Alignment.center,
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
