//
//  Generated code. Do not modify.
//  source: SystemInfo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use appInfoDescriptor instead')
const AppInfo$json = {
  '1': 'AppInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
    {'1': 'sha256', '3': 3, '4': 1, '5': 9, '10': 'sha256'},
    {'1': 'publicKeyDigests', '3': 4, '4': 3, '5': 9, '10': 'publicKeyDigests'},
  ],
};

/// Descriptor for `AppInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appInfoDescriptor = $convert.base64Decode(
    'CgdBcHBJbmZvEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHdmVyc2lvbhgCIAEoCVIHdmVyc2lvbh'
    'IWCgZzaGEyNTYYAyABKAlSBnNoYTI1NhIqChBwdWJsaWNLZXlEaWdlc3RzGAQgAygJUhBwdWJs'
    'aWNLZXlEaWdlc3Rz');

@$core.Deprecated('Use systemInfoDescriptor instead')
const SystemInfo$json = {
  '1': 'SystemInfo',
  '2': [
    {'1': 'appInfo', '3': 1, '4': 1, '5': 11, '6': '.ScStw.AppInfo', '10': 'appInfo'},
  ],
};

/// Descriptor for `SystemInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemInfoDescriptor = $convert.base64Decode(
    'CgpTeXN0ZW1JbmZvEigKB2FwcEluZm8YASABKAsyDi5TY1N0dy5BcHBJbmZvUgdhcHBJbmZv');

