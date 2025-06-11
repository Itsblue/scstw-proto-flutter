//
//  Generated code. Do not modify.
//  source: RaceSettings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ManualStartProcedureSettings extends $pb.GeneratedMessage {
  factory ManualStartProcedureSettings() => create();
  ManualStartProcedureSettings._() : super();
  factory ManualStartProcedureSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ManualStartProcedureSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ManualStartProcedureSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated.race_settings'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AutomatedStartProcedureSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated.race_settings'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartProcedureSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated.race_settings'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RaceSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw.deprecated.race_settings'), createEmptyInstance: create)
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
