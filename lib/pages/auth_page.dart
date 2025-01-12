
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../intro_page.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return const IntroPage();
          }
//user NOT logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
