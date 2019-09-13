import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'Avatar.dart';
import 'MapView.dart';


class LandmarkDetail extends StatelessWidget {
  final Landmark landmark;
  LandmarkDetail({this.landmark});

  @override
  Widget build(BuildContext context) {

    return Container(child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(height: 300,
              child: MapView(latitude: landmark.coordinates.latitude, longitude: landmark.coordinates.longitude,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200,left: 110),
              child: Avatar(imageName:landmark.getImageName(),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(landmark.name,style: TextStyle(fontSize: 16),),
        ),
      ],
    ),
    );
  }
}




