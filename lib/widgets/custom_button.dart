


import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key, required this.text, required this.onpressed, required this.height, required this.width});

  final String text;
  final VoidCallback onpressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      
      child: Container(
        height: height * 0.05,
        width: width * 0.25,
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),))

      ),
      onTap: onpressed,
    );
  }

}