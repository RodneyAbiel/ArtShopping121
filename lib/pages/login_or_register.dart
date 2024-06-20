
import 'package:artisian/emailPages/email_Login.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
//initially show login page
  bool showEmailLogin = true;

  //toogle btwn login and register
  void togglePages() {
    setState(() {
      showEmailLogin = !showEmailLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showEmailLogin) {
      return LoginPage(
        onTap: togglePages,
      );
    }else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
