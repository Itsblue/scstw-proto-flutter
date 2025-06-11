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

import 'RaceState.pbenum.dart';

export 'RaceState.pbenum.dart';

class TrainingClassicRaceExtraState extends $pb.GeneratedMessage {
  factory TrainingClassicRaceExtraState({
    $core.bool? autostartPending,
    $core.bool? timeIsCalculated,
  }) {
    final $result = create();
    if (autostartPending != null) {
      $result.autostartPending = autostartPending;
    }
    if (timeIsCalculated != null) {
      $result.timeIsCalculated = timeIsCalculated;
    }
    return $result;
  }
  TrainingClassicRaceExtraState._() : super();
  factory TrainingClassicRaceExtraState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainingClassicRaceExtraState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainingClassicRaceExtraState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'autostartPending', protoName: 'autostartPending')
    ..aOB(2, _omitFieldNames ? '' : 'timeIsCalculated', protoName: 'timeIsCalculated')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainingClassicRaceExtraState clone() => TrainingClassicRaceExtraState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainingClassicRaceExtraState copyWith(void Function(TrainingClassicRaceExtraState) updates) => super.copyWith((message) => updates(message as TrainingClassicRaceExtraState)) as TrainingClassicRaceExtraState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingClassicRaceExtraState create() => TrainingClassicRaceExtraState._();
  TrainingClassicRaceExtraState createEmptyInstance() => create();
  static $pb.PbList<TrainingClassicRaceExtraState> createRepeated() => $pb.PbList<TrainingClassicRaceExtraState>();
  @$core.pragma('dart2js:noInline')
  static TrainingClassicRaceExtraState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainingClassicRaceExtraState>(create);
  static TrainingClassicRaceExtraState? _defaultInstance;

  /// If this stays `true` for at least the configured autostart
  /// standstillDurationBeforeStart, an autostart will be executed.
  /// Once this becomes true, clients should display indicate it and
  /// optionally show a countdown.
  @$pb.TagNumber(1)
  $core.bool get autostartPending => $_getBF(0);
  @$pb.TagNumber(1)
  set autostartPending($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAutostartPending() => $_has(0);
  @$pb.TagNumber(1)
  void clearAutostartPending() => clearField(1);

  /// If this is `true`, the time is calculated and the valid.
  /// This happens when the athlete does a false start but still finishes.
  /// In this case, the client should mark the time as invalid.
  @$pb.TagNumber(2)
  $core.bool get timeIsCalculated => $_getBF(1);
  @$pb.TagNumber(2)
  set timeIsCalculated($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimeIsCalculated() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeIsCalculated() => clearField(2);
}

enum LaneExtraState_State {
  trainingClassicRaceExtraState, 
  notSet
}

class LaneExtraState extends $pb.GeneratedMessage {
  factory LaneExtraState({
    TrainingClassicRaceExtraState? trainingClassicRaceExtraState,
  }) {
    final $result = create();
    if (trainingClassicRaceExtraState != null) {
      $result.trainingClassicRaceExtraState = trainingClassicRaceExtraState;
    }
    return $result;
  }
  LaneExtraState._() : super();
  factory LaneExtraState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LaneExtraState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, LaneExtraState_State> _LaneExtraState_StateByTag = {
    1 : LaneExtraState_State.trainingClassicRaceExtraState,
    0 : LaneExtraState_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LaneExtraState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<TrainingClassicRaceExtraState>(1, _omitFieldNames ? '' : 'trainingClassicRaceExtraState', protoName: 'trainingClassicRaceExtraState', subBuilder: TrainingClassicRaceExtraState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LaneExtraState clone() => LaneExtraState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LaneExtraState copyWith(void Function(LaneExtraState) updates) => super.copyWith((message) => updates(message as LaneExtraState)) as LaneExtraState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaneExtraState create() => LaneExtraState._();
  LaneExtraState createEmptyInstance() => create();
  static $pb.PbList<LaneExtraState> createRepeated() => $pb.PbList<LaneExtraState>();
  @$core.pragma('dart2js:noInline')
  static LaneExtraState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LaneExtraState>(create);
  static LaneExtraState? _defaultInstance;

  LaneExtraState_State whichState() => _LaneExtraState_StateByTag[$_whichOneof(0)]!;
  void clearState() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TrainingClassicRaceExtraState get trainingClassicRaceExtraState => $_getN(0);
  @$pb.TagNumber(1)
  set trainingClassicRaceExtraState(TrainingClassicRaceExtraState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrainingClassicRaceExtraState() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrainingClassicRaceExtraState() => clearField(1);
  @$pb.TagNumber(1)
  TrainingClassicRaceExtraState ensureTrainingClassicRaceExtraState() => $_ensure(0);
}

class LaneFullState extends $pb.GeneratedMessage {
  factory LaneFullState({
    LaneFullState_State? state,
    $core.int? reactionTime,
    $core.int? climbingTime,
    LaneExtraState? extraState,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    if (reactionTime != null) {
      $result.reactionTime = reactionTime;
    }
    if (climbingTime != null) {
      $result.climbingTime = climbingTime;
    }
    if (extraState != null) {
      $result.extraState = extraState;
    }
    return $result;
  }
  LaneFullState._() : super();
  factory LaneFullState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LaneFullState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LaneFullState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..e<LaneFullState_State>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: LaneFullState_State.IDLE, valueOf: LaneFullState_State.valueOf, enumValues: LaneFullState_State.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'reactionTime', $pb.PbFieldType.OU3, protoName: 'reactionTime')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'climbingTime', $pb.PbFieldType.OU3, protoName: 'climbingTime')
    ..aOM<LaneExtraState>(4, _omitFieldNames ? '' : 'extraState', protoName: 'extraState', subBuilder: LaneExtraState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LaneFullState clone() => LaneFullState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LaneFullState copyWith(void Function(LaneFullState) updates) => super.copyWith((message) => updates(message as LaneFullState)) as LaneFullState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaneFullState create() => LaneFullState._();
  LaneFullState createEmptyInstance() => create();
  static $pb.PbList<LaneFullState> createRepeated() => $pb.PbList<LaneFullState>();
  @$core.pragma('dart2js:noInline')
  static LaneFullState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LaneFullState>(create);
  static LaneFullState? _defaultInstance;

  @$pb.TagNumber(1)
  LaneFullState_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(LaneFullState_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  /// The reaction time in milliseconds relative to the beginning of the start
  /// sequence. To get the common representation of the reaction time (relative
  /// to the beginning of the third beep), 3000ms must be subtracted.
  /// If this is 0, the reaction time is not set (yet).
  @$pb.TagNumber(2)
  $core.int get reactionTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set reactionTime($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReactionTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearReactionTime() => clearField(2);

  /// The climbing time in milliseconds relative to the beginning of the third
  /// beep.
  /// If this is 0, the climbing time is not set (yet).
  @$pb.TagNumber(3)
  $core.int get climbingTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set climbingTime($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClimbingTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearClimbingTime() => clearField(3);

  @$pb.TagNumber(4)
  LaneExtraState get extraState => $_getN(3);
  @$pb.TagNumber(4)
  set extraState(LaneExtraState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExtraState() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtraState() => clearField(4);
  @$pb.TagNumber(4)
  LaneExtraState ensureExtraState() => $_ensure(3);
}

class RaceFullState extends $pb.GeneratedMessage {
  factory RaceFullState({
    RaceFullState_State? state,
    $core.Iterable<LaneFullState>? laneStates,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    if (laneStates != null) {
      $result.laneStates.addAll(laneStates);
    }
    return $result;
  }
  RaceFullState._() : super();
  factory RaceFullState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RaceFullState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RaceFullState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..e<RaceFullState_State>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: RaceFullState_State.IDLE, valueOf: RaceFullState_State.valueOf, enumValues: RaceFullState_State.values)
    ..pc<LaneFullState>(2, _omitFieldNames ? '' : 'laneStates', $pb.PbFieldType.PM, protoName: 'laneStates', subBuilder: LaneFullState.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RaceFullState clone() => RaceFullState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RaceFullState copyWith(void Function(RaceFullState) updates) => super.copyWith((message) => updates(message as RaceFullState)) as RaceFullState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaceFullState create() => RaceFullState._();
  RaceFullState createEmptyInstance() => create();
  static $pb.PbList<RaceFullState> createRepeated() => $pb.PbList<RaceFullState>();
  @$core.pragma('dart2js:noInline')
  static RaceFullState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RaceFullState>(create);
  static RaceFullState? _defaultInstance;

  @$pb.TagNumber(1)
  RaceFullState_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(RaceFullState_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<LaneFullState> get laneStates => $_getList(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
