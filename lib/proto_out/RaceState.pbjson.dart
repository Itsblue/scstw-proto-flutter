//
//  Generated code. Do not modify.
//  source: RaceState.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use trainingClassicRaceExtraStateDescriptor instead')
const TrainingClassicRaceExtraState$json = {
  '1': 'TrainingClassicRaceExtraState',
  '2': [
    {'1': 'autostartPending', '3': 1, '4': 1, '5': 8, '10': 'autostartPending'},
    {'1': 'timeIsCalculated', '3': 2, '4': 1, '5': 8, '10': 'timeIsCalculated'},
  ],
};

/// Descriptor for `TrainingClassicRaceExtraState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingClassicRaceExtraStateDescriptor = $convert.base64Decode(
    'Ch1UcmFpbmluZ0NsYXNzaWNSYWNlRXh0cmFTdGF0ZRIqChBhdXRvc3RhcnRQZW5kaW5nGAEgAS'
    'gIUhBhdXRvc3RhcnRQZW5kaW5nEioKEHRpbWVJc0NhbGN1bGF0ZWQYAiABKAhSEHRpbWVJc0Nh'
    'bGN1bGF0ZWQ=');

@$core.Deprecated('Use laneExtraStateDescriptor instead')
const LaneExtraState$json = {
  '1': 'LaneExtraState',
  '2': [
    {'1': 'trainingClassicRaceExtraState', '3': 1, '4': 1, '5': 11, '6': '.ScStw.TrainingClassicRaceExtraState', '9': 0, '10': 'trainingClassicRaceExtraState'},
  ],
  '8': [
    {'1': 'state'},
  ],
};

/// Descriptor for `LaneExtraState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List laneExtraStateDescriptor = $convert.base64Decode(
    'Cg5MYW5lRXh0cmFTdGF0ZRJsCh10cmFpbmluZ0NsYXNzaWNSYWNlRXh0cmFTdGF0ZRgBIAEoCz'
    'IkLlNjU3R3LlRyYWluaW5nQ2xhc3NpY1JhY2VFeHRyYVN0YXRlSABSHXRyYWluaW5nQ2xhc3Np'
    'Y1JhY2VFeHRyYVN0YXRlQgcKBXN0YXRl');

@$core.Deprecated('Use laneFullStateDescriptor instead')
const LaneFullState$json = {
  '1': 'LaneFullState',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.ScStw.LaneFullState.State', '10': 'state'},
    {'1': 'reactionTime', '3': 2, '4': 1, '5': 13, '10': 'reactionTime'},
    {'1': 'climbingTime', '3': 3, '4': 1, '5': 13, '10': 'climbingTime'},
    {'1': 'extraState', '3': 4, '4': 1, '5': 11, '6': '.ScStw.LaneExtraState', '10': 'extraState'},
  ],
  '4': [LaneFullState_State$json],
};

@$core.Deprecated('Use laneFullStateDescriptor instead')
const LaneFullState_State$json = {
  '1': 'State',
  '2': [
    {'1': 'IDLE', '2': 0},
    {'1': 'IDLE_FOOT_DOWN', '2': 1},
    {'1': 'READY_FOOT_DOWN', '2': 2},
    {'1': 'RUNNING_FOOT_DOWN', '2': 3},
    {'1': 'RUNNING', '2': 4},
    {'1': 'FALSE_START', '2': 5},
    {'1': 'FALSE_START_TIE', '2': 6},
    {'1': 'WILDCARD', '2': 7},
    {'1': 'FINISHED', '2': 8},
    {'1': 'FINISHED_WINNER', '2': 9},
    {'1': 'FINISHED_TIE', '2': 10},
    {'1': 'FALL', '2': 11},
    {'1': 'DISABLED', '2': 12},
  ],
};

/// Descriptor for `LaneFullState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List laneFullStateDescriptor = $convert.base64Decode(
    'Cg1MYW5lRnVsbFN0YXRlEjAKBXN0YXRlGAEgASgOMhouU2NTdHcuTGFuZUZ1bGxTdGF0ZS5TdG'
    'F0ZVIFc3RhdGUSIgoMcmVhY3Rpb25UaW1lGAIgASgNUgxyZWFjdGlvblRpbWUSIgoMY2xpbWJp'
    'bmdUaW1lGAMgASgNUgxjbGltYmluZ1RpbWUSNQoKZXh0cmFTdGF0ZRgEIAEoCzIVLlNjU3R3Lk'
    'xhbmVFeHRyYVN0YXRlUgpleHRyYVN0YXRlIt8BCgVTdGF0ZRIICgRJRExFEAASEgoOSURMRV9G'
    'T09UX0RPV04QARITCg9SRUFEWV9GT09UX0RPV04QAhIVChFSVU5OSU5HX0ZPT1RfRE9XThADEg'
    'sKB1JVTk5JTkcQBBIPCgtGQUxTRV9TVEFSVBAFEhMKD0ZBTFNFX1NUQVJUX1RJRRAGEgwKCFdJ'
    'TERDQVJEEAcSDAoIRklOSVNIRUQQCBITCg9GSU5JU0hFRF9XSU5ORVIQCRIQCgxGSU5JU0hFRF'
    '9USUUQChIICgRGQUxMEAsSDAoIRElTQUJMRUQQDA==');

@$core.Deprecated('Use raceFullStateDescriptor instead')
const RaceFullState$json = {
  '1': 'RaceFullState',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.ScStw.RaceFullState.State', '10': 'state'},
    {'1': 'laneStates', '3': 2, '4': 3, '5': 11, '6': '.ScStw.LaneFullState', '10': 'laneStates'},
  ],
  '4': [RaceFullState_State$json],
};

@$core.Deprecated('Use raceFullStateDescriptor instead')
const RaceFullState_State$json = {
  '1': 'State',
  '2': [
    {'1': 'IDLE', '2': 0},
    {'1': 'IDLE_CLEAR_TO_START', '2': 1},
    {'1': 'STARTING', '2': 2},
    {'1': 'RUNNING', '2': 3},
    {'1': 'FINISHED', '2': 4},
    {'1': 'FINISHED_MUTED', '2': 5},
  ],
};

/// Descriptor for `RaceFullState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raceFullStateDescriptor = $convert.base64Decode(
    'Cg1SYWNlRnVsbFN0YXRlEjAKBXN0YXRlGAEgASgOMhouU2NTdHcuUmFjZUZ1bGxTdGF0ZS5TdG'
    'F0ZVIFc3RhdGUSNAoKbGFuZVN0YXRlcxgCIAMoCzIULlNjU3R3LkxhbmVGdWxsU3RhdGVSCmxh'
    'bmVTdGF0ZXMiZwoFU3RhdGUSCAoESURMRRAAEhcKE0lETEVfQ0xFQVJfVE9fU1RBUlQQARIMCg'
    'hTVEFSVElORxACEgsKB1JVTk5JTkcQAxIMCghGSU5JU0hFRBAEEhIKDkZJTklTSEVEX01VVEVE'
    'EAU=');

