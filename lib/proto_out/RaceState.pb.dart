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

import 'package:fixnum/fixnum.dart' as $fixnum;
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

class CompetitionRelayExtraState extends $pb.GeneratedMessage {
  factory CompetitionRelayExtraState({
    $core.int? firstLaneClimbingTime,
    $core.int? secondLaneReactionTime,
    $core.bool? secondLaneCausedFalseStart,
  }) {
    final $result = create();
    if (firstLaneClimbingTime != null) {
      $result.firstLaneClimbingTime = firstLaneClimbingTime;
    }
    if (secondLaneReactionTime != null) {
      $result.secondLaneReactionTime = secondLaneReactionTime;
    }
    if (secondLaneCausedFalseStart != null) {
      $result.secondLaneCausedFalseStart = secondLaneCausedFalseStart;
    }
    return $result;
  }
  CompetitionRelayExtraState._() : super();
  factory CompetitionRelayExtraState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompetitionRelayExtraState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompetitionRelayExtraState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'firstLaneClimbingTime', $pb.PbFieldType.OU3, protoName: 'firstLaneClimbingTime')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'secondLaneReactionTime', $pb.PbFieldType.OU3, protoName: 'secondLaneReactionTime')
    ..aOB(3, _omitFieldNames ? '' : 'secondLaneCausedFalseStart', protoName: 'secondLaneCausedFalseStart')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompetitionRelayExtraState clone() => CompetitionRelayExtraState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompetitionRelayExtraState copyWith(void Function(CompetitionRelayExtraState) updates) => super.copyWith((message) => updates(message as CompetitionRelayExtraState)) as CompetitionRelayExtraState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompetitionRelayExtraState create() => CompetitionRelayExtraState._();
  CompetitionRelayExtraState createEmptyInstance() => create();
  static $pb.PbList<CompetitionRelayExtraState> createRepeated() => $pb.PbList<CompetitionRelayExtraState>();
  @$core.pragma('dart2js:noInline')
  static CompetitionRelayExtraState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompetitionRelayExtraState>(create);
  static CompetitionRelayExtraState? _defaultInstance;

  /// The climbing time of the first lane in milliseconds.
  @$pb.TagNumber(1)
  $core.int get firstLaneClimbingTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set firstLaneClimbingTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstLaneClimbingTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstLaneClimbingTime() => clearField(1);

  /// secondLaneClimbingTime is LaneFullState.climbingTime -
  /// firstLaneClimbingTime.
  /// The reaction time of the second lane in milliseconds.
  @$pb.TagNumber(2)
  $core.int get secondLaneReactionTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set secondLaneReactionTime($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecondLaneReactionTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecondLaneReactionTime() => clearField(2);

  /// If this is `true`, the second lane caused the false start. This can only be
  /// true if LaneFullState.state is FALSE_START or FALSE_START_TIE
  @$pb.TagNumber(3)
  $core.bool get secondLaneCausedFalseStart => $_getBF(2);
  @$pb.TagNumber(3)
  set secondLaneCausedFalseStart($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecondLaneCausedFalseStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecondLaneCausedFalseStart() => clearField(3);
}

class TrainingStartOnReleaseExtraState extends $pb.GeneratedMessage {
  factory TrainingStartOnReleaseExtraState({
    $core.int? startedAt,
  }) {
    final $result = create();
    if (startedAt != null) {
      $result.startedAt = startedAt;
    }
    return $result;
  }
  TrainingStartOnReleaseExtraState._() : super();
  factory TrainingStartOnReleaseExtraState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainingStartOnReleaseExtraState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainingStartOnReleaseExtraState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'startedAt', $pb.PbFieldType.OU3, protoName: 'startedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainingStartOnReleaseExtraState clone() => TrainingStartOnReleaseExtraState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainingStartOnReleaseExtraState copyWith(void Function(TrainingStartOnReleaseExtraState) updates) => super.copyWith((message) => updates(message as TrainingStartOnReleaseExtraState)) as TrainingStartOnReleaseExtraState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingStartOnReleaseExtraState create() => TrainingStartOnReleaseExtraState._();
  TrainingStartOnReleaseExtraState createEmptyInstance() => create();
  static $pb.PbList<TrainingStartOnReleaseExtraState> createRepeated() => $pb.PbList<TrainingStartOnReleaseExtraState>();
  @$core.pragma('dart2js:noInline')
  static TrainingStartOnReleaseExtraState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainingStartOnReleaseExtraState>(create);
  static TrainingStartOnReleaseExtraState? _defaultInstance;

  /// The timestamp in milliseconds, relative to RaceFullState.currentTime,
  /// when the startpad was released.
  @$pb.TagNumber(1)
  $core.int get startedAt => $_getIZ(0);
  @$pb.TagNumber(1)
  set startedAt($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartedAt() => clearField(1);
}

enum LaneExtraState_State {
  trainingClassicRaceExtraState, 
  competitionRelayExtraState, 
  trainingStartOnReleaseExtraState, 
  notSet
}

class LaneExtraState extends $pb.GeneratedMessage {
  factory LaneExtraState({
    TrainingClassicRaceExtraState? trainingClassicRaceExtraState,
    CompetitionRelayExtraState? competitionRelayExtraState,
    TrainingStartOnReleaseExtraState? trainingStartOnReleaseExtraState,
  }) {
    final $result = create();
    if (trainingClassicRaceExtraState != null) {
      $result.trainingClassicRaceExtraState = trainingClassicRaceExtraState;
    }
    if (competitionRelayExtraState != null) {
      $result.competitionRelayExtraState = competitionRelayExtraState;
    }
    if (trainingStartOnReleaseExtraState != null) {
      $result.trainingStartOnReleaseExtraState = trainingStartOnReleaseExtraState;
    }
    return $result;
  }
  LaneExtraState._() : super();
  factory LaneExtraState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LaneExtraState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, LaneExtraState_State> _LaneExtraState_StateByTag = {
    1 : LaneExtraState_State.trainingClassicRaceExtraState,
    2 : LaneExtraState_State.competitionRelayExtraState,
    3 : LaneExtraState_State.trainingStartOnReleaseExtraState,
    0 : LaneExtraState_State.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LaneExtraState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<TrainingClassicRaceExtraState>(1, _omitFieldNames ? '' : 'trainingClassicRaceExtraState', protoName: 'trainingClassicRaceExtraState', subBuilder: TrainingClassicRaceExtraState.create)
    ..aOM<CompetitionRelayExtraState>(2, _omitFieldNames ? '' : 'competitionRelayExtraState', protoName: 'competitionRelayExtraState', subBuilder: CompetitionRelayExtraState.create)
    ..aOM<TrainingStartOnReleaseExtraState>(3, _omitFieldNames ? '' : 'trainingStartOnReleaseExtraState', protoName: 'trainingStartOnReleaseExtraState', subBuilder: TrainingStartOnReleaseExtraState.create)
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

  @$pb.TagNumber(2)
  CompetitionRelayExtraState get competitionRelayExtraState => $_getN(1);
  @$pb.TagNumber(2)
  set competitionRelayExtraState(CompetitionRelayExtraState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCompetitionRelayExtraState() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompetitionRelayExtraState() => clearField(2);
  @$pb.TagNumber(2)
  CompetitionRelayExtraState ensureCompetitionRelayExtraState() => $_ensure(1);

  @$pb.TagNumber(3)
  TrainingStartOnReleaseExtraState get trainingStartOnReleaseExtraState => $_getN(2);
  @$pb.TagNumber(3)
  set trainingStartOnReleaseExtraState(TrainingStartOnReleaseExtraState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTrainingStartOnReleaseExtraState() => $_has(2);
  @$pb.TagNumber(3)
  void clearTrainingStartOnReleaseExtraState() => clearField(3);
  @$pb.TagNumber(3)
  TrainingStartOnReleaseExtraState ensureTrainingStartOnReleaseExtraState() => $_ensure(2);
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
    $fixnum.Int64? currentTime,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    if (laneStates != null) {
      $result.laneStates.addAll(laneStates);
    }
    if (currentTime != null) {
      $result.currentTime = currentTime;
    }
    return $result;
  }
  RaceFullState._() : super();
  factory RaceFullState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RaceFullState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RaceFullState', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..e<RaceFullState_State>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: RaceFullState_State.IDLE, valueOf: RaceFullState_State.valueOf, enumValues: RaceFullState_State.values)
    ..pc<LaneFullState>(2, _omitFieldNames ? '' : 'laneStates', $pb.PbFieldType.PM, protoName: 'laneStates', subBuilder: LaneFullState.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'currentTime', $pb.PbFieldType.OU6, protoName: 'currentTime', defaultOrMaker: $fixnum.Int64.ZERO)
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

  @$pb.TagNumber(3)
  $fixnum.Int64 get currentTime => $_getI64(2);
  @$pb.TagNumber(3)
  set currentTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentTime() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
