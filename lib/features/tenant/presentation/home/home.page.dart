import 'package:flutter/material.dart';
import 'package:identix_connect/features/tenant/presentation/home/tenant_dashboard.dart';
import 'package:identix_connect/features/tenant/presentation/home/tenant_profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeTenantScreen extends StatefulWidget {
  const HomeTenantScreen({super.key});

  @override
  State<HomeTenantScreen> createState() => _HomeTenantScreenState();
}

class _HomeTenantScreenState extends State<HomeTenantScreen> {
  int _currentIndex = 0;

  final _pages = [
    const TenantDashboardScreen(),
    const TenantProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
