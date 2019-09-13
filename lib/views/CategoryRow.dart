import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'CategoryItem.dart';

class CategoryRow extends StatelessWidget {
  final List<Landmark> landmarks;
  final String name;
  CategoryRow({this.landmarks,this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemCount: landmarks.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryItem(
                    landmark: landmarks[index],
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
