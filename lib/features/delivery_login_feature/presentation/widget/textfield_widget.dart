import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/style/app_color.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.textFieldColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: AppColor.textColor,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
