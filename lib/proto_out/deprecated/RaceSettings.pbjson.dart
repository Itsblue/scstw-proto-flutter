//
//  Generated code. Do not modify.
//  source: RaceSettings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use manualStartProcedureSettingsDescriptor instead')
const ManualStartProcedureSettings$json = {
  '1': 'ManualStartProcedureSettings',
  '7': {'3': true},
};

/// Descriptor for `ManualStartProcedureSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List manualStartProcedureSettingsDescriptor = $convert.base64Decode(
    'ChxNYW51YWxTdGFydFByb2NlZHVyZVNldHRpbmdzOgIYAQ==');

@$core.Deprecated('Use automatedStartProcedureSettingsDescriptor instead')
const AutomatedStartProcedureSettings$json = {
  '1': 'AutomatedStartProcedureSettings',
  '2': [
    {'1': 'sayReady', '3': 1, '4': 1, '5': 8, '10': 'sayReady'},
    {'1': 'standstillDurationBeforeReady', '3': 2, '4': 1, '5': 5, '10': 'standstillDurationBeforeReady'},
  ],
  '7': {'3': true},
};

/// Descriptor for `AutomatedStartProcedureSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List automatedStartProcedureSettingsDescriptor = $convert.base64Decode(
    'Ch9BdXRvbWF0ZWRTdGFydFByb2NlZHVyZVNldHRpbmdzEhoKCHNheVJlYWR5GAEgASgIUghzYX'
    'lSZWFkeRJECh1zdGFuZHN0aWxsRHVyYXRpb25CZWZvcmVSZWFkeRgCIAEoBVIdc3RhbmRzdGls'
    'bER1cmF0aW9uQmVmb3JlUmVhZHk6AhgB');

@$core.Deprecated('Use startProcedureSettingsDescriptor instead')
const StartProcedureSettings$json = {
  '1': 'StartProcedureSettings',
  '2': [
    {'1': 'manualStartProcedureSettings', '3': 1, '4': 1, '5': 11, '6': '.ScStw.deprecated.race_settings.ManualStartProcedureSettings', '9': 0, '10': 'manualStartProcedureSettings'},
    {'1': 'automatedStartProcedureSettings', '3': 2, '4': 1, '5': 11, '6': '.ScStw.deprecated.race_settings.AutomatedStartProcedureSettings', '9': 0, '10': 'automatedStartProcedureSettings'},
  ],
  '7': {'3': true},
  '8': [
    {'1': 'startProcedureSettings'},
  ],
};

/// Descriptor for `StartProcedureSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startProcedureSettingsDescriptor = $convert.base64Decode(
    'ChZTdGFydFByb2NlZHVyZVNldHRpbmdzEoIBChxtYW51YWxTdGFydFByb2NlZHVyZVNldHRpbm'
    'dzGAEgASgLMjwuU2NTdHcuZGVwcmVjYXRlZC5yYWNlX3NldHRpbmdzLk1hbnVhbFN0YXJ0UHJv'
    'Y2VkdXJlU2V0dGluZ3NIAFIcbWFudWFsU3RhcnRQcm9jZWR1cmVTZXR0aW5ncxKLAQofYXV0b2'
    '1hdGVkU3RhcnRQcm9jZWR1cmVTZXR0aW5ncxgCIAEoCzI/LlNjU3R3LmRlcHJlY2F0ZWQucmFj'
    'ZV9zZXR0aW5ncy5BdXRvbWF0ZWRTdGFydFByb2NlZHVyZVNldHRpbmdzSABSH2F1dG9tYXRlZF'
    'N0YXJ0UHJvY2VkdXJlU2V0dGluZ3M6AhgBQhgKFnN0YXJ0UHJvY2VkdXJlU2V0dGluZ3M=');

@$core.Deprecated('Use raceSettingsDescriptor instead')
const RaceSettings$json = {
  '1': 'RaceSettings',
  '2': [
    {'1': 'startProcedure', '3': 1, '4': 1, '5': 11, '6': '.ScStw.deprecated.race_settings.StartProcedureSettings', '10': 'startProcedure'},
  ],
  '7': {'3': true},
};

/// Descriptor for `RaceSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raceSettingsDescriptor = $convert.base64Decode(
    'CgxSYWNlU2V0dGluZ3MSXgoOc3RhcnRQcm9jZWR1cmUYASABKAsyNi5TY1N0dy5kZXByZWNhdG'
    'VkLnJhY2Vfc2V0dGluZ3MuU3RhcnRQcm9jZWR1cmVTZXR0aW5nc1IOc3RhcnRQcm9jZWR1cmU6'
    'AhgB');

