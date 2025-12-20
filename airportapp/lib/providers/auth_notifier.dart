import 'dart:async';
import 'package:airportapp/providers/auth_status.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';


class AuthNotifier extends ChangeNotifier{
  final AuthService _authService;


  Int64? uid;
  Int64? get getUid => uid;
  
  AuthNotifier(this._authService){
    init();
  }

  AuthStatus _status = AuthStatus.loading;
  AuthStatus get status => _status;
  bool get isLoggedIn => _status == AuthStatus.authenticated;

  Future<void> init()async{
    final token = await _authService.getToken();
    _status = token != null 
      ? AuthStatus.authenticated 
      : AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<void> register(String title, String birthDate, String name, String lastName, String email, String password, String phone)async{
    await _authService.register(title, birthDate, name, lastName, email, password, phone);
  }

  Future<void> login(String email, String password,) async{
    await _authService.login(email, password,);
    _status = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<void> logout() async{
    await _authService.logout();
    _status = AuthStatus.unauthenticated;
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