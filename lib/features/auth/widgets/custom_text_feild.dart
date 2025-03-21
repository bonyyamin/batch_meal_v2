import 'package:batch_meal_v2/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType inputType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppTheme.greyColor,
        prefixIcon: Icon(icon, color: AppTheme.backgroundLight),
        suffixIcon:
            isPassword
                ? Icon(Icons.visibility_outlined, color: Colors.grey.shade600)
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
