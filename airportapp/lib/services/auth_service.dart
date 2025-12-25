import 'package:airportapp/domain/auth/change_pass_init_result.dart';
import 'package:airportapp/network/grpc_call.dart';
import 'package:fixnum/fixnum.dart' show Int64;
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import '../gen/sso.pbgrpc.dart';


class AuthService {
  final _storage = const FlutterSecureStorage();
  AuthService._();

  static Future<AuthService> create() async{
    final service = AuthService._();
    await service.init();
    return service;
  }
  
  ClientChannel? _channel;
  late AuthClient _client;

  Future<void> init({
    String host = 'localhost',
    int port = 44084,
    bool useTls = false,
  }) async {
    ChannelCredentials credentials;

    if (useTls) {
      final cert = await rootBundle.load('certs/server.crt');

      credentials = ChannelCredentials.secure(
        certificates: cert.buffer.asUint8List(),
        authority: 'localhost',
      );
    } else {
      credentials = ChannelCredentials.insecure();
    }

    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(credentials: credentials),
    );

    _client = AuthClient(_channel!);
  }

  Future<int> register(String title, String birthDate, String name, String lastName, String email, String password, String phone){
    return grpcCall(() async {
      final response = await _client.register(
        RegisterRequest(title: title, birthDate: birthDate, name: name, lastName: lastName, email: email, password: password, phone: phone),
      );
      return response.userId.toInt();
    });
  }

  Future<User> login(String email, String password, {int appId = 1}) {
    return grpcCall(() async {
      final response = await _client.login(
        LoginRequest(email: email, password: password, appId: appId),
      );
    
      await _storage.write(key: 'jwt', value: response.token);
      return response.user;
    });
  }

  Future<bool> isAdmin(int userId) {
    return grpcCall(() async {
      final token = await _storage.read(key: 'jwt');
      if (token == null) throw Exception("Unauthorized");

      final response = await _client.isAdmin(
        IsAdminRequest(userId: Int64(userId)),
        options: CallOptions(metadata: {
          'authorization': 'Bearer $token',
        }),
      );
      return response.isAdmin;
    });
  }

  Future<ChangePasswordInitResult> changePasswordInit(String email, String phone, String oldPassword) {
    return grpcCall(() async {
      final response = await _client.changePasswordInit(
        ChangePassInitRequest(email: email, phone:phone, oldPassword: oldPassword),
      );

      return ChangePasswordInitResult(
        uid: response.uid, 
        expiresAt: DateTime.parse(response.expiryTime));
    });
  }

  Future<void> changePasswordConfirm(String code, Int64 uid, String email, String newPassword){
    return grpcCall(() async {
      await _client.changePasswordConfirm(
        ChangePassConfirmRequest(code: code, uid: uid, email: email, newPassword: newPassword),
      );
    });
  }

  Future<String?> getToken() async => _storage.read(key: 'jwt');

  Future<void> logout() async => _storage.delete(key: 'jwt');

  Future<void> dispose() async => _channel?.shutdown();
}
