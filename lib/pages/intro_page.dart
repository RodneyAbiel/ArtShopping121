
import 'package:artisian/pages/login_or_register.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background colour intro page
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//logo
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/art2.jpeg',
                  height: 240,
                ),
              ),
              const SizedBox(height: 20),
//title
              const Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
//sub title
              const SizedBox(height: 20),
              const Text(
                "For All Paints",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
//enter button
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginOrRegister(),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey, //shop now container
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
