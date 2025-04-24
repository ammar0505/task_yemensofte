import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/style/app_color.dart';

void showLanguageDialog(BuildContext context) {
  String selectedLanguage = 'en';

  showDialog(
    barrierColor: const Color.fromRGBO(244, 244, 244, 1),
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Choose Language',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildLanguageOption(
                        isSelected: selectedLanguage == 'ar',
                        onTap: () => setState(() => selectedLanguage = 'ar'),
                        label: 'العربية',
                        subLabel: 'Arabic',
                        flag: '🇸🇦',
                      ),
                      const SizedBox(width: 8),
                      _buildLanguageOption(
                        isSelected: selectedLanguage == 'en',
                        onTap: () => setState(() => selectedLanguage = 'en'),
                        label: 'English',
                        subLabel: 'English',
                        flag: '🇬🇧',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildLanguageOption({
  required bool isSelected,
  required VoidCallback onTap,
  required String label,
  required String subLabel,
  required String flag,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.greenColor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColor.textColor,
                  ),
                ),
                Text(
                  subLabel,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
