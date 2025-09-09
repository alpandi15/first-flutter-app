import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:identix_connect/core/theme/app_colors.dart';
import 'package:identix_connect/features/tenant/widgets/header_home.dart';
import 'package:identix_connect/widgets/images/image.dart';

class TenantDashboardScreen extends StatelessWidget {
  const TenantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
      statusBarColor: AppColors.dark,
      statusBarIconBrightness: Brightness.light, // Android
      statusBarBrightness: Brightness.dark, // iOS
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(102),
          child: HeaderHomeTenant(
            title: "Nasi Goreng Mase",
            leading: ClipOval(
              child: SizedBox(
                width: 58, // diameter avatar
                height: 58,
                child: AppImage(
                  path: "assets/images/default.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            subtitle: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    )
                  ),
                  child: Text(
                    "Beralih ke akun Exhibitor",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12
                    ),
                  ),
                )
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
        // appBar: HeaderHomeTenant(
        //   title: "Business Matching 2",
        //   showBack: true,
        //   subtitle: Row(
        //     children: const [
        //       Text("15 Maret 2023"),
        //       SizedBox(width: 8),
        //       Text("Istora Senayan Jakarta"),
        //       SizedBox(width: 8),
        //       Icon(Icons.people, size: 14, color: Colors.white70),
        //       SizedBox(width: 2),
        //       Text("2"),
        //     ],
        //   ),
        //   trailing: IconButton(
        //     icon: const Icon(Icons.notifications, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child:  Column(
              // Switch Pre-Order
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Aktifkan Pre-Order",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Switch(value: true, onChanged: (val) {}, ),
                  ],
                ),
                const Text(
                  "Jika anda mengaktifkan fitur ini maka pelanggan dapat memesan makanan secara pre-order.",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),
                // Saldo
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.grey400.withValues(alpha: 0.5),
                        width: 1
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Saldo Toko", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        const Text("Rp25.000.000",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.grey200, // background kotak
                            borderRadius: BorderRadius.circular(8), // border radius
                          ),
                          child: const Text(
                            "Terakhir di-update 17/11/2023 - 10:50 WIB",
                            style: TextStyle(
                              color: AppColors.grey600,
                              fontSize: 12,
                              backgroundColor: AppColors.grey200
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ]
            )
          )
        ),
      )
    );
    // return SafeArea(
    //   child: SingleChildScrollView(
    //     padding: const EdgeInsets.all(16),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // Header
    //         Row(
    //           children: [
    //             CircleAvatar(
    //               radius: 24,
    //               backgroundImage: AssetImage("assets/images/default.jpeg"),
    //             ),
    //             const SizedBox(width: 12),
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: const [
    //                   Text(
    //                     "Nasi Goreng Mase",
    //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             TextButton(
    //               onPressed: () {},
    //               style: TextButton.styleFrom(
    //                 foregroundColor: Colors.black,
    //               ),
    //               child: const Text("Beralih ke akun Exhibitor"),
    //             ),
    //             const SizedBox(width: 8),
    //             const Icon(Icons.notifications),
    //           ],
    //         ),
    //         // const SizedBox(height: 16),

    //         // Switch Pre-Order
    //         // Row(
    //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //   children: [
    //         //     const Text(
    //         //       "Aktifkan Pre-Order",
    //         //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    //         //     ),
    //         //     Switch(value: true, onChanged: (val) {}),
    //         //   ],
    //         // ),
    //         // const Text(
    //         //   "Jika anda mengaktifkan fitur ini maka pelanggan dapat memesan makanan secara pre-order.",
    //         //   style: TextStyle(color: Colors.grey),
    //         // ),
    //         // const SizedBox(height: 16),

    //         // // Saldo
    //         // Card(
    //         //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //         //   child: Padding(
    //         //     padding: const EdgeInsets.all(16),
    //         //     child: Column(
    //         //       crossAxisAlignment: CrossAxisAlignment.start,
    //         //       children: const [
    //         //         Text("Saldo Toko", style: TextStyle(fontWeight: FontWeight.w600)),
    //         //         SizedBox(height: 8),
    //         //         Text("Rp25.000.000",
    //         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    //         //         SizedBox(height: 4),
    //         //         Text("Terakhir di-update 17/11/2023 - 10:50 WIB",
    //         //             style: TextStyle(color: Colors.grey, fontSize: 12)),
    //         //       ],
    //         //     ),
    //         //   ),
    //         // ),
    //         // const SizedBox(height: 16),

    //         // Menu grid
    //         // GridView.count(
    //         //   shrinkWrap: true,
    //         //   physics: const NeverScrollableScrollPhysics(),
    //         //   crossAxisCount: 4,
    //         //   mainAxisSpacing: 12,
    //         //   crossAxisSpacing: 12,
    //         //   children: const [
    //         //     _MenuItem(icon: Icons.menu_book, label: "Menu"),
    //         //     _MenuItem(icon: Icons.bar_chart, label: "Laporan"),
    //         //     _MenuItem(icon: Icons.store_mall_directory, label: "Katalog"),
    //         //     _MenuItem(icon: Icons.help, label: "Bantuan"),
    //         //   ],
    //         // ),
    //         // Wrap(
    //         //   spacing: 20,
    //         //   runSpacing: 12,
    //         //   alignment: WrapAlignment.spaceAround,
    //         //   children: const [
    //         //     _MenuItem(icon: Icons.menu_book, label: "Menu"),
    //         //     _MenuItem(icon: Icons.bar_chart, label: "Laporan"),
    //         //     _MenuItem(icon: Icons.store_mall_directory, label: "Katalog"),
    //         //     _MenuItem(icon: Icons.help, label: "Bantuan"),
    //         //   ],
    //         // ),
    //         const SizedBox(height: 16),

    //         // // Acara diikuti
    //         // const Text("Acara Yang Diikuti",
    //         //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //         // const SizedBox(height: 8),
    //         // Card(
    //         //   child: ListTile(
    //         //     leading: Image.asset("assets/images/event.jpg"),
    //         //     title: const Text("Business Matching 2"),
    //         //     subtitle: const Text("15 Maret 2023 • Istora, Jakarta Selatan"),
    //         //     trailing: const CircleAvatar(
    //         //       radius: 12,
    //         //       backgroundColor: Colors.red,
    //         //       child: Text("1", style: TextStyle(color: Colors.white, fontSize: 12)),
    //         //     ),
    //         //   ),
    //         // ),

    //         // const SizedBox(height: 16),

    //         // // Tim Member
    //         // const Text("Tim Member",
    //         //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //         // const SizedBox(height: 8),
    //         // Card(
    //         //   child: ListTile(
    //         //     leading: const Icon(Icons.group),
    //         //     title: const Text("Kelola Tim Member"),
    //         //     trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.yellow[700],
          child: Icon(icon, color: Colors.black, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
