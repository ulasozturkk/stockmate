

import 'package:flutter/material.dart';
import 'package:stockmate/auth/authRepository/authRepository.dart';
import 'package:stockmate/widgets/custom_button.dart';
import 'package:stockmate/widgets/custom_sized_box.dart';
import 'package:stockmate/widgets/custom_textfield.dart';
mixin SignInWidgets{
  Widget AppBody(double height,double width,
  AuthRepository provider,TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context
  ) {
    return Center(child: Column(
      children: [
        SizedBox(
          height: height * 0.1,
          width: width * 0.8,
          child: CustomTextField(controller:emailController,hinttext: "E-posta")
        ),
        SizedBox(
          height: height * 0.1,
          width: width * 0.8,
          child: CustomTextField(controller:passwordController, hinttext: "Şifre")
        ),
        CustomSizedbox(height:height,width: width),
        CustomButton(height:height,width: width,
         onpressed: () { 
          provider.signInWithEmail(emailController.text.trim(), passwordController.text.trim(),context);

          },
           text: "Giriş Yap"),
        CustomSizedbox(height:height,width: width),
        Divider(),
        CustomSizedbox(height:height,width: width),
        Text("Henüz bir hesabınız yok mu?",style: TextStyle(color: Colors.black,fontSize: 18),),
        CustomSizedbox(height:height,width: width),
        CustomButton(height:height, width:width*3, onpressed: () { 
        Navigator.pushNamed(context, "/signup");
       }, text: "Kayıt Ol")

      ],
     ));
  }

}

