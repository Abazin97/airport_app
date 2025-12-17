import 'dart:async';
import 'package:airportapp/services/auth_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';


class AuthNotifier extends ChangeNotifier{
  final AuthService _authService;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Int64? uid;
  Int64? get getUid => uid;
  
  AuthNotifier(this._authService);


  Future<void> init()async{
    final token = await _authService.getToken();
    _isLoggedIn = token != null;
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

  Future<void> changePasswordInit(String email, String phone, String oldPassword) async {
    uid = await _authService.changePasswordInit(email, phone, oldPassword);
    notifyListeners();
  }

  Future<void> changePasswordConfirm(String code, Int64 uid, String email, String newPassword) async{
    await _authService.changePasswordConfirm(code, uid, email, newPassword);
  }

  // @override
  // void dispose(){
  //   notifyListeners();
  // }
}