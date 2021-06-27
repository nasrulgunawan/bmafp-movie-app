import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, Routes.main));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 260,
              height: 61,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Movee",
              textScaleFactor: 1.3,
            )
          ],
        ),
      ),
    );
  }
}
