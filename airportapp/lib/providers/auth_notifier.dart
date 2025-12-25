import 'dart:async';
import 'package:airportapp/domain/auth/change_pass_init_result.dart';
import 'package:airportapp/gen/sso.pb.dart';
import 'package:airportapp/domain/auth/auth_status.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';


class AuthNotifier extends ChangeNotifier{
  final AuthService _authService;

  final StreamController<Duration> _controller = StreamController<Duration>.broadcast();
  Stream<Duration> get remainingStream => _controller.stream;
  Timer? _timer;

  User? _user;
  User? get getUser => _user;

  ChangePasswordInitResult? _changePassData;
  ChangePasswordInitResult? get getChangePassData => _changePassData;

  Int64? uid;
  Int64? get getUid => uid;
  
  AuthNotifier(this._authService){
    //init();
  }

  AuthStatus _status = AuthStatus.loading;
  AuthStatus get status => _status;
  bool get isLoggedIn => _status == AuthStatus.authenticated;

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
    notifyListeners();
  }

  @override
  void dispose(){
    _timer?.cancel();
    _controller.close();
    super.dispose();
  }

  Future<void> register(String title, String birthDate, String name, String lastName, String email, String password, String phone)async{
    await _authService.register(title, birthDate, name, lastName, email, password, phone);
  }

  Future<User> login(String email, String password,) async{
    final user = await _authService.login(email, password,);
    
    _user = user;
    _status = AuthStatus.authenticated;
    notifyListeners();

    return user;
  }

  Future<void> logout() async{
    await _authService.logout();
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<void> changePasswordInit(String email, String phone, String oldPassword) async {
    _changePassData = await _authService.changePasswordInit(email, phone, oldPassword);
    uid = _changePassData!.uid;

    startTimer(_changePassData!.expiresAt);
    notifyListeners();
  }

  Future<void> changePasswordConfirm(String code, Int64 uid, String email, String newPassword) async{
    await _authService.changePasswordConfirm(code, uid, email, newPassword);
  }
}