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

@$core.Deprecated('Use competitionRoundDescriptor instead')
const CompetitionRound$json = {
  '1': 'CompetitionRound',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'QUALIFICATION', '2': 1},
    {'1': 'FINAL', '2': 2},
  ],
};

/// Descriptor for `CompetitionRound`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List competitionRoundDescriptor = $convert.base64Decode(
    'ChBDb21wZXRpdGlvblJvdW5kEg8KC1VOU1BFQ0lGSUVEEAASEQoNUVVBTElGSUNBVElPThABEg'
    'kKBUZJTkFMEAI=');

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
    {'1': 'round', '3': 2, '4': 1, '5': 14, '6': '.ScStw.CompetitionRound', '10': 'round'},
  ],
};

/// Descriptor for `CompetitionClassicRaceMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List competitionClassicRaceModeDescriptor = $convert.base64Decode(
    'ChpDb21wZXRpdGlvbkNsYXNzaWNSYWNlTW9kZRJPChRtYW51YWxTdGFydFByb2NlZHVyZRgBIA'
    'EoCzIbLlNjU3R3Lk1hbnVhbFN0YXJ0UHJvY2VkdXJlUhRtYW51YWxTdGFydFByb2NlZHVyZRIt'
    'CgVyb3VuZBgCIAEoDjIXLlNjU3R3LkNvbXBldGl0aW9uUm91bmRSBXJvdW5k');

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

@$core.Deprecated('Use falseStartSettingsDescriptor instead')
const FalseStartSettings$json = {
  '1': 'FalseStartSettings',
  '2': [
    {
      '1': 'behaviour',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ScStw.deprecated.FalseStartBehaviour',
      '8': {'3': true},
      '10': 'behaviour',
    },
    {'1': 'soundDuration', '3': 2, '4': 1, '5': 13, '10': 'soundDuration'},
    {'1': 'assumedReactionTime', '3': 3, '4': 1, '5': 13, '10': 'assumedReactionTime'},
  ],
};

/// Descriptor for `FalseStartSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List falseStartSettingsDescriptor = $convert.base64Decode(
    'ChJGYWxzZVN0YXJ0U2V0dGluZ3MSRwoJYmVoYXZpb3VyGAEgASgLMiUuU2NTdHcuZGVwcmVjYX'
    'RlZC5GYWxzZVN0YXJ0QmVoYXZpb3VyQgIYAVIJYmVoYXZpb3VyEiQKDXNvdW5kRHVyYXRpb24Y'
    'AiABKA1SDXNvdW5kRHVyYXRpb24SMAoTYXNzdW1lZFJlYWN0aW9uVGltZRgDIAEoDVITYXNzdW'
    '1lZFJlYWN0aW9uVGltZQ==');

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
    {'1': 'round', '3': 5, '4': 1, '5': 14, '6': '.ScStw.CompetitionRound', '10': 'round'},
  ],
};

/// Descriptor for `TrainingClassicRaceMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingClassicRaceModeDescriptor = $convert.base64Decode(
    'ChdUcmFpbmluZ0NsYXNzaWNSYWNlTW9kZRI9Cg5zdGFydFByb2NlZHVyZRgBIAEoCzIVLlNjU3'
    'R3LlN0YXJ0UHJvY2VkdXJlUg5zdGFydFByb2NlZHVyZRIpCgVsYW5lcxgCIAMoCzITLlNjU3R3'
    'LkxhbmVTZXR0aW5nc1IFbGFuZXMSSQoSZmFsc2VTdGFydFNldHRpbmdzGAMgASgLMhkuU2NTdH'
    'cuRmFsc2VTdGFydFNldHRpbmdzUhJmYWxzZVN0YXJ0U2V0dGluZ3MSRgoRaW5kaWNhdG9yU2V0'
    'dGluZ3MYBCABKAsyGC5TY1N0dy5JbmRpY2F0b3JTZXR0aW5nc1IRaW5kaWNhdG9yU2V0dGluZ3'
    'MSLQoFcm91bmQYBSABKA4yFy5TY1N0dy5Db21wZXRpdGlvblJvdW5kUgVyb3VuZA==');

@$core.Deprecated('Use competitionRelayModeDescriptor instead')
const CompetitionRelayMode$json = {
  '1': 'CompetitionRelayMode',
  '2': [
    {'1': 'manualStartProcedure', '3': 1, '4': 1, '5': 11, '6': '.ScStw.ManualStartProcedure', '10': 'manualStartProcedure'},
    {'1': 'round', '3': 2, '4': 1, '5': 14, '6': '.ScStw.CompetitionRound', '10': 'round'},
  ],
};

/// Descriptor for `CompetitionRelayMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List competitionRelayModeDescriptor = $convert.base64Decode(
    'ChRDb21wZXRpdGlvblJlbGF5TW9kZRJPChRtYW51YWxTdGFydFByb2NlZHVyZRgBIAEoCzIbLl'
    'NjU3R3Lk1hbnVhbFN0YXJ0UHJvY2VkdXJlUhRtYW51YWxTdGFydFByb2NlZHVyZRItCgVyb3Vu'
    'ZBgCIAEoDjIXLlNjU3R3LkNvbXBldGl0aW9uUm91bmRSBXJvdW5k');

@$core.Deprecated('Use trainingStartOnReleaseModeDescriptor instead')
const TrainingStartOnReleaseMode$json = {
  '1': 'TrainingStartOnReleaseMode',
  '2': [
    {'1': 'indicatorSettings', '3': 1, '4': 1, '5': 11, '6': '.ScStw.IndicatorSettings', '10': 'indicatorSettings'},
  ],
};

/// Descriptor for `TrainingStartOnReleaseMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingStartOnReleaseModeDescriptor = $convert.base64Decode(
    'ChpUcmFpbmluZ1N0YXJ0T25SZWxlYXNlTW9kZRJGChFpbmRpY2F0b3JTZXR0aW5ncxgBIAEoCz'
    'IYLlNjU3R3LkluZGljYXRvclNldHRpbmdzUhFpbmRpY2F0b3JTZXR0aW5ncw==');

@$core.Deprecated('Use stopwatchSettingsDescriptor instead')
const StopwatchSettings$json = {
  '1': 'StopwatchSettings',
  '2': [
    {'1': 'competitionClassicRaceMode', '3': 1, '4': 1, '5': 11, '6': '.ScStw.CompetitionClassicRaceMode', '9': 0, '10': 'competitionClassicRaceMode'},
    {'1': 'trainingClassicRaceMode', '3': 2, '4': 1, '5': 11, '6': '.ScStw.TrainingClassicRaceMode', '9': 0, '10': 'trainingClassicRaceMode'},
    {'1': 'competitionRelayMode', '3': 3, '4': 1, '5': 11, '6': '.ScStw.CompetitionRelayMode', '9': 0, '10': 'competitionRelayMode'},
    {'1': 'trainingStartOnReleaseMode', '3': 4, '4': 1, '5': 11, '6': '.ScStw.TrainingStartOnReleaseMode', '9': 0, '10': 'trainingStartOnReleaseMode'},
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
    '5pbmdDbGFzc2ljUmFjZU1vZGVIAFIXdHJhaW5pbmdDbGFzc2ljUmFjZU1vZGUSUQoUY29tcGV0'
    'aXRpb25SZWxheU1vZGUYAyABKAsyGy5TY1N0dy5Db21wZXRpdGlvblJlbGF5TW9kZUgAUhRjb2'
    '1wZXRpdGlvblJlbGF5TW9kZRJjChp0cmFpbmluZ1N0YXJ0T25SZWxlYXNlTW9kZRgEIAEoCzIh'
    'LlNjU3R3LlRyYWluaW5nU3RhcnRPblJlbGVhc2VNb2RlSABSGnRyYWluaW5nU3RhcnRPblJlbG'
    'Vhc2VNb2RlQgYKBG1vZGU=');

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
      '6': '.ScStw.deprecated.RaceSettings',
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
    'CghTZXR0aW5ncxIYCgdkZWZhdWx0GAEgASgIUgdkZWZhdWx0EjYKBHJhY2UYAiABKAsyHi5TY1'
    'N0dy5kZXByZWNhdGVkLlJhY2VTZXR0aW5nc0ICGAFSBHJhY2USKgoFc291bmQYAyABKAsyFC5T'
    'Y1N0dy5Tb3VuZFNldHRpbmdzUgVzb3VuZBJGChFzdG9wd2F0Y2hTZXR0aW5ncxgEIAEoCzIYLl'
    'NjU3R3LlN0b3B3YXRjaFNldHRpbmdzUhFzdG9wd2F0Y2hTZXR0aW5ncxJDChBzZWN1cml0eVNl'
    'dHRpbmdzGAUgASgLMhcuU2NTdHcuU2VjdXJpdHlTZXR0aW5nc1IQc2VjdXJpdHlTZXR0aW5ncw'
    '==');

