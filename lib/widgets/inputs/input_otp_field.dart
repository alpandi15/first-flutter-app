import 'package:flutter/material.dart';
import 'package:identix_connect/core/theme/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final String? Function(String?)? validator;
  final void Function(String otp) onSubmit;
  final FocusNode? focusNode;
  final bool disabled;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.length = 6, // default banking style 6 digit
    this.validator,
    this.focusNode,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: length,
      keyboardType: TextInputType.number,
      autoFocus: true,
      focusNode: focusNode,
      enabled: !disabled,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 56,
        fieldWidth: 48,
        activeColor: AppColors.primary500,
        selectedColor: AppColors.primary600,
        inactiveColor: AppColors.grey400,
        activeFillColor: AppColors.white,
        selectedFillColor: AppColors.white,
        inactiveFillColor: AppColors.white,
      ),
      cursorColor: AppColors.primary500,
      animationDuration: const Duration(milliseconds: 250),
      enableActiveFill: true,
      validator: validator,
      onChanged: (value) {},
      onCompleted: (value) {
        onSubmit(value);
      },
    );
  }
}
