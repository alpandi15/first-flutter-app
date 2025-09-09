import 'package:flutter/material.dart';
import 'package:identix_connect/core/theme/app_colors.dart';

enum ButtonMode { filled, outlined }

enum ButtonVariant { primary, danger, success, warning, gray }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonMode mode;
  final ButtonVariant variant;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.mode = ButtonMode.filled,
    this.variant = ButtonVariant.primary,
    this.height = 56,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  /// 🎨 Theming warna
  Color _getColor(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primary500;
      case ButtonVariant.danger:
        return AppColors.red500;
      case ButtonVariant.success:
        return AppColors.green500;
      case ButtonVariant.warning:
        return AppColors.orange500;
      case ButtonVariant.gray:
        return AppColors.grey600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final isFilled = mode == ButtonMode.filled;
    final isDisabled = onPressed == null;

    return SizedBox(
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isDisabled
              ? Colors.grey.shade300
              : (isFilled ? color : Colors.transparent),
          foregroundColor: isDisabled
              ? Colors.grey.shade600
              : (isFilled ? Colors.white : color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: !isFilled ? BorderSide(
              color: color
            ) : BorderSide.none
          ),
          padding: padding,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: isDisabled ? AppColors.grey600 : (!isFilled ? color : (variant == ButtonVariant.primary ? AppColors.dark : AppColors.white)),
          ),
        ),
      ),
    );
  }
}
