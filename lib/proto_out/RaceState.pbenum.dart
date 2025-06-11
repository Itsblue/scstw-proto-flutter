//
//  Generated code. Do not modify.
//  source: RaceState.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LaneFullState_State extends $pb.ProtobufEnum {
  static const LaneFullState_State IDLE = LaneFullState_State._(0, _omitEnumNames ? '' : 'IDLE');
  static const LaneFullState_State IDLE_FOOT_DOWN = LaneFullState_State._(1, _omitEnumNames ? '' : 'IDLE_FOOT_DOWN');
  static const LaneFullState_State READY_FOOT_DOWN = LaneFullState_State._(2, _omitEnumNames ? '' : 'READY_FOOT_DOWN');
  static const LaneFullState_State RUNNING_FOOT_DOWN = LaneFullState_State._(3, _omitEnumNames ? '' : 'RUNNING_FOOT_DOWN');
  static const LaneFullState_State RUNNING = LaneFullState_State._(4, _omitEnumNames ? '' : 'RUNNING');
  static const LaneFullState_State FALSE_START = LaneFullState_State._(5, _omitEnumNames ? '' : 'FALSE_START');
  static const LaneFullState_State FALSE_START_TIE = LaneFullState_State._(6, _omitEnumNames ? '' : 'FALSE_START_TIE');
  static const LaneFullState_State WILDCARD = LaneFullState_State._(7, _omitEnumNames ? '' : 'WILDCARD');
  static const LaneFullState_State FINISHED = LaneFullState_State._(8, _omitEnumNames ? '' : 'FINISHED');
  static const LaneFullState_State FINISHED_WINNER = LaneFullState_State._(9, _omitEnumNames ? '' : 'FINISHED_WINNER');
  static const LaneFullState_State FINISHED_TIE = LaneFullState_State._(10, _omitEnumNames ? '' : 'FINISHED_TIE');
  static const LaneFullState_State FALL = LaneFullState_State._(11, _omitEnumNames ? '' : 'FALL');
  static const LaneFullState_State DISABLED = LaneFullState_State._(12, _omitEnumNames ? '' : 'DISABLED');

  static const $core.List<LaneFullState_State> values = <LaneFullState_State> [
    IDLE,
    IDLE_FOOT_DOWN,
    READY_FOOT_DOWN,
    RUNNING_FOOT_DOWN,
    RUNNING,
    FALSE_START,
    FALSE_START_TIE,
    WILDCARD,
    FINISHED,
    FINISHED_WINNER,
    FINISHED_TIE,
    FALL,
    DISABLED,
  ];

  static final $core.Map<$core.int, LaneFullState_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LaneFullState_State? valueOf($core.int value) => _byValue[value];

  const LaneFullState_State._($core.int v, $core.String n) : super(v, n);
}

class RaceFullState_State extends $pb.ProtobufEnum {
  static const RaceFullState_State IDLE = RaceFullState_State._(0, _omitEnumNames ? '' : 'IDLE');
  static const RaceFullState_State IDLE_CLEAR_TO_START = RaceFullState_State._(1, _omitEnumNames ? '' : 'IDLE_CLEAR_TO_START');
  static const RaceFullState_State STARTING = RaceFullState_State._(2, _omitEnumNames ? '' : 'STARTING');
  static const RaceFullState_State RUNNING = RaceFullState_State._(3, _omitEnumNames ? '' : 'RUNNING');
  static const RaceFullState_State FINISHED = RaceFullState_State._(4, _omitEnumNames ? '' : 'FINISHED');
  static const RaceFullState_State FINISHED_MUTED = RaceFullState_State._(5, _omitEnumNames ? '' : 'FINISHED_MUTED');

  static const $core.List<RaceFullState_State> values = <RaceFullState_State> [
    IDLE,
    IDLE_CLEAR_TO_START,
    STARTING,
    RUNNING,
    FINISHED,
    FINISHED_MUTED,
  ];

  static final $core.Map<$core.int, RaceFullState_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RaceFullState_State? valueOf($core.int value) => _byValue[value];

  const RaceFullState_State._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
