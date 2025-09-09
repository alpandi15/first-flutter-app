import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:identix_connect/features/choose_account/choose_account_page.dart';
import 'package:identix_connect/features/tenant/presentation/home/home.page.dart';

import '../features/auth/presentation/login_page.dart';
import '../features/auth/presentation/otp_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    /// ===================== AUTH STACK =====================
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(), // ini optional
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/otp',
          builder: (context, state) => OtpPage(),
        ),
        GoRoute(
          path: '/choose-account',
          builder: (context, state) => const ChooseAccountPage(),
        ),
      ],
    ),
    /// ===================== TENANT STACK =====================
    ShellRoute(
      // builder: (context, state, child) => TenantLayout(child: child),
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: '/tenant/dashboard',
          builder: (context, state) => const HomeTenantScreen(),
        ),
      ],
    ),
  ],
);
