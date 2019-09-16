import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';

class CategoryItemLarge extends StatelessWidget {
  final Landmark landmark;
  final double width;
  final double height;

  CategoryItemLarge({Key key, this.landmark,this.width,this.height}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height+40,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width-10,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(landmark.getImageName()),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(landmark.name,style: TextStyle(fontSize: 12),),
          )
        ],
      ),
    );
  }
}
