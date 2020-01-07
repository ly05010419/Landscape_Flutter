import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'package:wwdcflutter/pages/DetailPage.dart';
import 'ItemWidget.dart';

class RowWidget extends StatelessWidget {
  final String name;
  final Landmark landmark;
  RowWidget({this.name, this.landmark});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(5),
              itemCount: landmark.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:

                  GestureDetector(
                    onTap: (){
                      pushToDetailPage(context);
                    },
                    child: ItemWidget(
                      imageName: landmark.images[index],
                      width: 150,
                      height: 200,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  pushToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPageWidget(landmark: landmark,),
      ),
    );
  }
}
