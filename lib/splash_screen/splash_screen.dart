import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rent_cart/authentication/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => MyAuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('image/splash.png'),
            const Text(
              'Rent Anything Online',
              style: TextStyle(fontFamily: "Signatra", fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
