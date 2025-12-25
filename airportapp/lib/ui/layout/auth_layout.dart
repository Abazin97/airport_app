import 'package:airportapp/ui/pages/me_auth_page.dart';
import 'package:airportapp/ui/pages/me_page.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/domain/auth/auth_status.dart';
import 'package:flutter/material.dart';


class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.authNotifier});
  final AuthNotifier? authNotifier;


  @override
  Widget build(BuildContext context) {
    final auth = authNotifier;

    if (auth == null || auth.status == AuthStatus.loading || auth.status == AuthStatus.unauthenticated){
      return MePage();
    }
    
    return MeAuthPage();
  }
}