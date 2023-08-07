

import 'package:flutter/material.dart';
import 'package:stockmate/auth/authRepository/authRepository.dart';
import 'package:stockmate/widgets/custom_button.dart';
import 'package:stockmate/widgets/custom_textfield.dart';

mixin SignUpWidgets {
  Widget Appbody(double height,double width,TextEditingController nameSurnameController,TextEditingController shopNameController,
  TextEditingController emailController, TextEditingController passwordController,TextEditingController verifyController, AuthRepository provider, 
  BuildContext context
  ) {
    return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
            height: height * 0.1,
            width: width * 0.8,
            child: CustomTextField(controller:nameSurnameController,hinttext: "İsminiz")
          ),
          SizedBox(
            height: height * 0.1,
            width: width * 0.8,
            child: CustomTextField(controller:shopNameController,hinttext: "İşletme Adınız")
          ),
              SizedBox(
            height: height * 0.1,
            width: width * 0.8,
            child: CustomTextField(controller:emailController,hinttext: "E-posta")
          ),
          SizedBox(
            height: height * 0.1,
            width: width * 0.8,
            child: CustomTextField(controller:passwordController,hinttext: "Şifre")
          ),
          SizedBox(
            height: height * 0.1,
            width: width * 0.8,
            child: CustomTextField(controller:verifyController,hinttext: "Şifre Tekrar")
          ),
      
          CustomButton(text: "Kayıt Ol",
          onpressed: () {
            provider.signUpWithEmail(
              emailController.text.trim(), 
              passwordController.text.trim(), 
              verifyController.text.trim(), 
              shopNameController.text.trim(), 
              nameSurnameController.text.trim(), 
              context);

          }, 
          height: height, 
          width: width
          )
      
            ],
          ),
        ),
      );
  }
}