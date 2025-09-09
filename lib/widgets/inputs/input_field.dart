import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:identix_connect/core/theme/app_colors.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String name;
  final String? hint;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const AppInputField({
    super.key,
    required this.name,
    required this.label,
    this.controller,
    this.hint,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.grey600
          ),
        ),
        FormBuilderTextField(
          name: name,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          // onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            hintStyle: TextStyle(color: AppColors.grey600, fontWeight: FontWeight.w300),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: errorText != null
                ? theme.colorScheme.error
                : AppColors.grey600
              )
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: errorText != null
                ? theme.colorScheme.error
                : theme.colorScheme.primary
              )
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
