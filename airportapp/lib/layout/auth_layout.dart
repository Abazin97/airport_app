import 'package:airportapp/pages/me_auth_page.dart';
import 'package:airportapp/pages/me_page.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:flutter/material.dart';


class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.authNotifier});

  final AuthNotifier authNotifier;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: authNotifier,
      builder: (context, _) {
        if (!authNotifier.isLoggedIn){
          return MePage();
        }
        else{
          return MeAuthPage();
        }
      }
    );
  }
}