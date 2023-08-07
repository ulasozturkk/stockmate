import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockmate/auth/authRepository/authRepository.dart';
import 'package:stockmate/auth/register/sign_up_widgets.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> with SignUpWidgets {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final verifyController = TextEditingController();
    final shopNameController = TextEditingController();
    final nameSurnameController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(AuthRepositoryProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(   
      appBar: AppBar(title: Text("Kayıt Ol"),),
      body: Appbody(height, width, nameSurnameController, shopNameController, emailController, passwordController, verifyController, provider, context)
    );
  }
}
