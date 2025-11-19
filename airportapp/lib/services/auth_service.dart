import 'package:fixnum/fixnum.dart' show Int64;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import '../gen/auth.pbgrpc.dart';


class AuthService {
  final _storage = const FlutterSecureStorage();

  late final ClientChannel _channel;
  late final AuthClient _client;

  AuthService({
    String host = 'localhost',
    int port = 44084,
    bool useTls = false,
  }) {
    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials:
            useTls ? const ChannelCredentials.secure() : const ChannelCredentials.insecure(),
      ),
    );
    _client = AuthClient(_channel);
  }

  Future<int> register(String email, String password) async {
    final response = await _client.register(
      RegisterRequest(email: email, password: password),
    );
    return response.userId.toInt();
  }

  Future<void> login(String email, String password, {int appId = 1}) async {
    final response = await _client.login(
      LoginRequest(email: email, password: password, appId: appId),
    );
    await _storage.write(key: 'jwt', value: response.token);
  }

  Future<bool> isAdmin(int userId) async {
    final token = await _storage.read(key: 'jwt');
    if (token == null) throw Exception("Unauthorized");

    final response = await _client.isAdmin(
      IsAdminRequest(userId: Int64(userId)),
      options: CallOptions(metadata: {
        'authorization': 'Bearer $token',
      }),
    );
    return response.isAdmin;
  }

  Future<String?> getToken() async => _storage.read(key: 'jwt');

  Future<void> logout() async => _storage.delete(key: 'jwt');

  Future<void> dispose() async => _channel.shutdown();
}
