//
//  Generated code. Do not modify.
//  source: Settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use soundSettingsDescriptor instead')
const SoundSettings$json = {
  '1': 'SoundSettings',
  '2': [
    {'1': 'volume', '3': 1, '4': 1, '5': 13, '10': 'volume'},
    {'1': 'muteInternalSpeaker', '3': 2, '4': 1, '5': 8, '10': 'muteInternalSpeaker'},
  ],
};

/// Descriptor for `SoundSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List soundSettingsDescriptor = $convert.base64Decode(
    'Cg1Tb3VuZFNldHRpbmdzEhYKBnZvbHVtZRgBIAEoDVIGdm9sdW1lEjAKE211dGVJbnRlcm5hbF'
    'NwZWFrZXIYAiABKAhSE211dGVJbnRlcm5hbFNwZWFrZXI=');

@$core.Deprecated('Use securitySettingsDescriptor instead')
const SecuritySettings$json = {
  '1': 'SecuritySettings',
  '2': [
    {'1': 'disableBluetooth', '3': 1, '4': 1, '5': 8, '10': 'disableBluetooth'},
    {'1': 'disallowToSetDefaultViaBluetooth', '3': 2, '4': 1, '5': 8, '10': 'disallowToSetDefaultViaBluetooth'},
  ],
};

/// Descriptor for `SecuritySettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List securitySettingsDescriptor = $convert.base64Decode(
    'ChBTZWN1cml0eVNldHRpbmdzEioKEGRpc2FibGVCbHVldG9vdGgYASABKAhSEGRpc2FibGVCbH'
    'VldG9vdGgSSgogZGlzYWxsb3dUb1NldERlZmF1bHRWaWFCbHVldG9vdGgYAiABKAhSIGRpc2Fs'
    'bG93VG9TZXREZWZhdWx0VmlhQmx1ZXRvb3Ro');

@$core.Deprecated('Use manualStartProcedureDescriptor instead')
const ManualStartProcedure$json = {
  '1': 'ManualStartProcedure',
  '2': [
    {'1': 'sayReady', '3': 1, '4': 1, '5': 8, '10': 'sayReady'},
  ],
};

/// Descriptor for `ManualStartProcedure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List manualStartProcedureDescriptor = $convert.base64Decode(
    'ChRNYW51YWxTdGFydFByb2NlZHVyZRIaCghzYXlSZWFkeRgBIAEoCFIIc2F5UmVhZHk=');

@$core.Deprecated('Use competitionClassicRaceModeDescriptor instead')
const CompetitionClassicRaceMode$json = {
  '1': 'CompetitionClassicRaceMode',
  '2': [
    {'1': 'manualStartProcedure', '3': 1, '4': 1, '5': 11, '6': '.ScStw.ManualStartProcedure', '10': 'manualStartProcedure'},
  ],
};

/// Descriptor for `CompetitionClassicRaceMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List competitionClassicRaceModeDescriptor = $convert.base64Decode(
    'ChpDb21wZXRpdGlvbkNsYXNzaWNSYWNlTW9kZRJPChRtYW51YWxTdGFydFByb2NlZHVyZRgBIA'
    'EoCzIbLlNjU3R3Lk1hbnVhbFN0YXJ0UHJvY2VkdXJlUhRtYW51YWxTdGFydFByb2NlZHVyZQ==');

@$core.Deprecated('Use automatedStartProcedureDescriptor instead')
const AutomatedStartProcedure$json = {
  '1': 'AutomatedStartProcedure',
  '2': [
    {'1': 'sayReady', '3': 1, '4': 1, '5': 8, '10': 'sayReady'},
    {'1': 'standstillDurationBeforeStart', '3': 2, '4': 1, '5': 5, '10': 'standstillDurationBeforeStart'},
    {'1': 'autoReset', '3': 3, '4': 1, '5': 8, '10': 'autoReset'},
  ],
};

/// Descriptor for `AutomatedStartProcedure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List automatedStartProcedureDescriptor = $convert.base64Decode(
    'ChdBdXRvbWF0ZWRTdGFydFByb2NlZHVyZRIaCghzYXlSZWFkeRgBIAEoCFIIc2F5UmVhZHkSRA'
    'odc3RhbmRzdGlsbER1cmF0aW9uQmVmb3JlU3RhcnQYAiABKAVSHXN0YW5kc3RpbGxEdXJhdGlv'
    'bkJlZm9yZVN0YXJ0EhwKCWF1dG9SZXNldBgDIAEoCFIJYXV0b1Jlc2V0');

@$core.Deprecated('Use startProcedureDescriptor instead')
const StartProcedure$json = {
  '1': 'StartProcedure',
  '2': [
    {'1': 'manualStartProcedure', '3': 1, '4': 1, '5': 11, '6': '.ScStw.ManualStartProcedure', '9': 0, '10': 'manualStartProcedure'},
    {'1': 'automatedStartProcedure', '3': 2, '4': 1, '5': 11, '6': '.ScStw.AutomatedStartProcedure', '9': 0, '10': 'automatedStartProcedure'},
  ],
  '8': [
    {'1': 'startProcedure'},
  ],
};

/// Descriptor for `StartProcedure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startProcedureDescriptor = $convert.base64Decode(
    'Cg5TdGFydFByb2NlZHVyZRJRChRtYW51YWxTdGFydFByb2NlZHVyZRgBIAEoCzIbLlNjU3R3Lk'
    '1hbnVhbFN0YXJ0UHJvY2VkdXJlSABSFG1hbnVhbFN0YXJ0UHJvY2VkdXJlEloKF2F1dG9tYXRl'
    'ZFN0YXJ0UHJvY2VkdXJlGAIgASgLMh4uU2NTdHcuQXV0b21hdGVkU3RhcnRQcm9jZWR1cmVIAF'
    'IXYXV0b21hdGVkU3RhcnRQcm9jZWR1cmVCEAoOc3RhcnRQcm9jZWR1cmU=');

@$core.Deprecated('Use laneSettingsDescriptor instead')
const LaneSettings$json = {
  '1': 'LaneSettings',
  '2': [
    {'1': 'disabled', '3': 2, '4': 1, '5': 8, '10': 'disabled'},
  ],
  '9': [
    {'1': 1, '2': 2},
  ],
};

/// Descriptor for `LaneSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List laneSettingsDescriptor = $convert.base64Decode(
    'CgxMYW5lU2V0dGluZ3MSGgoIZGlzYWJsZWQYAiABKAhSCGRpc2FibGVkSgQIARAC');

@$core.Deprecated('Use abortAfterFalseStartDescriptor instead')
const AbortAfterFalseStart$json = {
  '1': 'AbortAfterFalseStart',
};

/// Descriptor for `AbortAfterFalseStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abortAfterFalseStartDescriptor = $convert.base64Decode(
    'ChRBYm9ydEFmdGVyRmFsc2VTdGFydA==');

@$core.Deprecated('Use continueAfterFalseStartDescriptor instead')
const ContinueAfterFalseStart$json = {
  '1': 'ContinueAfterFalseStart',
  '2': [
    {'1': 'assumedReactionTime', '3': 1, '4': 1, '5': 13, '10': 'assumedReactionTime'},
    {'1': 'continueStartSequenceAfterFalseStart', '3': 2, '4': 1, '5': 8, '10': 'continueStartSequenceAfterFalseStart'},
  ],
};

/// Descriptor for `ContinueAfterFalseStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List continueAfterFalseStartDescriptor = $convert.base64Decode(
    'ChdDb250aW51ZUFmdGVyRmFsc2VTdGFydBIwChNhc3N1bWVkUmVhY3Rpb25UaW1lGAEgASgNUh'
    'Nhc3N1bWVkUmVhY3Rpb25UaW1lElIKJGNvbnRpbnVlU3RhcnRTZXF1ZW5jZUFmdGVyRmFsc2VT'
    'dGFydBgCIAEoCFIkY29udGludWVTdGFydFNlcXVlbmNlQWZ0ZXJGYWxzZVN0YXJ0');

@$core.Deprecated('Use falseStartBehaviourDescriptor instead')
const FalseStartBehaviour$json = {
  '1': 'FalseStartBehaviour',
  '2': [
    {'1': 'abortAfterFalseStart', '3': 1, '4': 1, '5': 11, '6': '.ScStw.AbortAfterFalseStart', '9': 0, '10': 'abortAfterFalseStart'},
    {'1': 'continueAfterFalseStart', '3': 2, '4': 1, '5': 11, '6': '.ScStw.ContinueAfterFalseStart', '9': 0, '10': 'continueAfterFalseStart'},
  ],
  '8': [
    {'1': 'behaviour'},
  ],
};

/// Descriptor for `FalseStartBehaviour`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List falseStartBehaviourDescriptor = $convert.base64Decode(
    'ChNGYWxzZVN0YXJ0QmVoYXZpb3VyElEKFGFib3J0QWZ0ZXJGYWxzZVN0YXJ0GAEgASgLMhsuU2'
    'NTdHcuQWJvcnRBZnRlckZhbHNlU3RhcnRIAFIUYWJvcnRBZnRlckZhbHNlU3RhcnQSWgoXY29u'
    'dGludWVBZnRlckZhbHNlU3RhcnQYAiABKAsyHi5TY1N0dy5Db250aW51ZUFmdGVyRmFsc2VTdG'
    'FydEgAUhdjb250aW51ZUFmdGVyRmFsc2VTdGFydEILCgliZWhhdmlvdXI=');

@$core.Deprecated('Use falseStartSettingsDescriptor instead')
const FalseStartSettings$json = {
  '1': 'FalseStartSettings',
  '2': [
    {'1': 'behaviour', '3': 1, '4': 1, '5': 11, '6': '.ScStw.FalseStartBehaviour', '10': 'behaviour'},
    {'1': 'soundDuration', '3': 2, '4': 1, '5': 13, '10': 'soundDuration'},
  ],
};

/// Descriptor for `FalseStartSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List falseStartSettingsDescriptor = $convert.base64Decode(
    'ChJGYWxzZVN0YXJ0U2V0dGluZ3MSOAoJYmVoYXZpb3VyGAEgASgLMhouU2NTdHcuRmFsc2VTdG'
    'FydEJlaGF2aW91clIJYmVoYXZpb3VyEiQKDXNvdW5kRHVyYXRpb24YAiABKA1SDXNvdW5kRHVy'
    'YXRpb24=');

@$core.Deprecated('Use indicatorSettingsDescriptor instead')
const IndicatorSettings$json = {
  '1': 'IndicatorSettings',
  '2': [
    {'1': 'brightness', '3': 1, '4': 1, '5': 13, '10': 'brightness'},
    {'1': 'turnOffWhenFalseStartSoundIsMuted', '3': 2, '4': 1, '5': 8, '10': 'turnOffWhenFalseStartSoundIsMuted'},
    {'1': 'turnOffWhenIdle', '3': 3, '4': 1, '5': 8, '10': 'turnOffWhenIdle'},
  ],
};

/// Descriptor for `IndicatorSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indicatorSettingsDescriptor = $convert.base64Decode(
    'ChFJbmRpY2F0b3JTZXR0aW5ncxIeCgpicmlnaHRuZXNzGAEgASgNUgpicmlnaHRuZXNzEkwKIX'
    'R1cm5PZmZXaGVuRmFsc2VTdGFydFNvdW5kSXNNdXRlZBgCIAEoCFIhdHVybk9mZldoZW5GYWxz'
    'ZVN0YXJ0U291bmRJc011dGVkEigKD3R1cm5PZmZXaGVuSWRsZRgDIAEoCFIPdHVybk9mZldoZW'
    '5JZGxl');

@$core.Deprecated('Use trainingClassicRaceModeDescriptor instead')
const TrainingClassicRaceMode$json = {
  '1': 'TrainingClassicRaceMode',
  '2': [
    {'1': 'startProcedure', '3': 1, '4': 1, '5': 11, '6': '.ScStw.StartProcedure', '10': 'startProcedure'},
    {'1': 'lanes', '3': 2, '4': 3, '5': 11, '6': '.ScStw.LaneSettings', '10': 'lanes'},
    {'1': 'falseStartSettings', '3': 3, '4': 1, '5': 11, '6': '.ScStw.FalseStartSettings', '10': 'falseStartSettings'},
    {'1': 'indicatorSettings', '3': 4, '4': 1, '5': 11, '6': '.ScStw.IndicatorSettings', '10': 'indicatorSettings'},
  ],
};

/// Descriptor for `TrainingClassicRaceMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingClassicRaceModeDescriptor = $convert.base64Decode(
    'ChdUcmFpbmluZ0NsYXNzaWNSYWNlTW9kZRI9Cg5zdGFydFByb2NlZHVyZRgBIAEoCzIVLlNjU3'
    'R3LlN0YXJ0UHJvY2VkdXJlUg5zdGFydFByb2NlZHVyZRIpCgVsYW5lcxgCIAMoCzITLlNjU3R3'
    'LkxhbmVTZXR0aW5nc1IFbGFuZXMSSQoSZmFsc2VTdGFydFNldHRpbmdzGAMgASgLMhkuU2NTdH'
    'cuRmFsc2VTdGFydFNldHRpbmdzUhJmYWxzZVN0YXJ0U2V0dGluZ3MSRgoRaW5kaWNhdG9yU2V0'
    'dGluZ3MYBCABKAsyGC5TY1N0dy5JbmRpY2F0b3JTZXR0aW5nc1IRaW5kaWNhdG9yU2V0dGluZ3'
    'M=');

@$core.Deprecated('Use stopwatchSettingsDescriptor instead')
const StopwatchSettings$json = {
  '1': 'StopwatchSettings',
  '2': [
    {'1': 'competitionClassicRaceMode', '3': 1, '4': 1, '5': 11, '6': '.ScStw.CompetitionClassicRaceMode', '9': 0, '10': 'competitionClassicRaceMode'},
    {'1': 'trainingClassicRaceMode', '3': 2, '4': 1, '5': 11, '6': '.ScStw.TrainingClassicRaceMode', '9': 0, '10': 'trainingClassicRaceMode'},
  ],
  '8': [
    {'1': 'mode'},
  ],
};

/// Descriptor for `StopwatchSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopwatchSettingsDescriptor = $convert.base64Decode(
    'ChFTdG9wd2F0Y2hTZXR0aW5ncxJjChpjb21wZXRpdGlvbkNsYXNzaWNSYWNlTW9kZRgBIAEoCz'
    'IhLlNjU3R3LkNvbXBldGl0aW9uQ2xhc3NpY1JhY2VNb2RlSABSGmNvbXBldGl0aW9uQ2xhc3Np'
    'Y1JhY2VNb2RlEloKF3RyYWluaW5nQ2xhc3NpY1JhY2VNb2RlGAIgASgLMh4uU2NTdHcuVHJhaW'
    '5pbmdDbGFzc2ljUmFjZU1vZGVIAFIXdHJhaW5pbmdDbGFzc2ljUmFjZU1vZGVCBgoEbW9kZQ==');

@$core.Deprecated('Use settingsDescriptor instead')
const Settings$json = {
  '1': 'Settings',
  '2': [
    {'1': 'default', '3': 1, '4': 1, '5': 8, '10': 'default'},
    {
      '1': 'race',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ScStw.deprecated.race_settings.RaceSettings',
      '8': {'3': true},
      '10': 'race',
    },
    {'1': 'sound', '3': 3, '4': 1, '5': 11, '6': '.ScStw.SoundSettings', '10': 'sound'},
    {'1': 'stopwatchSettings', '3': 4, '4': 1, '5': 11, '6': '.ScStw.StopwatchSettings', '10': 'stopwatchSettings'},
    {'1': 'securitySettings', '3': 5, '4': 1, '5': 11, '6': '.ScStw.SecuritySettings', '10': 'securitySettings'},
  ],
};

/// Descriptor for `Settings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingsDescriptor = $convert.base64Decode(
    'CghTZXR0aW5ncxIYCgdkZWZhdWx0GAEgASgIUgdkZWZhdWx0EkQKBHJhY2UYAiABKAsyLC5TY1'
    'N0dy5kZXByZWNhdGVkLnJhY2Vfc2V0dGluZ3MuUmFjZVNldHRpbmdzQgIYAVIEcmFjZRIqCgVz'
    'b3VuZBgDIAEoCzIULlNjU3R3LlNvdW5kU2V0dGluZ3NSBXNvdW5kEkYKEXN0b3B3YXRjaFNldH'
    'RpbmdzGAQgASgLMhguU2NTdHcuU3RvcHdhdGNoU2V0dGluZ3NSEXN0b3B3YXRjaFNldHRpbmdz'
    'EkMKEHNlY3VyaXR5U2V0dGluZ3MYBSABKAsyFy5TY1N0dy5TZWN1cml0eVNldHRpbmdzUhBzZW'
    'N1cml0eVNldHRpbmdz');

