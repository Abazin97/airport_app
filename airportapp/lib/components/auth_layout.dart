import 'package:airportapp/pages/apploading_page.dart';
import 'package:airportapp/pages/me_auth_page.dart';
import 'package:airportapp/pages/me_page.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService, 
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges, 
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting){
              widget = ApploadingPage();
            }
            else if (snapshot.hasData){
              widget = const MeAuthPage();
            }else{
              widget = pageIfNotConnected ?? const MePage();
            }
            return widget;
          }
        );
      });
  }
}