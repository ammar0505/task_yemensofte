import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/shered_widget/show_language_dialog.widget.dart';
import 'package:task_yemensofte/core/style/app_color.dart';

class AppearWidget extends StatelessWidget {
  final String name;
  const AppearWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.redColor,
      width: double.infinity,
      height: 127,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.secondaryColor,
                  ),
                ),
                // Text(
                //   "Othman",
                //   style: TextStyle(
                //     fontSize: 25,
                //     fontWeight: FontWeight.w600,
                //     color: AppColor.secondaryColor,
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 134,
              height: 127,
              child: Image.asset(
                "images/png/ic_circle@2x.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 75,
            top: 10,
            child: SizedBox(
              width: 134,
              height: 127,
              child: Image.asset(
                "images/png/deliveryman@2x.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 30,
            child: GestureDetector(
              onTap: () {
                showLanguageDialog(context);
              },
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "images/png/ic_language@2x.png",
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
