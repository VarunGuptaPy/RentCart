import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.cyan, Colors.amber])),
        ),
        title: Text(
          'iFood',
          style: TextStyle(fontSize: 40, fontFamily: "Varela"),
        ),
        centerTitle: true,
      ),
    );
  }
}
