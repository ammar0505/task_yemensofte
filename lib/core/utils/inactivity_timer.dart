import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/screen/delivery_login_screen.dart';

class InactivityTimer {
  static Timer? _timer;
  static const int _timeoutSeconds = 120; 

  static void startTimer(BuildContext context) {
    resetTimer(context);
  }

  static void resetTimer(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: _timeoutSeconds), () {
      
      Navigator.pushReplacement(
              context,
        MaterialPageRoute(
          builder: (context) =>  DeliveryLoginScreen(),
        ),
      );
    });
  }

  static void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
