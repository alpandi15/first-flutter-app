import 'package:flutter/material.dart';
import 'package:identix_connect/core/theme/app_colors.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final double height;

  const AppHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle ?? const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColors.white,
        ),
      ),
      centerTitle: centerTitle,
      iconTheme: IconThemeData(
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
      leading: leading ??
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
          onPressed: () => Navigator.pop(context),
        ),
      actions: actions,
      elevation: 0,
      backgroundColor: AppColors.dark,
      foregroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
