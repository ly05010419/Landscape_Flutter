import 'package:flutter/cupertino.dart';
import "package:collection/collection.dart";
import 'package:wwdcflutter/model/models.dart';

import 'RowView.dart';
import 'RowWithEffect.dart';

class HomeView extends StatelessWidget {
  final Landmark landmark;
  final List<Landmark> landmarks;
  Map<String, List<Landmark>> categories;

  HomeView({this.landmark, this.landmarks});

  @override
  Widget build(BuildContext context) {
    categories = groupBy(landmarks, (Landmark obj) => obj.category);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(landmark.name),
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/Los_Angeles.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                RowWithEffect(
                  name: "All",
                  landmarks: landmarks,
                ),
                Column(
                  children: categories.keys
                      .map((k) => RowView(
                            name: k,
                            landmarks: categories[k],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
