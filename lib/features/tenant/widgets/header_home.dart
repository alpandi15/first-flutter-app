import 'package:flutter/material.dart';
import 'package:identix_connect/core/theme/app_colors.dart';

class HeaderHomeTenant extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? subtitle;
  final bool showBack;
  final Widget? leading;
  final Widget? trailing;
  final double height;

  const HeaderHomeTenant({
    super.key,
    required this.title,
    this.subtitle,
    this.showBack = false,
    this.leading,
    this.trailing,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(
        color: AppColors.dark,
        // gradient: LinearGradient(
        //   colors: [Colors.black87, Colors.black54],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Leading
          if (showBack)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            )
          else if (leading != null)
            leading!,

          // Title & Subtitle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12), // kasih gap dari leading
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 6), // gap lebih besar biar lega
                    subtitle!, // langsung render widget apapun
                  ],
                ],
              ),
            ),
          ),

          // Trailing
          trailing ??
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
