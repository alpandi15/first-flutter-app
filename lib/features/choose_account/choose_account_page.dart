import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:identix_connect/core/theme/app_colors.dart';
import 'package:identix_connect/widgets/alert/app_dialog.dart';
import 'package:identix_connect/widgets/buttons/account_option_button.dart';
import 'package:identix_connect/widgets/images/image.dart';
import 'package:identix_connect/widgets/layouts/footer.dart';

enum SelectValues { tenant, exhibitor }

class ChooseAccountPage extends StatefulWidget {
  const ChooseAccountPage({
    super.key
  });

  @override
  State<StatefulWidget> createState() => _ChooseAccountPageState();
}

class _ChooseAccountPageState extends State<ChooseAccountPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark, // Android
      statusBarBrightness: Brightness.light, // iOS
    ));
  }

  Future<void> _onSelect(SelectValues type) async {
    String title = 'Berhasil';
    String message = 'Data tersimpan.';

    switch (type) {
      case SelectValues.tenant:
        // Kalau nanti butuh logika tambahan khusus tenant bisa ditaruh di sini
        context.go('/tenant/dashboard');
        break;
      case SelectValues.exhibitor:
        // Kalau nanti butuh logika tambahan khusus exhibitor bisa ditaruh di sini

        await AppDialog.alert(
          context,
          title: title,
          message: message,
          type: AppDialogType.success,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppImage(
                    path: "assets/images/logo_app.png",
                    width: 100,
                  ),
                  const SizedBox(height: 62),
                  Text(
                    "Hai, Lula",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Pilih akun anda",
                  ),
                  const SizedBox(height: 16),
                  // Option Buttons
                  AccountOptionButton(
                    title: "F&B Tenant",
                    description: "Masuk ke akun F&B tenant anda",
                    icon: Icons.fastfood_outlined,
                    iconBackground: Colors.yellow,
                    onTap: () {
                      // aksi F&B Tenant
                      _onSelect(SelectValues.tenant);
                    },
                  ),
                  AccountOptionButton(
                    title: "Exhibitor",
                    description: "Masuk ke akun exhibitor anda",
                    icon: Icons.store_outlined,
                    iconBackground: Colors.yellow,
                    onTap: () {
                      // aksi Exhibitor
                      _onSelect(SelectValues.exhibitor);
                    },
                  ),
                ],
              ),
              const Spacer(),

              // Footer
              const AppFooter(),
            ],
          ),
        ),
      )
    );
  }
}