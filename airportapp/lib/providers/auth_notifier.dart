import 'dart:async';
import 'package:airportapp/core/result/result.dart';
import 'package:airportapp/domain/auth/change_pass_init_result.dart';
import 'package:airportapp/gen/sso.pb.dart';
import 'package:airportapp/domain/auth/auth_status.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';


class AuthNotifier extends ChangeNotifier{
  AuthService _authService;

  final StreamController<Duration> _controller = StreamController<Duration>.broadcast();
  Stream<Duration> get remainingStream => _controller.stream;
  Timer? _timer;

  User? _user;
  User? get getUser => _user;

  ChangePasswordInitResult? _changePassData;
  ChangePasswordInitResult? get getChangePassData => _changePassData;

  Int64? uid;
  Int64? get getUid => uid;

  String? errmsg;
  String? get getErrmsg => errmsg;

  AuthStatus _status = AuthStatus.unauthenticated;
  AuthStatus get status => _status;

  bool get isLoggedIn => _status == AuthStatus.authenticated;
  
  AuthNotifier(this._authService){
    //init();
  }

  void updateService(AuthService service) {
    _authService = service;
    notifyListeners();
  }

  void _setError(String message) {
    _status = AuthStatus.error;
    errmsg = message;
    notifyListeners();
  }

  void clearError() {
    errmsg = null;
    if (_status == AuthStatus.error) {
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }


  void startTimer(DateTime expiryTime){
    _timer?.cancel();

    final now = DateTime.now();
    Duration remaining = expiryTime.difference(now.toUtc());

    _controller.add(remaining);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final diff = expiryTime.difference(DateTime.now().toUtc());
      if (remaining.isNegative || diff.inSeconds <= 0) {
        _controller.add(Duration.zero);
        timer.cancel();
      }
      _controller.add(diff);
    });
  }

  Future<void> init()async{
    //final token = await _authService.getToken();
    // _status = token != null 
    //   ? AuthStatus.authenticated 
    //   : AuthStatus.unauthenticated;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  @override
  void dispose(){
    _timer?.cancel();
    _controller.close();
    super.dispose();
  }

  Future<void> register(String title, String birthDate, String name, String lastName, String email, String password, String phone)async{
    _status = AuthStatus.unauthenticated;
    errmsg = null;
    notifyListeners();

    final user = await _authService.register(title, birthDate, name, lastName, email, password, phone);

    switch(user){
      case Success():
        _status = AuthStatus.idle;
        break;
      case Failure(: final error):
        _user = null;
        _setError(error.message);
        break;
    }
  }

  Future<void> login(String email, String password,) async{
    _status = AuthStatus.unauthenticated;
    notifyListeners();

    final user = await _authService.login(email, password,);
    
    switch(user){
      case Success(:final data):
        _user = data;
        _status = AuthStatus.authenticated;
        break;
      case Failure(: final error):
        _user = null;
        _setError(error.message);
        break;
      }

    notifyListeners();
  }

  Future<void> logout() async{
    await _authService.logout();
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<void> changePasswordInit(String email, String phone, String oldPassword) async {
    errmsg = null;
    _status = AuthStatus.loading;
    notifyListeners();

    final result = await _authService.changePasswordInit(email, phone, oldPassword);

    switch(result){
      case Success(:final data):
        _changePassData = data;
        uid = data.uid;
        startTimer( data.expiresAt);
        _status = AuthStatus.authenticated;
        break;
      case Failure(: final error):
        _changePassData = null;
        _setError(error.message);
        _status = AuthStatus.unauthenticated;
        break;
    }

    notifyListeners();
  }

  Future<void> changePasswordConfirm(String code, Int64 uid, String email, String newPassword) async{
    await _authService.changePasswordConfirm(code, uid, email, newPassword);
  }
}