import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rent_cart/authentication/auth_screen.dart';
import 'package:rent_cart/globals/globals.dart';
import 'package:rent_cart/main_screen/seller/home_screen.dart';
import 'package:rent_cart/main_screen/user/home_screen.dart';

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
      if (firebaseAuth.currentUser != null) {
        if (sharedPreferences!.getString('role') == 'seller') {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => SellerHomeScreen()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => MyHomeScreen()));
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MyAuthScreen()));
      }
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
