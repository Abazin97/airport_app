// This is a generated file - do not edit.
//
// Generated from sso.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'birth_date', '3': 6, '4': 1, '5': 9, '10': 'birthDate'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhQKBXRpdGxlGAEgASgJUgV0aXRsZRISCgRuYW1lGAIgASgJUgRuYW1lEhsKCWxhc3'
    'RfbmFtZRgDIAEoCVIIbGFzdE5hbWUSFAoFZW1haWwYBCABKAlSBWVtYWlsEhQKBXBob25lGAUg'
    'ASgJUgVwaG9uZRIdCgpiaXJ0aF9kYXRlGAYgASgJUgliaXJ0aERhdGU=');

@$core.Deprecated('Use requestOTPRequestDescriptor instead')
const RequestOTPRequest$json = {
  '1': 'RequestOTPRequest',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `RequestOTPRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestOTPRequestDescriptor = $convert
    .base64Decode('ChFSZXF1ZXN0T1RQUmVxdWVzdBIUCgVwaG9uZRgBIAEoCVIFcGhvbmU=');

@$core.Deprecated('Use requestOTPResponseDescriptor instead')
const RequestOTPResponse$json = {
  '1': 'RequestOTPResponse',
  '2': [
    {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
  ],
};

/// Descriptor for `RequestOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestOTPResponseDescriptor = $convert
    .base64Decode('ChJSZXF1ZXN0T1RQUmVzcG9uc2USEAoDc2lkGAEgASgJUgNzaWQ=');

@$core.Deprecated('Use verifyOTPRequestDescriptor instead')
const VerifyOTPRequest$json = {
  '1': 'VerifyOTPRequest',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyOTPRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOTPRequestDescriptor = $convert.base64Decode(
    'ChBWZXJpZnlPVFBSZXF1ZXN0EhQKBXBob25lGAEgASgJUgVwaG9uZRISCgRjb2RlGAIgASgJUg'
    'Rjb2Rl');

@$core.Deprecated('Use verifyOTPResponseDescriptor instead')
const VerifyOTPResponse$json = {
  '1': 'VerifyOTPResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `VerifyOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOTPResponseDescriptor = $convert.base64Decode(
    'ChFWZXJpZnlPVFBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use isAdminRequestDescriptor instead')
const IsAdminRequest$json = {
  '1': 'IsAdminRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `IsAdminRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isAdminRequestDescriptor = $convert
    .base64Decode('Cg5Jc0FkbWluUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgDUgZ1c2VySWQ=');

@$core.Deprecated('Use isAdminResponseDescriptor instead')
const IsAdminResponse$json = {
  '1': 'IsAdminResponse',
  '2': [
    {'1': 'is_admin', '3': 1, '4': 1, '5': 8, '10': 'isAdmin'},
  ],
};

/// Descriptor for `IsAdminResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isAdminResponseDescriptor = $convert.base64Decode(
    'Cg9Jc0FkbWluUmVzcG9uc2USGQoIaXNfYWRtaW4YASABKAhSB2lzQWRtaW4=');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'birth_date', '3': 4, '4': 1, '5': 9, '10': 'birthDate'},
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'last_name', '3': 7, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgAS'
    'gJUghwYXNzd29yZBIUCgVwaG9uZRgDIAEoCVIFcGhvbmUSHQoKYmlydGhfZGF0ZRgEIAEoCVIJ'
    'YmlydGhEYXRlEhQKBXRpdGxlGAUgASgJUgV0aXRsZRISCgRuYW1lGAYgASgJUgRuYW1lEhsKCW'
    'xhc3RfbmFtZRgHIAEoCVIIbGFzdE5hbWU=');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEhcKB3VzZXJfaWQYASABKANSBnVzZXJJZA==');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'app_id', '3': 4, '4': 1, '5': 5, '10': 'appId'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZBIUCgVwaG9uZRgDIAEoCVIFcGhvbmUSFQoGYXBwX2lkGAQgASgFUgVhcHBJZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.auth.User', '10': 'user'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhQKBXRva2VuGAEgASgJUgV0b2tlbhIeCgR1c2VyGAIgASgLMgouYX'
    'V0aC5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = {
  '1': 'LogoutRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert
    .base64Decode('Cg1Mb2dvdXRSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbg==');

@$core.Deprecated('Use logoutResponseDescriptor instead')
const LogoutResponse$json = {
  '1': 'LogoutResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutResponseDescriptor = $convert
    .base64Decode('Cg5Mb2dvdXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use changePassInitRequestDescriptor instead')
const ChangePassInitRequest$json = {
  '1': 'ChangePassInitRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'old_password', '3': 3, '4': 1, '5': 9, '10': 'oldPassword'},
  ],
};

/// Descriptor for `ChangePassInitRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePassInitRequestDescriptor = $convert.base64Decode(
    'ChVDaGFuZ2VQYXNzSW5pdFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhQKBXBob25lGA'
    'IgASgJUgVwaG9uZRIhCgxvbGRfcGFzc3dvcmQYAyABKAlSC29sZFBhc3N3b3Jk');

@$core.Deprecated('Use changePassInitResponseDescriptor instead')
const ChangePassInitResponse$json = {
  '1': 'ChangePassInitResponse',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'uid', '3': 2, '4': 1, '5': 3, '10': 'uid'},
    {'1': 'expiry_time', '3': 3, '4': 1, '5': 3, '10': 'expiryTime'},
  ],
};

/// Descriptor for `ChangePassInitResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePassInitResponseDescriptor =
    $convert.base64Decode(
        'ChZDaGFuZ2VQYXNzSW5pdFJlc3BvbnNlEhIKBGNvZGUYASABKAlSBGNvZGUSEAoDdWlkGAIgAS'
        'gDUgN1aWQSHwoLZXhwaXJ5X3RpbWUYAyABKANSCmV4cGlyeVRpbWU=');

@$core.Deprecated('Use changePassConfirmRequestDescriptor instead')
const ChangePassConfirmRequest$json = {
  '1': 'ChangePassConfirmRequest',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'uid', '3': 2, '4': 1, '5': 3, '10': 'uid'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'new_password', '3': 4, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePassConfirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePassConfirmRequestDescriptor = $convert.base64Decode(
    'ChhDaGFuZ2VQYXNzQ29uZmlybVJlcXVlc3QSEgoEY29kZRgBIAEoCVIEY29kZRIQCgN1aWQYAi'
    'ABKANSA3VpZBIUCgVlbWFpbBgDIAEoCVIFZW1haWwSIQoMbmV3X3Bhc3N3b3JkGAQgASgJUgtu'
    'ZXdQYXNzd29yZA==');

@$core.Deprecated('Use changePassConfirmResponseDescriptor instead')
const ChangePassConfirmResponse$json = {
  '1': 'ChangePassConfirmResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ChangePassConfirmResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePassConfirmResponseDescriptor =
    $convert.base64Decode(
        'ChlDaGFuZ2VQYXNzQ29uZmlybVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
