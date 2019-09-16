import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'Avatar.dart';
import 'CategoryRowWithEffect.dart';
import 'MapView.dart';


class LandmarkDetail extends StatelessWidget {
  final Landmark landmark;
  final List<Landmark> landmarks;
  LandmarkDetail({this.landmark,this.landmarks});

  @override
  Widget build(BuildContext context) {

    return Container(child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(height: 350,
              child: MapView(latitude: landmark.coordinates.latitude, longitude: landmark.coordinates.longitude,),
            ),
            Padding(padding: const EdgeInsets.only(top: 250,left: 110),
              child: Avatar(imageName:landmark.getImageName(),),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.all(10.0),
          child: Text(landmark.name,style: TextStyle(fontSize: 20),),
        ),
        CategoryRowWithEffect(name: "All",landmarks: landmarks, )
      ],),);
  }
}




