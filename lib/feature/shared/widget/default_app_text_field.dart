import 'package:crud_graphql/core/utils/app_width.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class DefaultAppTextField extends StatelessWidget {
  final String? labelText;

  final TextEditingController? controller;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final bool obscureText;

  const DefaultAppTextField(
      {super.key,
      this.labelText,
      this.controller,
      this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: AppColors.gray,
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.primary,
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.primary,
          )),
          focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primary, width: AppWidth.w4))),
    );
  }
}
