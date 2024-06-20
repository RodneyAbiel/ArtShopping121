


import 'package:artisian/stock/pages/stockpage.dart';
import 'package:flutter/material.dart';

class InventoryLogin extends StatefulWidget {
  @override
  State<InventoryLogin> createState() => _InventoryLoginState();
}

class _InventoryLoginState extends State<InventoryLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _dismissKeyboard(context),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.grey])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _page(),
        ),
      ),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(
                height: 50,
              ),
              _inputField("Username", usernameController),
              const SizedBox(
                height: 20,
              ),
              _inputField("Password", passwordController, isPassword: true),
              const SizedBox(height: 20),
              _loginBtn(),
              const SizedBox(height: 20),
              _extraText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person_2_rounded,
        color: Colors.blueGrey,
        size: 140,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false,
      TextDirection hintTextDirection = TextDirection.ltr}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.blue));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        hintTextDirection: hintTextDirection, // Use the parameter value here
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const StockPage(); // Navigate to Dashboard page
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor:
            const Color.fromARGB(255, 228, 226, 226), // Background color
        foregroundColor: Colors.black, // Text color (foreground color)
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "Password Forgotten?",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
