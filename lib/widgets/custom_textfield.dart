

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({super.key, required this.controller, required this.hinttext});

  final TextEditingController controller;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: hinttext
            )
    );
  }

}