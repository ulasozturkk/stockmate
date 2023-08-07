


import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.errormessage});
  final String errormessage;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(errormessage,style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.white,
      action: SnackBarAction(label: "test", onPressed: (){}),

      
      );
  }

}