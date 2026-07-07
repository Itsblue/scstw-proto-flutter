//
//  Generated code. Do not modify.
//  source: deprecated/Settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// deprecated in v1.1.0
class ManualStartProcedureSettings extends $pb.GeneratedMessage {
  factory ManualStartProcedureSettings() => create();
  ManualStartProcedureSettings._() : super();
  factory ManualStartProcedureSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ManualStartProcedureSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ManualStartProcedureSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ManualStartProcedureSettings clone() => ManualStartProcedureSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ManualStartProcedureSettings copyWith(void Function(ManualStartProcedureSettings) updates) => super.copyWith((message) => updates(message as ManualStartProcedureSettings)) as ManualStartProcedureSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManualStartProcedureSettings create() => ManualStartProcedureSettings._();
  ManualStartProcedureSettings createEmptyInstance() => create();
  static $pb.PbList<ManualStartProcedureSettings> createRepeated() => $pb.PbList<ManualStartProcedureSettings>();
  @$core.pragma('dart2js:noInline')
  static ManualStartProcedureSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ManualStartProcedureSettings>(create);
  static ManualStartProcedureSettings? _defaultInstance;
}

/// deprecated in v1.1.0
class AutomatedStartProcedureSettings extends $pb.GeneratedMessage {
  factory AutomatedStartProcedureSettings({
    $core.bool? sayReady,
    $core.int? standstillDurationBeforeReady,
  }) {
    final $result = create();
    if (sayReady != null) {
      $result.sayReady = sayReady;
    }
    if (standstillDurationBeforeReady != null) {
      $result.standstillDurationBeforeReady = standstillDurationBeforeReady;
    }
    return $result;
  }
  AutomatedStartProcedureSettings._() : super();
  factory AutomatedStartProcedureSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutomatedStartProcedureSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutomatedStartProcedureSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sayReady', protoName: 'sayReady')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'standstillDurationBeforeReady', $pb.PbFieldType.O3, protoName: 'standstillDurationBeforeReady')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutomatedStartProcedureSettings clone() => AutomatedStartProcedureSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutomatedStartProcedureSettings copyWith(void Function(AutomatedStartProcedureSettings) updates) => super.copyWith((message) => updates(message as AutomatedStartProcedureSettings)) as AutomatedStartProcedureSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutomatedStartProcedureSettings create() => AutomatedStartProcedureSettings._();
  AutomatedStartProcedureSettings createEmptyInstance() => create();
  static $pb.PbList<AutomatedStartProcedureSettings> createRepeated() => $pb.PbList<AutomatedStartProcedureSettings>();
  @$core.pragma('dart2js:noInline')
  static AutomatedStartProcedureSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutomatedStartProcedureSettings>(create);
  static AutomatedStartProcedureSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sayReady => $_getBF(0);
  @$pb.TagNumber(1)
  set sayReady($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSayReady() => $_has(0);
  @$pb.TagNumber(1)
  void clearSayReady() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get standstillDurationBeforeReady => $_getIZ(1);
  @$pb.TagNumber(2)
  set standstillDurationBeforeReady($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStandstillDurationBeforeReady() => $_has(1);
  @$pb.TagNumber(2)
  void clearStandstillDurationBeforeReady() => clearField(2);
}

enum StartProcedureSettings_StartProcedureSettings {
  manualStartProcedureSettings, 
  automatedStartProcedureSettings, 
  notSet
}

/// deprecated in v1.1.0
class StartProcedureSettings extends $pb.GeneratedMessage {
  factory StartProcedureSettings({
    ManualStartProcedureSettings? manualStartProcedureSettings,
    AutomatedStartProcedureSettings? automatedStartProcedureSettings,
  }) {
    final $result = create();
    if (manualStartProcedureSettings != null) {
      $result.manualStartProcedureSettings = manualStartProcedureSettings;
    }
    if (automatedStartProcedureSettings != null) {
      $result.automatedStartProcedureSettings = automatedStartProcedureSettings;
    }
    return $result;
  }
  StartProcedureSettings._() : super();
  factory StartProcedureSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartProcedureSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StartProcedureSettings_StartProcedureSettings> _StartProcedureSettings_StartProcedureSettingsByTag = {
    1 : StartProcedureSettings_StartProcedureSettings.manualStartProcedureSettings,
    2 : StartProcedureSettings_StartProcedureSettings.automatedStartProcedureSettings,
    0 : StartProcedureSettings_StartProcedureSettings.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartProcedureSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ManualStartProcedureSettings>(1, _omitFieldNames ? '' : 'manualStartProcedureSettings', protoName: 'manualStartProcedureSettings', subBuilder: ManualStartProcedureSettings.create)
    ..aOM<AutomatedStartProcedureSettings>(2, _omitFieldNames ? '' : 'automatedStartProcedureSettings', protoName: 'automatedStartProcedureSettings', subBuilder: AutomatedStartProcedureSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartProcedureSettings clone() => StartProcedureSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartProcedureSettings copyWith(void Function(StartProcedureSettings) updates) => super.copyWith((message) => updates(message as StartProcedureSettings)) as StartProcedureSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartProcedureSettings create() => StartProcedureSettings._();
  StartProcedureSettings createEmptyInstance() => create();
  static $pb.PbList<StartProcedureSettings> createRepeated() => $pb.PbList<StartProcedureSettings>();
  @$core.pragma('dart2js:noInline')
  static StartProcedureSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartProcedureSettings>(create);
  static StartProcedureSettings? _defaultInstance;

  StartProcedureSettings_StartProcedureSettings whichStartProcedureSettings() => _StartProcedureSettings_StartProcedureSettingsByTag[$_whichOneof(0)]!;
  void clearStartProcedureSettings() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ManualStartProcedureSettings get manualStartProcedureSettings => $_getN(0);
  @$pb.TagNumber(1)
  set manualStartProcedureSettings(ManualStartProcedureSettings v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasManualStartProcedureSettings() => $_has(0);
  @$pb.TagNumber(1)
  void clearManualStartProcedureSettings() => clearField(1);
  @$pb.TagNumber(1)
  ManualStartProcedureSettings ensureManualStartProcedureSettings() => $_ensure(0);

  @$pb.TagNumber(2)
  AutomatedStartProcedureSettings get automatedStartProcedureSettings => $_getN(1);
  @$pb.TagNumber(2)
  set automatedStartProcedureSettings(AutomatedStartProcedureSettings v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAutomatedStartProcedureSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearAutomatedStartProcedureSettings() => clearField(2);
  @$pb.TagNumber(2)
  AutomatedStartProcedureSettings ensureAutomatedStartProcedureSettings() => $_ensure(1);
}

/// deprecated in v1.1.0
class RaceSettings extends $pb.GeneratedMessage {
  factory RaceSettings({
    StartProcedureSettings? startProcedure,
  }) {
    final $result = create();
    if (startProcedure != null) {
      $result.startProcedure = startProcedure;
    }
    return $result;
  }
  RaceSettings._() : super();
  factory RaceSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RaceSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RaceSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..aOM<StartProcedureSettings>(1, _omitFieldNames ? '' : 'startProcedure', protoName: 'startProcedure', subBuilder: StartProcedureSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RaceSettings clone() => RaceSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RaceSettings copyWith(void Function(RaceSettings) updates) => super.copyWith((message) => updates(message as RaceSettings)) as RaceSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaceSettings create() => RaceSettings._();
  RaceSettings createEmptyInstance() => create();
  static $pb.PbList<RaceSettings> createRepeated() => $pb.PbList<RaceSettings>();
  @$core.pragma('dart2js:noInline')
  static RaceSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RaceSettings>(create);
  static RaceSettings? _defaultInstance;

  @$pb.TagNumber(1)
  StartProcedureSettings get startProcedure => $_getN(0);
  @$pb.TagNumber(1)
  set startProcedure(StartProcedureSettings v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartProcedure() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartProcedure() => clearField(1);
  @$pb.TagNumber(1)
  StartProcedureSettings ensureStartProcedure() => $_ensure(0);
}

/// deprecated in v1.3.0
class AbortAfterFalseStart extends $pb.GeneratedMessage {
  factory AbortAfterFalseStart() => create();
  AbortAfterFalseStart._() : super();
  factory AbortAfterFalseStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AbortAfterFalseStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AbortAfterFalseStart', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AbortAfterFalseStart clone() => AbortAfterFalseStart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AbortAfterFalseStart copyWith(void Function(AbortAfterFalseStart) updates) => super.copyWith((message) => updates(message as AbortAfterFalseStart)) as AbortAfterFalseStart;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AbortAfterFalseStart create() => AbortAfterFalseStart._();
  AbortAfterFalseStart createEmptyInstance() => create();
  static $pb.PbList<AbortAfterFalseStart> createRepeated() => $pb.PbList<AbortAfterFalseStart>();
  @$core.pragma('dart2js:noInline')
  static AbortAfterFalseStart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AbortAfterFalseStart>(create);
  static AbortAfterFalseStart? _defaultInstance;
}

/// deprecated in v1.3.0
class ContinueAfterFalseStart extends $pb.GeneratedMessage {
  factory ContinueAfterFalseStart({
    $core.int? assumedReactionTime,
    $core.bool? continueStartSequenceAfterFalseStart,
  }) {
    final $result = create();
    if (assumedReactionTime != null) {
      $result.assumedReactionTime = assumedReactionTime;
    }
    if (continueStartSequenceAfterFalseStart != null) {
      $result.continueStartSequenceAfterFalseStart = continueStartSequenceAfterFalseStart;
    }
    return $result;
  }
  ContinueAfterFalseStart._() : super();
  factory ContinueAfterFalseStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContinueAfterFalseStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContinueAfterFalseStart', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'assumedReactionTime', $pb.PbFieldType.OU3, protoName: 'assumedReactionTime')
    ..aOB(2, _omitFieldNames ? '' : 'continueStartSequenceAfterFalseStart', protoName: 'continueStartSequenceAfterFalseStart')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContinueAfterFalseStart clone() => ContinueAfterFalseStart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContinueAfterFalseStart copyWith(void Function(ContinueAfterFalseStart) updates) => super.copyWith((message) => updates(message as ContinueAfterFalseStart)) as ContinueAfterFalseStart;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContinueAfterFalseStart create() => ContinueAfterFalseStart._();
  ContinueAfterFalseStart createEmptyInstance() => create();
  static $pb.PbList<ContinueAfterFalseStart> createRepeated() => $pb.PbList<ContinueAfterFalseStart>();
  @$core.pragma('dart2js:noInline')
  static ContinueAfterFalseStart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContinueAfterFalseStart>(create);
  static ContinueAfterFalseStart? _defaultInstance;

  /// This time will be assumed as the reaction time when calculating the final
  /// time. Maximum value is 10000, default value is 100.
  @$pb.TagNumber(1)
  $core.int get assumedReactionTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set assumedReactionTime($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssumedReactionTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssumedReactionTime() => clearField(1);

  /// If set to true, there will be no false start tone and the normal tone will
  /// continue. Also, the indicator of wildcard lanes will continue as normal.
  @$pb.TagNumber(2)
  $core.bool get continueStartSequenceAfterFalseStart => $_getBF(1);
  @$pb.TagNumber(2)
  set continueStartSequenceAfterFalseStart($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContinueStartSequenceAfterFalseStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearContinueStartSequenceAfterFalseStart() => clearField(2);
}

enum FalseStartBehaviour_Behaviour {
  abortAfterFalseStart, 
  continueAfterFalseStart, 
  notSet
}

/// deprecated in v1.3.0
class FalseStartBehaviour extends $pb.GeneratedMessage {
  factory FalseStartBehaviour({
    AbortAfterFalseStart? abortAfterFalseStart,
    ContinueAfterFalseStart? continueAfterFalseStart,
  }) {
    final $result = create();
    if (abortAfterFalseStart != null) {
      $result.abortAfterFalseStart = abortAfterFalseStart;
    }
    if (continueAfterFalseStart != null) {
      $result.continueAfterFalseStart = continueAfterFalseStart;
    }
    return $result;
  }
  FalseStartBehaviour._() : super();
  factory FalseStartBehaviour.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FalseStartBehaviour.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FalseStartBehaviour_Behaviour> _FalseStartBehaviour_BehaviourByTag = {
    1 : FalseStartBehaviour_Behaviour.abortAfterFalseStart,
    2 : FalseStartBehaviour_Behaviour.continueAfterFalseStart,
    0 : FalseStartBehaviour_Behaviour.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FalseStartBehaviour', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AbortAfterFalseStart>(1, _omitFieldNames ? '' : 'abortAfterFalseStart', protoName: 'abortAfterFalseStart', subBuilder: AbortAfterFalseStart.create)
    ..aOM<ContinueAfterFalseStart>(2, _omitFieldNames ? '' : 'continueAfterFalseStart', protoName: 'continueAfterFalseStart', subBuilder: ContinueAfterFalseStart.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FalseStartBehaviour clone() => FalseStartBehaviour()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FalseStartBehaviour copyWith(void Function(FalseStartBehaviour) updates) => super.copyWith((message) => updates(message as FalseStartBehaviour)) as FalseStartBehaviour;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FalseStartBehaviour create() => FalseStartBehaviour._();
  FalseStartBehaviour createEmptyInstance() => create();
  static $pb.PbList<FalseStartBehaviour> createRepeated() => $pb.PbList<FalseStartBehaviour>();
  @$core.pragma('dart2js:noInline')
  static FalseStartBehaviour getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FalseStartBehaviour>(create);
  static FalseStartBehaviour? _defaultInstance;

  FalseStartBehaviour_Behaviour whichBehaviour() => _FalseStartBehaviour_BehaviourByTag[$_whichOneof(0)]!;
  void clearBehaviour() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AbortAfterFalseStart get abortAfterFalseStart => $_getN(0);
  @$pb.TagNumber(1)
  set abortAfterFalseStart(AbortAfterFalseStart v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAbortAfterFalseStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearAbortAfterFalseStart() => clearField(1);
  @$pb.TagNumber(1)
  AbortAfterFalseStart ensureAbortAfterFalseStart() => $_ensure(0);

  @$pb.TagNumber(2)
  ContinueAfterFalseStart get continueAfterFalseStart => $_getN(1);
  @$pb.TagNumber(2)
  set continueAfterFalseStart(ContinueAfterFalseStart v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContinueAfterFalseStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearContinueAfterFalseStart() => clearField(2);
  @$pb.TagNumber(2)
  ContinueAfterFalseStart ensureContinueAfterFalseStart() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
