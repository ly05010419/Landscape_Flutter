import 'package:flutter/material.dart';
import 'package:wwdcflutter/model/models.dart';
import 'ItemWidget.dart';

class RowWithEffect extends StatefulWidget {
  final Landmark landmark;
  final String name;
  RowWithEffect({this.landmark, this.name});

  @override
  _RowWithEffectState createState() => _RowWithEffectState();
}

class _RowWithEffectState extends State<RowWithEffect> {
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
      height: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
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
                  padding: EdgeInsets.only(left: 15, right: 230),
                  controller: controller,
                  itemCount: widget.landmark.images.length,
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
                          child: ItemWidget(
                            imageName: widget.landmark.images[index],
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
