import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'ItemView.dart';

class RowView extends StatelessWidget {
  final String name;
  final Landmark landmark;
  RowView({this.name,this.landmark});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(5),
              itemCount: landmark.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemView(
                    landmark: landmark,
                    imageName: landmark.images[index],
                    width: 150,
                    height: 150,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
