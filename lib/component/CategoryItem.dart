import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';

class CategoryItem extends StatelessWidget {
  final Landmark landmark;
  CategoryItem({Key key, this.landmark}) : super(key: key);

  double width = 150.0;
  double height = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height+40,
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(landmark.getImageName()),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 5)
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(landmark.name),
          )
        ],
      ),
    );
  }
}

