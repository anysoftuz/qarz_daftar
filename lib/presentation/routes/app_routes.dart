import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/application/users/users_bloc.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/views/auth/auth_telegram_view.dart';
import 'package:qarz_daftar/presentation/views/auth/confirmation_login_view.dart';
import 'package:qarz_daftar/presentation/views/error_view.dart';
import 'package:qarz_daftar/presentation/views/home/home_view.dart';
import 'package:qarz_daftar/presentation/views/home/notification_view.dart';
import 'package:qarz_daftar/presentation/views/home/user_details_view.dart';
import 'package:qarz_daftar/presentation/views/main_view.dart';
import 'package:qarz_daftar/presentation/views/operations/contacts_view.dart';
import 'package:qarz_daftar/presentation/views/operations/operations_view.dart';
// import 'package:qarz_daftar/presentation/views/profile/edit_profile_view.dart';
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
        path: AppRouteName.auth,
        builder: (context, state) => const AuthTelegramView(),
      ),
      GoRoute(
        path: AppRouteName.confirmLogin,
        builder: (context, state) => const ConfirmationLoginView(),
      ),
      GoRoute(
        path: AppRouteName.operation,
        builder: (context, state) => BlocProvider.value(
          value: (state.extra as UsersBloc),
          child: const OperationsView(),
        ),
      ),
      GoRoute(
        path: AppRouteName.contacts,
        builder: (context, state) => BlocProvider(
          create: (context) => UsersBloc(),
          child: const ContactsView(),
        ),
      ),
      // GoRoute(
      //   path: AppRouteName.lending,
      //   builder: (context, state) => const LendingView(images: []),
      // ),
      // GoRoute(
      //   path: AppRouteName.borrowing,
      //   builder: (context, state) => const BorrowingView(images: []),
      // ),
      GoRoute(
        path: AppRouteName.userdetails,
        builder: (context, state) => BlocProvider(
          create: (context) => UsersBloc(),
          child: UserDetailsView(model: (state.extra as OperationModel)),
        ),
      ),
      mainView,
    ],
  );

  static final mainView = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return BlocProvider(
        create: (context) => UsersBloc(),
        child: MainView(navigationShell: navigationShell),
      );
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.home,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: AppRouteName.notification,
            builder: (context, state) => const NotificationView(),
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
          // GoRoute(
          //   path: AppRouteName.profileInfo,
          //   builder: (context, state) => const EditProfileView(),
          // ),
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
