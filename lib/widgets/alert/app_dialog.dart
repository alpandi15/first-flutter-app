import 'package:flutter/material.dart';

enum AppDialogType { info, success, warning, error }

class AppDialog {
  static Future<bool?> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Batal',
    AppDialogType type = AppDialogType.info,
    bool barrierDismissible = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => _AppAlert(
        title: title,
        message: message,
        type: type,
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(cancelText)),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(confirmText)),
        ],
      ),
    );
  }

  static Future<void> alert(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'Tutup',
    AppDialogType type = AppDialogType.info,
    bool barrierDismissible = true,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => _AppAlert(
        title: title,
        message: message,
        type: type,
        actions: [
          FilledButton(onPressed: () => Navigator.pop(context), child: Text(buttonText)),
        ],
      ),
    );
  }
}

class _AppAlert extends StatelessWidget {
  final String title;
  final String message;
  final AppDialogType type;
  final List<Widget> actions;

  const _AppAlert({
    required this.title,
    required this.message,
    required this.type,
    required this.actions,
  });

  Color _accent(BuildContext ctx) {
    // ganti ke AppColors kamu
    switch (type) {
      case AppDialogType.success: return const Color(0xFF29B712);
      case AppDialogType.warning: return const Color(0xFFFDB022);
      case AppDialogType.error:   return const Color(0xFFCC2C00);
      case AppDialogType.info:    return Theme.of(ctx).colorScheme.primary;
    }
  }

  IconData _icon() {
    switch (type) {
      case AppDialogType.success: return Icons.check_circle_rounded;
      case AppDialogType.warning: return Icons.warning_rounded;
      case AppDialogType.error:   return Icons.error_rounded;
      case AppDialogType.info:    return Icons.info_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _accent(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: .12),
              radius: 28,
              child: Icon(_icon(), color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black.withValues(alpha: .7)), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Row(
              children: [
                for (int i = 0; i < actions.length; i++) ...[
                  Expanded(child: actions[i]),
                  if (i != actions.length - 1) const SizedBox(width: 12),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
