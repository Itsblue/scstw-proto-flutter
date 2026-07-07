//
//  Generated code. Do not modify.
//  source: deprecated/Settings.proto
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
    {'1': 'manualStartProcedureSettings', '3': 1, '4': 1, '5': 11, '6': '.ScStw.deprecated.ManualStartProcedureSettings', '9': 0, '10': 'manualStartProcedureSettings'},
    {'1': 'automatedStartProcedureSettings', '3': 2, '4': 1, '5': 11, '6': '.ScStw.deprecated.AutomatedStartProcedureSettings', '9': 0, '10': 'automatedStartProcedureSettings'},
  ],
  '7': {'3': true},
  '8': [
    {'1': 'startProcedureSettings'},
  ],
};

/// Descriptor for `StartProcedureSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startProcedureSettingsDescriptor = $convert.base64Decode(
    'ChZTdGFydFByb2NlZHVyZVNldHRpbmdzEnQKHG1hbnVhbFN0YXJ0UHJvY2VkdXJlU2V0dGluZ3'
    'MYASABKAsyLi5TY1N0dy5kZXByZWNhdGVkLk1hbnVhbFN0YXJ0UHJvY2VkdXJlU2V0dGluZ3NI'
    'AFIcbWFudWFsU3RhcnRQcm9jZWR1cmVTZXR0aW5ncxJ9Ch9hdXRvbWF0ZWRTdGFydFByb2NlZH'
    'VyZVNldHRpbmdzGAIgASgLMjEuU2NTdHcuZGVwcmVjYXRlZC5BdXRvbWF0ZWRTdGFydFByb2Nl'
    'ZHVyZVNldHRpbmdzSABSH2F1dG9tYXRlZFN0YXJ0UHJvY2VkdXJlU2V0dGluZ3M6AhgBQhgKFn'
    'N0YXJ0UHJvY2VkdXJlU2V0dGluZ3M=');

@$core.Deprecated('Use raceSettingsDescriptor instead')
const RaceSettings$json = {
  '1': 'RaceSettings',
  '2': [
    {'1': 'startProcedure', '3': 1, '4': 1, '5': 11, '6': '.ScStw.deprecated.StartProcedureSettings', '10': 'startProcedure'},
  ],
  '7': {'3': true},
};

/// Descriptor for `RaceSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raceSettingsDescriptor = $convert.base64Decode(
    'CgxSYWNlU2V0dGluZ3MSUAoOc3RhcnRQcm9jZWR1cmUYASABKAsyKC5TY1N0dy5kZXByZWNhdG'
    'VkLlN0YXJ0UHJvY2VkdXJlU2V0dGluZ3NSDnN0YXJ0UHJvY2VkdXJlOgIYAQ==');

@$core.Deprecated('Use abortAfterFalseStartDescriptor instead')
const AbortAfterFalseStart$json = {
  '1': 'AbortAfterFalseStart',
  '7': {'3': true},
};

/// Descriptor for `AbortAfterFalseStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abortAfterFalseStartDescriptor = $convert.base64Decode(
    'ChRBYm9ydEFmdGVyRmFsc2VTdGFydDoCGAE=');

@$core.Deprecated('Use continueAfterFalseStartDescriptor instead')
const ContinueAfterFalseStart$json = {
  '1': 'ContinueAfterFalseStart',
  '2': [
    {'1': 'assumedReactionTime', '3': 1, '4': 1, '5': 13, '10': 'assumedReactionTime'},
    {'1': 'continueStartSequenceAfterFalseStart', '3': 2, '4': 1, '5': 8, '10': 'continueStartSequenceAfterFalseStart'},
  ],
  '7': {'3': true},
};

/// Descriptor for `ContinueAfterFalseStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List continueAfterFalseStartDescriptor = $convert.base64Decode(
    'ChdDb250aW51ZUFmdGVyRmFsc2VTdGFydBIwChNhc3N1bWVkUmVhY3Rpb25UaW1lGAEgASgNUh'
    'Nhc3N1bWVkUmVhY3Rpb25UaW1lElIKJGNvbnRpbnVlU3RhcnRTZXF1ZW5jZUFmdGVyRmFsc2VT'
    'dGFydBgCIAEoCFIkY29udGludWVTdGFydFNlcXVlbmNlQWZ0ZXJGYWxzZVN0YXJ0OgIYAQ==');

@$core.Deprecated('Use falseStartBehaviourDescriptor instead')
const FalseStartBehaviour$json = {
  '1': 'FalseStartBehaviour',
  '2': [
    {'1': 'abortAfterFalseStart', '3': 1, '4': 1, '5': 11, '6': '.ScStw.deprecated.AbortAfterFalseStart', '9': 0, '10': 'abortAfterFalseStart'},
    {'1': 'continueAfterFalseStart', '3': 2, '4': 1, '5': 11, '6': '.ScStw.deprecated.ContinueAfterFalseStart', '9': 0, '10': 'continueAfterFalseStart'},
  ],
  '7': {'3': true},
  '8': [
    {'1': 'behaviour'},
  ],
};

/// Descriptor for `FalseStartBehaviour`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List falseStartBehaviourDescriptor = $convert.base64Decode(
    'ChNGYWxzZVN0YXJ0QmVoYXZpb3VyElwKFGFib3J0QWZ0ZXJGYWxzZVN0YXJ0GAEgASgLMiYuU2'
    'NTdHcuZGVwcmVjYXRlZC5BYm9ydEFmdGVyRmFsc2VTdGFydEgAUhRhYm9ydEFmdGVyRmFsc2VT'
    'dGFydBJlChdjb250aW51ZUFmdGVyRmFsc2VTdGFydBgCIAEoCzIpLlNjU3R3LmRlcHJlY2F0ZW'
    'QuQ29udGludWVBZnRlckZhbHNlU3RhcnRIAFIXY29udGludWVBZnRlckZhbHNlU3RhcnQ6AhgB'
    'QgsKCWJlaGF2aW91cg==');

