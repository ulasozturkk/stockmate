import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockmate/auth/authRepository/authRepository.dart';
import 'package:stockmate/auth/sign_in/sign_in_widgets.dart';
class SignInPage extends ConsumerWidget with SignInWidgets{
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(AuthRepositoryProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
     appBar: AppBar(title:Center(child: Text("Kayıt ol veya Giriş Yap",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))),
     body: AppBody(height, width, provider, emailController, passwordController, context)
    );
  }
}