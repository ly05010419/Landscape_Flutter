import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'package:wwdcflutter/views/CategoryItemLarge.dart';
import 'CategoryItem.dart';

class CategoryRowWithEffect extends StatefulWidget {
  final List<Landmark> landmarks;
  final String name;
  CategoryRowWithEffect({this.landmarks, this.name});

  @override
  _CategoryRowWithEffectState createState() => _CategoryRowWithEffectState();
}

class _CategoryRowWithEffectState extends State<CategoryRowWithEffect> {
  ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();
    controller.addListener((){

      print('controller.position.pixels:${controller.position.pixels}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              controller: controller,
              itemCount: widget.landmarks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryItemLarge(
                    landmark: widget.landmarks[index],
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
