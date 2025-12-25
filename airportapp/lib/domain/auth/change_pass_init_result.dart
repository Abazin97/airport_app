import 'package:fixnum/fixnum.dart';

class ChangePasswordInitResult {
  final Int64 uid;
  final DateTime expiresAt;

  ChangePasswordInitResult({
    required this.uid,
    required this.expiresAt,
  });
}