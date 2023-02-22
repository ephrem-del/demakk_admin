import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void _nextScreen(context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, 'login_screen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _nextScreen(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/demakk_logo.png',
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 80,
            ),
            const CircularProgressIndicator(
              strokeWidth: 5.0,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
