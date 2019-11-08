import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import '../component/ItemView.dart';

class RowView extends StatelessWidget {
  final List<Landmark> landmarks;
  final String name;
  RowView({this.landmarks, this.name});

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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(5),
              itemCount: landmarks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemView(
                    landmark: landmarks[index],
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
