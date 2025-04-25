import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_yemensofte/core/shered_widget/show_language_dialog.widget.dart';
import 'package:task_yemensofte/core/style/app_color.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/manger/cubit/delivery_login_cubit_cubit.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/widget/elevated_button_widget.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/widget/textfield_widget.dart';
import 'package:task_yemensofte/features/order_feature/presentation/screen/order_screen.dart';

class DeliveryLoginScreen extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DeliveryLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: BlocConsumer<DeliveryLoginCubit, DeliveryLoginCubitState>(
        listener: (context, state) {
          print('Current State: $state');
          if (state is DeliveryLoginCubitSuccess) {
            print('Login Success: ${state.deliveryLoginEntity.name}');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OrdersScreen(name: state.deliveryLoginEntity.name ?? '')),
            );
          } else if (state is DeliveryLoginCubitFailure) {
            print('Login Failed: ${state.errorMessage}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                if (state is DeliveryLoginCubitLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButtonWidget(
                    text: 'Log in',
                    onPressed: () {
                      if (userIdController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      context.read<DeliveryLoginCubit>().signIn(
                            userIdController.text,
                            passwordController.text,
                            '2',
                          );
                    },
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
          );
        },
      ),
    );
  }
}
