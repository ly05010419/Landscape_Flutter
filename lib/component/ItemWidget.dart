import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String imageName;
  final double width;
  final double height;
  ItemWidget({Key key, this.imageName, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(5, 5))
            ]),
      ),
    );
  }
}


