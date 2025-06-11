//
//  Generated code. Do not modify.
//  source: Settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'deprecated/RaceSettings.pb.dart' as $0;

class SoundSettings extends $pb.GeneratedMessage {
  factory SoundSettings({
    $core.int? volume,
    $core.bool? muteInternalSpeaker,
  }) {
    final $result = create();
    if (volume != null) {
      $result.volume = volume;
    }
    if (muteInternalSpeaker != null) {
      $result.muteInternalSpeaker = muteInternalSpeaker;
    }
    return $result;
  }
  SoundSettings._() : super();
  factory SoundSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SoundSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SoundSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'volume', $pb.PbFieldType.OU3)
    ..aOB(2, _omitFieldNames ? '' : 'muteInternalSpeaker', protoName: 'muteInternalSpeaker')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SoundSettings clone() => SoundSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SoundSettings copyWith(void Function(SoundSettings) updates) => super.copyWith((message) => updates(message as SoundSettings)) as SoundSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SoundSettings create() => SoundSettings._();
  SoundSettings createEmptyInstance() => create();
  static $pb.PbList<SoundSettings> createRepeated() => $pb.PbList<SoundSettings>();
  @$core.pragma('dart2js:noInline')
  static SoundSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SoundSettings>(create);
  static SoundSettings? _defaultInstance;

  /// Software volume control. Maximum value is 254, default value is 254.
  @$pb.TagNumber(1)
  $core.int get volume => $_getIZ(0);
  @$pb.TagNumber(1)
  set volume($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVolume() => $_has(0);
  @$pb.TagNumber(1)
  void clearVolume() => clearField(1);

  /// If set to true, the internal speaker will be muted. This is useful if
  /// the device is connected to an external speaker.
  /// Supported from version 1.1.0 onwards.
  @$pb.TagNumber(2)
  $core.bool get muteInternalSpeaker => $_getBF(1);
  @$pb.TagNumber(2)
  set muteInternalSpeaker($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMuteInternalSpeaker() => $_has(1);
  @$pb.TagNumber(2)
  void clearMuteInternalSpeaker() => clearField(2);
}

class SecuritySettings extends $pb.GeneratedMessage {
  factory SecuritySettings({
    $core.bool? disableBluetooth,
    $core.bool? disallowToSetDefaultViaBluetooth,
  }) {
    final $result = create();
    if (disableBluetooth != null) {
      $result.disableBluetooth = disableBluetooth;
    }
    if (disallowToSetDefaultViaBluetooth != null) {
      $result.disallowToSetDefaultViaBluetooth = disallowToSetDefaultViaBluetooth;
    }
    return $result;
  }
  SecuritySettings._() : super();
  factory SecuritySettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecuritySettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SecuritySettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'disableBluetooth', protoName: 'disableBluetooth')
    ..aOB(2, _omitFieldNames ? '' : 'disallowToSetDefaultViaBluetooth', protoName: 'disallowToSetDefaultViaBluetooth')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecuritySettings clone() => SecuritySettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecuritySettings copyWith(void Function(SecuritySettings) updates) => super.copyWith((message) => updates(message as SecuritySettings)) as SecuritySettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecuritySettings create() => SecuritySettings._();
  SecuritySettings createEmptyInstance() => create();
  static $pb.PbList<SecuritySettings> createRepeated() => $pb.PbList<SecuritySettings>();
  @$core.pragma('dart2js:noInline')
  static SecuritySettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecuritySettings>(create);
  static SecuritySettings? _defaultInstance;

  /// If set to true, the bluetooth interface won't be initialized on startup.
  /// This can only be changed over a web socket connection to avoid lockout.
  /// To be effective, the settings must be stored as default and device must be
  /// rebooted!
  @$pb.TagNumber(1)
  $core.bool get disableBluetooth => $_getBF(0);
  @$pb.TagNumber(1)
  set disableBluetooth($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisableBluetooth() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisableBluetooth() => clearField(1);

  /// If set to true, the default settings can't be set via bluetooth.
  /// This can only be changed over a web socket connection to avoid lockout.
  @$pb.TagNumber(2)
  $core.bool get disallowToSetDefaultViaBluetooth => $_getBF(1);
  @$pb.TagNumber(2)
  set disallowToSetDefaultViaBluetooth($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisallowToSetDefaultViaBluetooth() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisallowToSetDefaultViaBluetooth() => clearField(2);
}

/// = Competition classic race =
class ManualStartProcedure extends $pb.GeneratedMessage {
  factory ManualStartProcedure({
    $core.bool? sayReady,
  }) {
    final $result = create();
    if (sayReady != null) {
      $result.sayReady = sayReady;
    }
    return $result;
  }
  ManualStartProcedure._() : super();
  factory ManualStartProcedure.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ManualStartProcedure.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ManualStartProcedure', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sayReady', protoName: 'sayReady')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ManualStartProcedure clone() => ManualStartProcedure()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ManualStartProcedure copyWith(void Function(ManualStartProcedure) updates) => super.copyWith((message) => updates(message as ManualStartProcedure)) as ManualStartProcedure;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManualStartProcedure create() => ManualStartProcedure._();
  ManualStartProcedure createEmptyInstance() => create();
  static $pb.PbList<ManualStartProcedure> createRepeated() => $pb.PbList<ManualStartProcedure>();
  @$core.pragma('dart2js:noInline')
  static ManualStartProcedure getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ManualStartProcedure>(create);
  static ManualStartProcedure? _defaultInstance;

  /// If set to true, the stopwatch will play the "Ready" sound before starting
  /// when RaceStartCommand is sent.
  @$pb.TagNumber(1)
  $core.bool get sayReady => $_getBF(0);
  @$pb.TagNumber(1)
  set sayReady($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSayReady() => $_has(0);
  @$pb.TagNumber(1)
  void clearSayReady() => clearField(1);
}

class CompetitionClassicRaceMode extends $pb.GeneratedMessage {
  factory CompetitionClassicRaceMode({
    ManualStartProcedure? manualStartProcedure,
  }) {
    final $result = create();
    if (manualStartProcedure != null) {
      $result.manualStartProcedure = manualStartProcedure;
    }
    return $result;
  }
  CompetitionClassicRaceMode._() : super();
  factory CompetitionClassicRaceMode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompetitionClassicRaceMode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CompetitionClassicRaceMode', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOM<ManualStartProcedure>(1, _omitFieldNames ? '' : 'manualStartProcedure', protoName: 'manualStartProcedure', subBuilder: ManualStartProcedure.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompetitionClassicRaceMode clone() => CompetitionClassicRaceMode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompetitionClassicRaceMode copyWith(void Function(CompetitionClassicRaceMode) updates) => super.copyWith((message) => updates(message as CompetitionClassicRaceMode)) as CompetitionClassicRaceMode;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompetitionClassicRaceMode create() => CompetitionClassicRaceMode._();
  CompetitionClassicRaceMode createEmptyInstance() => create();
  static $pb.PbList<CompetitionClassicRaceMode> createRepeated() => $pb.PbList<CompetitionClassicRaceMode>();
  @$core.pragma('dart2js:noInline')
  static CompetitionClassicRaceMode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompetitionClassicRaceMode>(create);
  static CompetitionClassicRaceMode? _defaultInstance;

  @$pb.TagNumber(1)
  ManualStartProcedure get manualStartProcedure => $_getN(0);
  @$pb.TagNumber(1)
  set manualStartProcedure(ManualStartProcedure v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasManualStartProcedure() => $_has(0);
  @$pb.TagNumber(1)
  void clearManualStartProcedure() => clearField(1);
  @$pb.TagNumber(1)
  ManualStartProcedure ensureManualStartProcedure() => $_ensure(0);
}

/// = Training classic race =
class AutomatedStartProcedure extends $pb.GeneratedMessage {
  factory AutomatedStartProcedure({
    $core.bool? sayReady,
    $core.int? standstillDurationBeforeStart,
    $core.bool? autoReset,
  }) {
    final $result = create();
    if (sayReady != null) {
      $result.sayReady = sayReady;
    }
    if (standstillDurationBeforeStart != null) {
      $result.standstillDurationBeforeStart = standstillDurationBeforeStart;
    }
    if (autoReset != null) {
      $result.autoReset = autoReset;
    }
    return $result;
  }
  AutomatedStartProcedure._() : super();
  factory AutomatedStartProcedure.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AutomatedStartProcedure.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutomatedStartProcedure', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sayReady', protoName: 'sayReady')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'standstillDurationBeforeStart', $pb.PbFieldType.O3, protoName: 'standstillDurationBeforeStart')
    ..aOB(3, _omitFieldNames ? '' : 'autoReset', protoName: 'autoReset')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AutomatedStartProcedure clone() => AutomatedStartProcedure()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AutomatedStartProcedure copyWith(void Function(AutomatedStartProcedure) updates) => super.copyWith((message) => updates(message as AutomatedStartProcedure)) as AutomatedStartProcedure;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutomatedStartProcedure create() => AutomatedStartProcedure._();
  AutomatedStartProcedure createEmptyInstance() => create();
  static $pb.PbList<AutomatedStartProcedure> createRepeated() => $pb.PbList<AutomatedStartProcedure>();
  @$core.pragma('dart2js:noInline')
  static AutomatedStartProcedure getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AutomatedStartProcedure>(create);
  static AutomatedStartProcedure? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sayReady => $_getBF(0);
  @$pb.TagNumber(1)
  set sayReady($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSayReady() => $_has(0);
  @$pb.TagNumber(1)
  void clearSayReady() => clearField(1);

  /// The duration in milliseconds a startpad has to be pressed before the
  /// autostart is executed. Maximum value is 10000, default value is 3000.
  @$pb.TagNumber(2)
  $core.int get standstillDurationBeforeStart => $_getIZ(1);
  @$pb.TagNumber(2)
  set standstillDurationBeforeStart($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStandstillDurationBeforeStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearStandstillDurationBeforeStart() => clearField(2);

  /// If set to true, the autostart will be executed even if the race is not in
  /// IDLE_CLEAR_TO_START state.
  @$pb.TagNumber(3)
  $core.bool get autoReset => $_getBF(2);
  @$pb.TagNumber(3)
  set autoReset($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAutoReset() => $_has(2);
  @$pb.TagNumber(3)
  void clearAutoReset() => clearField(3);
}

enum StartProcedure_StartProcedure {
  manualStartProcedure, 
  automatedStartProcedure, 
  notSet
}

class StartProcedure extends $pb.GeneratedMessage {
  factory StartProcedure({
    ManualStartProcedure? manualStartProcedure,
    AutomatedStartProcedure? automatedStartProcedure,
  }) {
    final $result = create();
    if (manualStartProcedure != null) {
      $result.manualStartProcedure = manualStartProcedure;
    }
    if (automatedStartProcedure != null) {
      $result.automatedStartProcedure = automatedStartProcedure;
    }
    return $result;
  }
  StartProcedure._() : super();
  factory StartProcedure.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartProcedure.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StartProcedure_StartProcedure> _StartProcedure_StartProcedureByTag = {
    1 : StartProcedure_StartProcedure.manualStartProcedure,
    2 : StartProcedure_StartProcedure.automatedStartProcedure,
    0 : StartProcedure_StartProcedure.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartProcedure', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ManualStartProcedure>(1, _omitFieldNames ? '' : 'manualStartProcedure', protoName: 'manualStartProcedure', subBuilder: ManualStartProcedure.create)
    ..aOM<AutomatedStartProcedure>(2, _omitFieldNames ? '' : 'automatedStartProcedure', protoName: 'automatedStartProcedure', subBuilder: AutomatedStartProcedure.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartProcedure clone() => StartProcedure()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartProcedure copyWith(void Function(StartProcedure) updates) => super.copyWith((message) => updates(message as StartProcedure)) as StartProcedure;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartProcedure create() => StartProcedure._();
  StartProcedure createEmptyInstance() => create();
  static $pb.PbList<StartProcedure> createRepeated() => $pb.PbList<StartProcedure>();
  @$core.pragma('dart2js:noInline')
  static StartProcedure getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartProcedure>(create);
  static StartProcedure? _defaultInstance;

  StartProcedure_StartProcedure whichStartProcedure() => _StartProcedure_StartProcedureByTag[$_whichOneof(0)]!;
  void clearStartProcedure() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ManualStartProcedure get manualStartProcedure => $_getN(0);
  @$pb.TagNumber(1)
  set manualStartProcedure(ManualStartProcedure v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasManualStartProcedure() => $_has(0);
  @$pb.TagNumber(1)
  void clearManualStartProcedure() => clearField(1);
  @$pb.TagNumber(1)
  ManualStartProcedure ensureManualStartProcedure() => $_ensure(0);

  @$pb.TagNumber(2)
  AutomatedStartProcedure get automatedStartProcedure => $_getN(1);
  @$pb.TagNumber(2)
  set automatedStartProcedure(AutomatedStartProcedure v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAutomatedStartProcedure() => $_has(1);
  @$pb.TagNumber(2)
  void clearAutomatedStartProcedure() => clearField(2);
  @$pb.TagNumber(2)
  AutomatedStartProcedure ensureAutomatedStartProcedure() => $_ensure(1);
}

class LaneSettings extends $pb.GeneratedMessage {
  factory LaneSettings({
    $core.bool? disabled,
  }) {
    final $result = create();
    if (disabled != null) {
      $result.disabled = disabled;
    }
    return $result;
  }
  LaneSettings._() : super();
  factory LaneSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LaneSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LaneSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOB(2, _omitFieldNames ? '' : 'disabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LaneSettings clone() => LaneSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LaneSettings copyWith(void Function(LaneSettings) updates) => super.copyWith((message) => updates(message as LaneSettings)) as LaneSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaneSettings create() => LaneSettings._();
  LaneSettings createEmptyInstance() => create();
  static $pb.PbList<LaneSettings> createRepeated() => $pb.PbList<LaneSettings>();
  @$core.pragma('dart2js:noInline')
  static LaneSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LaneSettings>(create);
  static LaneSettings? _defaultInstance;

  /// If set to true, the lane won't be usable and won't show up in the UI.
  /// Can be used if there is only a single lane in the gym.
  /// At least one lane must be enabled. Otherwise, the first lane will be
  /// enabled!
  @$pb.TagNumber(2)
  $core.bool get disabled => $_getBF(0);
  @$pb.TagNumber(2)
  set disabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisabled() => $_has(0);
  @$pb.TagNumber(2)
  void clearDisabled() => clearField(2);
}

class AbortAfterFalseStart extends $pb.GeneratedMessage {
  factory AbortAfterFalseStart() => create();
  AbortAfterFalseStart._() : super();
  factory AbortAfterFalseStart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AbortAfterFalseStart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AbortAfterFalseStart', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContinueAfterFalseStart', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FalseStartBehaviour', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
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

class FalseStartSettings extends $pb.GeneratedMessage {
  factory FalseStartSettings({
    FalseStartBehaviour? behaviour,
    $core.int? soundDuration,
  }) {
    final $result = create();
    if (behaviour != null) {
      $result.behaviour = behaviour;
    }
    if (soundDuration != null) {
      $result.soundDuration = soundDuration;
    }
    return $result;
  }
  FalseStartSettings._() : super();
  factory FalseStartSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FalseStartSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FalseStartSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOM<FalseStartBehaviour>(1, _omitFieldNames ? '' : 'behaviour', subBuilder: FalseStartBehaviour.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'soundDuration', $pb.PbFieldType.OU3, protoName: 'soundDuration')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FalseStartSettings clone() => FalseStartSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FalseStartSettings copyWith(void Function(FalseStartSettings) updates) => super.copyWith((message) => updates(message as FalseStartSettings)) as FalseStartSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FalseStartSettings create() => FalseStartSettings._();
  FalseStartSettings createEmptyInstance() => create();
  static $pb.PbList<FalseStartSettings> createRepeated() => $pb.PbList<FalseStartSettings>();
  @$core.pragma('dart2js:noInline')
  static FalseStartSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FalseStartSettings>(create);
  static FalseStartSettings? _defaultInstance;

  @$pb.TagNumber(1)
  FalseStartBehaviour get behaviour => $_getN(0);
  @$pb.TagNumber(1)
  set behaviour(FalseStartBehaviour v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBehaviour() => $_has(0);
  @$pb.TagNumber(1)
  void clearBehaviour() => clearField(1);
  @$pb.TagNumber(1)
  FalseStartBehaviour ensureBehaviour() => $_ensure(0);

  /// The duration in milliseconds the false start sound will be played before it
  /// is automatically muted. Maximum value is 60000, default value is 2000.
  @$pb.TagNumber(2)
  $core.int get soundDuration => $_getIZ(1);
  @$pb.TagNumber(2)
  set soundDuration($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSoundDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearSoundDuration() => clearField(2);
}

class IndicatorSettings extends $pb.GeneratedMessage {
  factory IndicatorSettings({
    $core.int? brightness,
    $core.bool? turnOffWhenFalseStartSoundIsMuted,
    $core.bool? turnOffWhenIdle,
  }) {
    final $result = create();
    if (brightness != null) {
      $result.brightness = brightness;
    }
    if (turnOffWhenFalseStartSoundIsMuted != null) {
      $result.turnOffWhenFalseStartSoundIsMuted = turnOffWhenFalseStartSoundIsMuted;
    }
    if (turnOffWhenIdle != null) {
      $result.turnOffWhenIdle = turnOffWhenIdle;
    }
    return $result;
  }
  IndicatorSettings._() : super();
  factory IndicatorSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndicatorSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IndicatorSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'brightness', $pb.PbFieldType.OU3)
    ..aOB(2, _omitFieldNames ? '' : 'turnOffWhenFalseStartSoundIsMuted', protoName: 'turnOffWhenFalseStartSoundIsMuted')
    ..aOB(3, _omitFieldNames ? '' : 'turnOffWhenIdle', protoName: 'turnOffWhenIdle')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndicatorSettings clone() => IndicatorSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndicatorSettings copyWith(void Function(IndicatorSettings) updates) => super.copyWith((message) => updates(message as IndicatorSettings)) as IndicatorSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IndicatorSettings create() => IndicatorSettings._();
  IndicatorSettings createEmptyInstance() => create();
  static $pb.PbList<IndicatorSettings> createRepeated() => $pb.PbList<IndicatorSettings>();
  @$core.pragma('dart2js:noInline')
  static IndicatorSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndicatorSettings>(create);
  static IndicatorSettings? _defaultInstance;

  /// Software brightness control. Maximum value is 254, default value is 254.
  @$pb.TagNumber(1)
  $core.int get brightness => $_getIZ(0);
  @$pb.TagNumber(1)
  set brightness($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBrightness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBrightness() => clearField(1);

  /// If set to true, the indicator will stop blinkng as soon as the false start
  /// sound stops (when a false start exists and race is in FINISHED_MUTED
  /// state). Otherwise, it will continue blinking until the race is reset.
  @$pb.TagNumber(2)
  $core.bool get turnOffWhenFalseStartSoundIsMuted => $_getBF(1);
  @$pb.TagNumber(2)
  set turnOffWhenFalseStartSoundIsMuted($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTurnOffWhenFalseStartSoundIsMuted() => $_has(1);
  @$pb.TagNumber(2)
  void clearTurnOffWhenFalseStartSoundIsMuted() => clearField(2);

  /// If set to true, the indicator will turn off when the race is in IDLE state.
  /// Otherwise, it will be red.
  @$pb.TagNumber(3)
  $core.bool get turnOffWhenIdle => $_getBF(2);
  @$pb.TagNumber(3)
  set turnOffWhenIdle($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTurnOffWhenIdle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTurnOffWhenIdle() => clearField(3);
}

class TrainingClassicRaceMode extends $pb.GeneratedMessage {
  factory TrainingClassicRaceMode({
    StartProcedure? startProcedure,
    $core.Iterable<LaneSettings>? lanes,
    FalseStartSettings? falseStartSettings,
    IndicatorSettings? indicatorSettings,
  }) {
    final $result = create();
    if (startProcedure != null) {
      $result.startProcedure = startProcedure;
    }
    if (lanes != null) {
      $result.lanes.addAll(lanes);
    }
    if (falseStartSettings != null) {
      $result.falseStartSettings = falseStartSettings;
    }
    if (indicatorSettings != null) {
      $result.indicatorSettings = indicatorSettings;
    }
    return $result;
  }
  TrainingClassicRaceMode._() : super();
  factory TrainingClassicRaceMode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainingClassicRaceMode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainingClassicRaceMode', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOM<StartProcedure>(1, _omitFieldNames ? '' : 'startProcedure', protoName: 'startProcedure', subBuilder: StartProcedure.create)
    ..pc<LaneSettings>(2, _omitFieldNames ? '' : 'lanes', $pb.PbFieldType.PM, subBuilder: LaneSettings.create)
    ..aOM<FalseStartSettings>(3, _omitFieldNames ? '' : 'falseStartSettings', protoName: 'falseStartSettings', subBuilder: FalseStartSettings.create)
    ..aOM<IndicatorSettings>(4, _omitFieldNames ? '' : 'indicatorSettings', protoName: 'indicatorSettings', subBuilder: IndicatorSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainingClassicRaceMode clone() => TrainingClassicRaceMode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainingClassicRaceMode copyWith(void Function(TrainingClassicRaceMode) updates) => super.copyWith((message) => updates(message as TrainingClassicRaceMode)) as TrainingClassicRaceMode;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingClassicRaceMode create() => TrainingClassicRaceMode._();
  TrainingClassicRaceMode createEmptyInstance() => create();
  static $pb.PbList<TrainingClassicRaceMode> createRepeated() => $pb.PbList<TrainingClassicRaceMode>();
  @$core.pragma('dart2js:noInline')
  static TrainingClassicRaceMode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainingClassicRaceMode>(create);
  static TrainingClassicRaceMode? _defaultInstance;

  @$pb.TagNumber(1)
  StartProcedure get startProcedure => $_getN(0);
  @$pb.TagNumber(1)
  set startProcedure(StartProcedure v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartProcedure() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartProcedure() => clearField(1);
  @$pb.TagNumber(1)
  StartProcedure ensureStartProcedure() => $_ensure(0);

  /// The number of lanes cannot be changed by the client.
  @$pb.TagNumber(2)
  $core.List<LaneSettings> get lanes => $_getList(1);

  @$pb.TagNumber(3)
  FalseStartSettings get falseStartSettings => $_getN(2);
  @$pb.TagNumber(3)
  set falseStartSettings(FalseStartSettings v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFalseStartSettings() => $_has(2);
  @$pb.TagNumber(3)
  void clearFalseStartSettings() => clearField(3);
  @$pb.TagNumber(3)
  FalseStartSettings ensureFalseStartSettings() => $_ensure(2);

  @$pb.TagNumber(4)
  IndicatorSettings get indicatorSettings => $_getN(3);
  @$pb.TagNumber(4)
  set indicatorSettings(IndicatorSettings v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasIndicatorSettings() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndicatorSettings() => clearField(4);
  @$pb.TagNumber(4)
  IndicatorSettings ensureIndicatorSettings() => $_ensure(3);
}

enum StopwatchSettings_Mode {
  competitionClassicRaceMode, 
  trainingClassicRaceMode, 
  notSet
}

class StopwatchSettings extends $pb.GeneratedMessage {
  factory StopwatchSettings({
    CompetitionClassicRaceMode? competitionClassicRaceMode,
    TrainingClassicRaceMode? trainingClassicRaceMode,
  }) {
    final $result = create();
    if (competitionClassicRaceMode != null) {
      $result.competitionClassicRaceMode = competitionClassicRaceMode;
    }
    if (trainingClassicRaceMode != null) {
      $result.trainingClassicRaceMode = trainingClassicRaceMode;
    }
    return $result;
  }
  StopwatchSettings._() : super();
  factory StopwatchSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopwatchSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StopwatchSettings_Mode> _StopwatchSettings_ModeByTag = {
    1 : StopwatchSettings_Mode.competitionClassicRaceMode,
    2 : StopwatchSettings_Mode.trainingClassicRaceMode,
    0 : StopwatchSettings_Mode.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopwatchSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<CompetitionClassicRaceMode>(1, _omitFieldNames ? '' : 'competitionClassicRaceMode', protoName: 'competitionClassicRaceMode', subBuilder: CompetitionClassicRaceMode.create)
    ..aOM<TrainingClassicRaceMode>(2, _omitFieldNames ? '' : 'trainingClassicRaceMode', protoName: 'trainingClassicRaceMode', subBuilder: TrainingClassicRaceMode.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopwatchSettings clone() => StopwatchSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopwatchSettings copyWith(void Function(StopwatchSettings) updates) => super.copyWith((message) => updates(message as StopwatchSettings)) as StopwatchSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopwatchSettings create() => StopwatchSettings._();
  StopwatchSettings createEmptyInstance() => create();
  static $pb.PbList<StopwatchSettings> createRepeated() => $pb.PbList<StopwatchSettings>();
  @$core.pragma('dart2js:noInline')
  static StopwatchSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopwatchSettings>(create);
  static StopwatchSettings? _defaultInstance;

  StopwatchSettings_Mode whichMode() => _StopwatchSettings_ModeByTag[$_whichOneof(0)]!;
  void clearMode() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CompetitionClassicRaceMode get competitionClassicRaceMode => $_getN(0);
  @$pb.TagNumber(1)
  set competitionClassicRaceMode(CompetitionClassicRaceMode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCompetitionClassicRaceMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompetitionClassicRaceMode() => clearField(1);
  @$pb.TagNumber(1)
  CompetitionClassicRaceMode ensureCompetitionClassicRaceMode() => $_ensure(0);

  @$pb.TagNumber(2)
  TrainingClassicRaceMode get trainingClassicRaceMode => $_getN(1);
  @$pb.TagNumber(2)
  set trainingClassicRaceMode(TrainingClassicRaceMode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTrainingClassicRaceMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrainingClassicRaceMode() => clearField(2);
  @$pb.TagNumber(2)
  TrainingClassicRaceMode ensureTrainingClassicRaceMode() => $_ensure(1);
}

class Settings extends $pb.GeneratedMessage {
  factory Settings({
    $core.bool? default_1,
  @$core.Deprecated('This field is deprecated.')
    $0.RaceSettings? race,
    SoundSettings? sound,
    StopwatchSettings? stopwatchSettings,
    SecuritySettings? securitySettings,
  }) {
    final $result = create();
    if (default_1 != null) {
      $result.default_1 = default_1;
    }
    if (race != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.race = race;
    }
    if (sound != null) {
      $result.sound = sound;
    }
    if (stopwatchSettings != null) {
      $result.stopwatchSettings = stopwatchSettings;
    }
    if (securitySettings != null) {
      $result.securitySettings = securitySettings;
    }
    return $result;
  }
  Settings._() : super();
  factory Settings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Settings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Settings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'default')
    ..aOM<$0.RaceSettings>(2, _omitFieldNames ? '' : 'race', subBuilder: $0.RaceSettings.create)
    ..aOM<SoundSettings>(3, _omitFieldNames ? '' : 'sound', subBuilder: SoundSettings.create)
    ..aOM<StopwatchSettings>(4, _omitFieldNames ? '' : 'stopwatchSettings', protoName: 'stopwatchSettings', subBuilder: StopwatchSettings.create)
    ..aOM<SecuritySettings>(5, _omitFieldNames ? '' : 'securitySettings', protoName: 'securitySettings', subBuilder: SecuritySettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Settings clone() => Settings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Settings copyWith(void Function(Settings) updates) => super.copyWith((message) => updates(message as Settings)) as Settings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Settings create() => Settings._();
  Settings createEmptyInstance() => create();
  static $pb.PbList<Settings> createRepeated() => $pb.PbList<Settings>();
  @$core.pragma('dart2js:noInline')
  static Settings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Settings>(create);
  static Settings? _defaultInstance;

  /// if the settings are stored as default in the flash memory.
  @$pb.TagNumber(1)
  $core.bool get default_1 => $_getBF(0);
  @$pb.TagNumber(1)
  set default_1($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDefault_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearDefault_1() => clearField(1);

  /// DEPRECATED, just kept for compatibility with version <= 1.0.0, use
  /// StopwatchSettings instead! Will be ignored when StopwatchSettings is set
  /// and converted to StopwatchSettings otherwise. For backwards compatibility,
  /// this is always set when reading the settings.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $0.RaceSettings get race => $_getN(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set race($0.RaceSettings v) { setField(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasRace() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearRace() => clearField(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $0.RaceSettings ensureRace() => $_ensure(1);

  @$pb.TagNumber(3)
  SoundSettings get sound => $_getN(2);
  @$pb.TagNumber(3)
  set sound(SoundSettings v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSound() => $_has(2);
  @$pb.TagNumber(3)
  void clearSound() => clearField(3);
  @$pb.TagNumber(3)
  SoundSettings ensureSound() => $_ensure(2);

  /// Supported from version 1.1.0 onwards.
  @$pb.TagNumber(4)
  StopwatchSettings get stopwatchSettings => $_getN(3);
  @$pb.TagNumber(4)
  set stopwatchSettings(StopwatchSettings v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStopwatchSettings() => $_has(3);
  @$pb.TagNumber(4)
  void clearStopwatchSettings() => clearField(4);
  @$pb.TagNumber(4)
  StopwatchSettings ensureStopwatchSettings() => $_ensure(3);

  @$pb.TagNumber(5)
  SecuritySettings get securitySettings => $_getN(4);
  @$pb.TagNumber(5)
  set securitySettings(SecuritySettings v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSecuritySettings() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecuritySettings() => clearField(5);
  @$pb.TagNumber(5)
  SecuritySettings ensureSecuritySettings() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
