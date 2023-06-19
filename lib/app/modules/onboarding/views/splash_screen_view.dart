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
                    bottom: 180,
                    left: 0,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: size.width,
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
