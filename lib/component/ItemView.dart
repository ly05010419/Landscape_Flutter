import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'package:wwdcflutter/pages/HomePage.dart';
import 'package:wwdcflutter/pages/DetailPage.dart';

class ItemView extends StatelessWidget {
  final Landmark landmark;
  final String imageName;
  final double width;
  final double height;
  ItemView({Key key, this.imageName,this.landmark, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height + 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    landmark: landmark,
                    landmarks: landmarks,
                  ),
                ),
              );
            },
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageName),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(5, 5))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
