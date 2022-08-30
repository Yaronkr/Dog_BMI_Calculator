import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TopGradient extends StatelessWidget {
  final width;
  const TopGradient({this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(140.0),
            bottomRight: Radius.circular(40.0),
          ), // radius of 10
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(250, 0, 97, 255),
              Color.fromARGB(250, 96, 239, 255),
            ],
          ),
        ),
      ),
    );
  }
}
