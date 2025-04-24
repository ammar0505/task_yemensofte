import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_yemensofte/core/shered_widget/show_language_dialog.widget.dart';
import 'package:task_yemensofte/core/style/app_color.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/widget/elevated_button_widget.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/widget/textfield_widget.dart';

class DeliveryLoginScreen extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DeliveryLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: SvgPicture.asset(
                    'images/Group 3915.svg',
                    height: 74,
                    width: 170,
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      child: SvgPicture.asset(
                        'images/ic_circle.svg',
                        width: 121,
                        height: 127,
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      right: 5,
                      child: Center(
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'images/ic_language.svg',
                            width: 27.51,
                            height: 27.52,
                            color: AppColor.secondaryColor,
                          ),
                          onPressed: () {
                            showLanguageDialog(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 48),
            Center(
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: AppColor.primaryColor,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: const Text(
                'Log back into your account',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: AppColor.primaryColor,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 32),
            TextFieldWidget(
              hintText: 'User ID',
              keyboardType: TextInputType.number,
              controller: userIdController,
            ),
            // const SizedBox(height: 16),
            TextFieldWidget(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Show More",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButtonWidget(
              text: 'Log in',
              onPressed: () {},
            ),
            const SizedBox(height: 50),
            // const Spacer(),
            Center(
              child: SvgPicture.asset(
                'images/delivery.svg',
                height: 170,
                width: 195,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
