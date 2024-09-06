import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/error_view.dart';
import 'package:qarz_daftar/presentation/views/home/home_view.dart';
import 'package:qarz_daftar/presentation/views/home/notification_view.dart';
import 'package:qarz_daftar/presentation/views/home/user_details_view.dart';
import 'package:qarz_daftar/presentation/views/main_view.dart';
import 'package:qarz_daftar/presentation/views/operations/borrowing_view.dart';
import 'package:qarz_daftar/presentation/views/operations/lending_view.dart';
import 'package:qarz_daftar/presentation/views/operations/operations_view.dart';
import 'package:qarz_daftar/presentation/views/profile/edit_profile_view.dart';
import 'package:qarz_daftar/presentation/views/profile/lenguage_view.dart';
import 'package:qarz_daftar/presentation/views/profile/notification_settings_view.dart';
import 'package:qarz_daftar/presentation/views/profile/profile_view.dart';
import 'package:qarz_daftar/presentation/views/profile/settings_view.dart';
import 'package:qarz_daftar/presentation/views/profile/theme_view.dart';
import 'package:qarz_daftar/presentation/views/splash_view.dart';
import 'package:qarz_daftar/presentation/views/users/users_view.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRouteName.splash,
    errorBuilder: (context, state) => const ErrorView(),
    routes: [
      GoRoute(
        path: AppRouteName.errorFound,
        builder: (context, state) => const ErrorView(),
      ),
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouteName.notification,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: AppRouteName.operation,
        builder: (context, state) => const OperationsView(),
      ),
      GoRoute(
        path: AppRouteName.lending,
        builder: (context, state) => const LendingView(images: []),
      ),
      GoRoute(
        path: AppRouteName.borrowing,
        builder: (context, state) => const BorrowingView(images: []),
      ),
      GoRoute(
        path: AppRouteName.userdetails,
        builder: (context, state) => const UserDetailsView(),
      ),
      mainView,
    ],
  );

  static final mainView = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainView(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.home,
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.users,
            builder: (context, state) => const UsersView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.profile,
            builder: (context, state) => const ProfileView(),
          ),
          GoRoute(
            path: AppRouteName.profileInfo,
            builder: (context, state) => const EditProfileView(),
          ),
          GoRoute(
            path: AppRouteName.settings,
            builder: (context, state) => const SettingsView(),
          ),
          GoRoute(
            path: AppRouteName.notificationSettings,
            builder: (context, state) => const NotificationSettingsView(),
          ),
          GoRoute(
            path: AppRouteName.lenguage,
            builder: (context, state) => const LenguageView(),
          ),
          GoRoute(
            path: AppRouteName.theme,
            builder: (context, state) => const ThemeView(),
          ),
        ],
      ),
    ],
  );
}
