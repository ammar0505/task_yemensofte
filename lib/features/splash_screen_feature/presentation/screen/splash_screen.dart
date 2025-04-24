import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/screen/delivery_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DeliveryLoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(233, 250, 255, 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset(
                'images/Group 3915.svg',
                height: 112,
                width: 276,
              ),
            ),
            Positioned(
              bottom: 25,
              child: SvgPicture.asset(
                'images/Path 1.svg',
                height: 245,
                width: 374,
              ),
            ),
            Positioned(
              bottom: 1,
              child: SvgPicture.asset(
                'images/Group 8.svg',
                height: 209.27,
                width: 270.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
