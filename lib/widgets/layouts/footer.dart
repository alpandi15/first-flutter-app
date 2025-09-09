import 'package:flutter/material.dart';
import 'package:identix_connect/core/theme/app_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return "v${packageInfo.version} (${packageInfo.buildNumber})";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getAppVersion(),
      builder: (context, snapshot) {
        final versionText = snapshot.data ?? '';
        return Center(
          child: Text(
            "Kebijakan Privasi • Syarat & Ketentuan • $versionText",
            style: TextStyle(fontSize: 12, color: AppColors.grey600),
          ),
        );
      },
    );
  }
}
