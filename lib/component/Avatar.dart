import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageName;
  AvatarWidget({Key key, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageName),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.grey, width: 4),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 10)
          ]),
    );
  }
}
