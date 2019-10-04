import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'package:wwdcflutter/views/CategoryItemLarge.dart';
import '../component/CategoryItem.dart';

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
    controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = 170;
    double height = 200;

    return Container(
      height: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 220),
                  controller: controller,
                  itemCount: widget.landmarks.length,
                  itemExtent: width,
                  itemBuilder: (context, index) {
                    double offset =
                        controller.position.pixels - (index * (width));
                    double degree = -(offset / 600.0);

                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.006) // perspective
                        ..rotateY(degree),
                      child: Container(
                        width: width,
                        height: height,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CategoryItemLarge(
                            landmark: widget.landmarks[index],
                            width: width,
                            height: height,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
