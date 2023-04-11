import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 550,
                    left: -50,
                    child: Image.asset(
                      'assets/images/Deco1.png',
                      width: size.width * 3,
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: -550,
                    child: Image.asset(
                      'assets/images/Deco1.png',
                      width: size.width * 2,
                    ),
                  ),
                  Positioned(
                    bottom: -270,
                    left: 0,
                    child: Image.asset(
                      'assets/images/Deco1.png',
                      width: size.width * 2,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 60,
                    child: Image.asset(
                      'assets/images/Slide1.png',
                      width: size.width * 0.75,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
