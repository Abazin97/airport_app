// This is a generated file - do not edit.
//
// Generated from sso.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'sso.pb.dart' as $0;

export 'sso.pb.dart';

@$pb.GrpcServiceName('auth.Auth')
class AuthClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.RegisterResponse> register(
    $0.RegisterRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login(
    $0.LoginRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.IsAdminResponse> isAdmin(
    $0.IsAdminRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$isAdmin, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutResponse> logout(
    $0.LogoutRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestOTPResponse> requestOTP(
    $0.RequestOTPRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestOTP, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyOTPResponse> verifyOTP(
    $0.VerifyOTPRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifyOTP, request, options: options);
  }

  // method descriptors

  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/auth.Auth/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          $0.RegisterResponse.fromBuffer);
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/auth.Auth/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      $0.LoginResponse.fromBuffer);
  static final _$isAdmin =
      $grpc.ClientMethod<$0.IsAdminRequest, $0.IsAdminResponse>(
          '/auth.Auth/IsAdmin',
          ($0.IsAdminRequest value) => value.writeToBuffer(),
          $0.IsAdminResponse.fromBuffer);
  static final _$logout =
      $grpc.ClientMethod<$0.LogoutRequest, $0.LogoutResponse>(
          '/auth.Auth/Logout',
          ($0.LogoutRequest value) => value.writeToBuffer(),
          $0.LogoutResponse.fromBuffer);
  static final _$requestOTP =
      $grpc.ClientMethod<$0.RequestOTPRequest, $0.RequestOTPResponse>(
          '/auth.Auth/RequestOTP',
          ($0.RequestOTPRequest value) => value.writeToBuffer(),
          $0.RequestOTPResponse.fromBuffer);
  static final _$verifyOTP =
      $grpc.ClientMethod<$0.VerifyOTPRequest, $0.VerifyOTPResponse>(
          '/auth.Auth/VerifyOTP',
          ($0.VerifyOTPRequest value) => value.writeToBuffer(),
          $0.VerifyOTPResponse.fromBuffer);
}

@$pb.GrpcServiceName('auth.Auth')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.Auth';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IsAdminRequest, $0.IsAdminResponse>(
        'IsAdmin',
        isAdmin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IsAdminRequest.fromBuffer(value),
        ($0.IsAdminResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutRequest, $0.LogoutResponse>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutRequest.fromBuffer(value),
        ($0.LogoutResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestOTPRequest, $0.RequestOTPResponse>(
        'RequestOTP',
        requestOTP_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestOTPRequest.fromBuffer(value),
        ($0.RequestOTPResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyOTPRequest, $0.VerifyOTPResponse>(
        'VerifyOTP',
        verifyOTP_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyOTPRequest.fromBuffer(value),
        ($0.VerifyOTPResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> register_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RegisterRequest> $request) async {
    return register($call, await $request);
  }

  $async.Future<$0.RegisterResponse> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);

  $async.Future<$0.IsAdminResponse> isAdmin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.IsAdminRequest> $request) async {
    return isAdmin($call, await $request);
  }

  $async.Future<$0.IsAdminResponse> isAdmin(
      $grpc.ServiceCall call, $0.IsAdminRequest request);

  $async.Future<$0.LogoutResponse> logout_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LogoutRequest> $request) async {
    return logout($call, await $request);
  }

  $async.Future<$0.LogoutResponse> logout(
      $grpc.ServiceCall call, $0.LogoutRequest request);

  $async.Future<$0.RequestOTPResponse> requestOTP_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RequestOTPRequest> $request) async {
    return requestOTP($call, await $request);
  }

  $async.Future<$0.RequestOTPResponse> requestOTP(
      $grpc.ServiceCall call, $0.RequestOTPRequest request);

  $async.Future<$0.VerifyOTPResponse> verifyOTP_Pre($grpc.ServiceCall $call,
      $async.Future<$0.VerifyOTPRequest> $request) async {
    return verifyOTP($call, await $request);
  }

  $async.Future<$0.VerifyOTPResponse> verifyOTP(
      $grpc.ServiceCall call, $0.VerifyOTPRequest request);
}
