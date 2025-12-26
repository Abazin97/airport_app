import 'package:airportapp/ui/pages/me_auth_page.dart';
import 'package:airportapp/ui/pages/me_page.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/domain/auth/auth_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthNotifier?>();

    switch (auth?.status) {
      case AuthStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case AuthStatus.unauthenticated:
      case AuthStatus.idle:
      case AuthStatus.error:
        return const MePage();

      case AuthStatus.authenticated:
        return const MeAuthPage();

      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
