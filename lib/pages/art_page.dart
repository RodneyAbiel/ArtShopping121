import 'package:flutter/material.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({Key? key}) : super(key: key);

  @override
  State<ArtPage> createState() => _ArtPageState();
}

class _ArtPageState extends State<ArtPage> {
  // Color backgroundColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/Monalisa.jpeg'),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/Greek.jpg'),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/gear5.jpeg'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/mike.jpg'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/one.jpeg'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/Spartan.jpeg'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/sculpture.jpg'),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/hands.jpg'),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/yuji.jpeg'),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/VanGoh.jpeg'),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset('images/Caravaggio.jpeg'),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
