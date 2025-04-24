import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/style/app_color.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Center(
              child: Container(
                width: 342,
                height: 44,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
  }
}