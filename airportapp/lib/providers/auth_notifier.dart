import 'dart:async';

import 'package:airportapp/services/auth_service.dart';
import 'package:flutter/widgets.dart';


class AuthNotifier extends ChangeNotifier{
  final AuthService _authService;
  //final _authStateController = StreamController<bool>.broadcast();

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  //Stream<bool> get authStateChanges => _authStateController.stream;
  
  AuthNotifier(this._authService);


  Future<void> init()async{
    final token = await _authService.getToken();
    _isLoggedIn = token != null;
    //_authStateController.add(_isLoggedIn);
    notifyListeners();
  }

  Future<void> register(String title, String birthDate, String name, String lastName, String email, String password, String phone)async{
    await _authService.register(title, birthDate, name, lastName, email, password, phone);
  }

  Future<void> login(String email, String password,) async{
    await _authService.login(email, password,);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async{
    await _authService.logout();
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> changePassword(String email, String phone, String oldPassword, String newPassword) async {
    await _authService.changePassword(email, phone, oldPassword, newPassword);
    notifyListeners();
  }

  // @override
  // void dispose(){
  //   notifyListeners();
  // }
}