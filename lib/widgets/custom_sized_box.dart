

import 'package:flutter/material.dart';

class CustomSizedbox extends StatelessWidget{
  const CustomSizedbox({super.key, required this.height, required this.width});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height*0.03,width: width,);
  }

}