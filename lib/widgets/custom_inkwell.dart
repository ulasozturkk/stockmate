


import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget{
  const CustomInkWell({super.key, required this.height, required this.width, required this.ontap, required this.insideWidget});

  final double height;
  final double width;
  final VoidCallback ontap;
  final Widget insideWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
                child: Container(
                  height: height * 0.25,
                  width: width * 0.45,
                  color: Colors.blue,
                  child: insideWidget
                ),
                onTap: ontap
              );
  }

}