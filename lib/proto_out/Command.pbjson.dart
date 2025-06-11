//
//  Generated code. Do not modify.
//  source: Command.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use raceStartCommandDescriptor instead')
const RaceStartCommand$json = {
  '1': 'RaceStartCommand',
};

/// Descriptor for `RaceStartCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raceStartCommandDescriptor = $convert.base64Decode(
    'ChBSYWNlU3RhcnRDb21tYW5k');

@$core.Deprecated('Use laneSetDisabledCommandDescriptor instead')
const LaneSetDisabledCommand$json = {
  '1': 'LaneSetDisabledCommand',
  '2': [
    {'1': 'laneNumber', '3': 1, '4': 1, '5': 13, '10': 'laneNumber'},
    {'1': 'disabled', '3': 2, '4': 1, '5': 8, '10': 'disabled'},
  ],
};

/// Descriptor for `LaneSetDisabledCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List laneSetDisabledCommandDescriptor = $convert.base64Decode(
    'ChZMYW5lU2V0RGlzYWJsZWRDb21tYW5kEh4KCmxhbmVOdW1iZXIYASABKA1SCmxhbmVOdW1iZX'
    'ISGgoIZGlzYWJsZWQYAiABKAhSCGRpc2FibGVk');

@$core.Deprecated('Use laneSetFallCommandDescriptor instead')
const LaneSetFallCommand$json = {
  '1': 'LaneSetFallCommand',
  '2': [
    {'1': 'laneNumber', '3': 1, '4': 1, '5': 13, '10': 'laneNumber'},
  ],
};

/// Descriptor for `LaneSetFallCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List laneSetFallCommandDescriptor = $convert.base64Decode(
    'ChJMYW5lU2V0RmFsbENvbW1hbmQSHgoKbGFuZU51bWJlchgBIAEoDVIKbGFuZU51bWJlcg==');

@$core.Deprecated('Use raceResetCommandDescriptor instead')
const RaceResetCommand$json = {
  '1': 'RaceResetCommand',
};

/// Descriptor for `RaceResetCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raceResetCommandDescriptor = $convert.base64Decode(
    'ChBSYWNlUmVzZXRDb21tYW5k');

@$core.Deprecated('Use rebootCommandDescriptor instead')
const RebootCommand$json = {
  '1': 'RebootCommand',
};

/// Descriptor for `RebootCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rebootCommandDescriptor = $convert.base64Decode(
    'Cg1SZWJvb3RDb21tYW5k');

@$core.Deprecated('Use sayAtYourMarksCommandDescriptor instead')
const SayAtYourMarksCommand$json = {
  '1': 'SayAtYourMarksCommand',
};

/// Descriptor for `SayAtYourMarksCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sayAtYourMarksCommandDescriptor = $convert.base64Decode(
    'ChVTYXlBdFlvdXJNYXJrc0NvbW1hbmQ=');

@$core.Deprecated('Use muteFalseStartSoundCommandDescriptor instead')
const MuteFalseStartSoundCommand$json = {
  '1': 'MuteFalseStartSoundCommand',
};

/// Descriptor for `MuteFalseStartSoundCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List muteFalseStartSoundCommandDescriptor = $convert.base64Decode(
    'ChpNdXRlRmFsc2VTdGFydFNvdW5kQ29tbWFuZA==');

@$core.Deprecated('Use commandDescriptor instead')
const Command$json = {
  '1': 'Command',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 11, '6': '.ScStw.RaceStartCommand', '9': 0, '10': 'start'},
    {'1': 'disable', '3': 2, '4': 1, '5': 11, '6': '.ScStw.LaneSetDisabledCommand', '9': 0, '10': 'disable'},
    {'1': 'fall', '3': 3, '4': 1, '5': 11, '6': '.ScStw.LaneSetFallCommand', '9': 0, '10': 'fall'},
    {'1': 'reset', '3': 4, '4': 1, '5': 11, '6': '.ScStw.RaceResetCommand', '9': 0, '10': 'reset'},
    {'1': 'reboot', '3': 5, '4': 1, '5': 11, '6': '.ScStw.RebootCommand', '9': 0, '10': 'reboot'},
    {'1': 'sayAtYourMarks', '3': 6, '4': 1, '5': 11, '6': '.ScStw.SayAtYourMarksCommand', '9': 0, '10': 'sayAtYourMarks'},
    {'1': 'muteFalseStartSound', '3': 7, '4': 1, '5': 11, '6': '.ScStw.MuteFalseStartSoundCommand', '9': 0, '10': 'muteFalseStartSound'},
  ],
  '8': [
    {'1': 'command'},
  ],
};

/// Descriptor for `Command`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandDescriptor = $convert.base64Decode(
    'CgdDb21tYW5kEi8KBXN0YXJ0GAEgASgLMhcuU2NTdHcuUmFjZVN0YXJ0Q29tbWFuZEgAUgVzdG'
    'FydBI5CgdkaXNhYmxlGAIgASgLMh0uU2NTdHcuTGFuZVNldERpc2FibGVkQ29tbWFuZEgAUgdk'
    'aXNhYmxlEi8KBGZhbGwYAyABKAsyGS5TY1N0dy5MYW5lU2V0RmFsbENvbW1hbmRIAFIEZmFsbB'
    'IvCgVyZXNldBgEIAEoCzIXLlNjU3R3LlJhY2VSZXNldENvbW1hbmRIAFIFcmVzZXQSLgoGcmVi'
    'b290GAUgASgLMhQuU2NTdHcuUmVib290Q29tbWFuZEgAUgZyZWJvb3QSRgoOc2F5QXRZb3VyTW'
    'Fya3MYBiABKAsyHC5TY1N0dy5TYXlBdFlvdXJNYXJrc0NvbW1hbmRIAFIOc2F5QXRZb3VyTWFy'
    'a3MSVQoTbXV0ZUZhbHNlU3RhcnRTb3VuZBgHIAEoCzIhLlNjU3R3Lk11dGVGYWxzZVN0YXJ0U2'
    '91bmRDb21tYW5kSABSE211dGVGYWxzZVN0YXJ0U291bmRCCQoHY29tbWFuZA==');

