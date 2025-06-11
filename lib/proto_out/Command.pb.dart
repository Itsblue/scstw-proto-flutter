//
//  Generated code. Do not modify.
//  source: Command.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RaceStartCommand extends $pb.GeneratedMessage {
  factory RaceStartCommand() => create();
  RaceStartCommand._() : super();
  factory RaceStartCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RaceStartCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RaceStartCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RaceStartCommand clone() => RaceStartCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RaceStartCommand copyWith(void Function(RaceStartCommand) updates) => super.copyWith((message) => updates(message as RaceStartCommand)) as RaceStartCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaceStartCommand create() => RaceStartCommand._();
  RaceStartCommand createEmptyInstance() => create();
  static $pb.PbList<RaceStartCommand> createRepeated() => $pb.PbList<RaceStartCommand>();
  @$core.pragma('dart2js:noInline')
  static RaceStartCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RaceStartCommand>(create);
  static RaceStartCommand? _defaultInstance;
}

class LaneSetDisabledCommand extends $pb.GeneratedMessage {
  factory LaneSetDisabledCommand({
    $core.int? laneNumber,
    $core.bool? disabled,
  }) {
    final $result = create();
    if (laneNumber != null) {
      $result.laneNumber = laneNumber;
    }
    if (disabled != null) {
      $result.disabled = disabled;
    }
    return $result;
  }
  LaneSetDisabledCommand._() : super();
  factory LaneSetDisabledCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LaneSetDisabledCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LaneSetDisabledCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'laneNumber', $pb.PbFieldType.OU3, protoName: 'laneNumber')
    ..aOB(2, _omitFieldNames ? '' : 'disabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LaneSetDisabledCommand clone() => LaneSetDisabledCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LaneSetDisabledCommand copyWith(void Function(LaneSetDisabledCommand) updates) => super.copyWith((message) => updates(message as LaneSetDisabledCommand)) as LaneSetDisabledCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaneSetDisabledCommand create() => LaneSetDisabledCommand._();
  LaneSetDisabledCommand createEmptyInstance() => create();
  static $pb.PbList<LaneSetDisabledCommand> createRepeated() => $pb.PbList<LaneSetDisabledCommand>();
  @$core.pragma('dart2js:noInline')
  static LaneSetDisabledCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LaneSetDisabledCommand>(create);
  static LaneSetDisabledCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get laneNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set laneNumber($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLaneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearLaneNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get disabled => $_getBF(1);
  @$pb.TagNumber(2)
  set disabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisabled() => clearField(2);
}

class LaneSetFallCommand extends $pb.GeneratedMessage {
  factory LaneSetFallCommand({
    $core.int? laneNumber,
  }) {
    final $result = create();
    if (laneNumber != null) {
      $result.laneNumber = laneNumber;
    }
    return $result;
  }
  LaneSetFallCommand._() : super();
  factory LaneSetFallCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LaneSetFallCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LaneSetFallCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'laneNumber', $pb.PbFieldType.OU3, protoName: 'laneNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LaneSetFallCommand clone() => LaneSetFallCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LaneSetFallCommand copyWith(void Function(LaneSetFallCommand) updates) => super.copyWith((message) => updates(message as LaneSetFallCommand)) as LaneSetFallCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaneSetFallCommand create() => LaneSetFallCommand._();
  LaneSetFallCommand createEmptyInstance() => create();
  static $pb.PbList<LaneSetFallCommand> createRepeated() => $pb.PbList<LaneSetFallCommand>();
  @$core.pragma('dart2js:noInline')
  static LaneSetFallCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LaneSetFallCommand>(create);
  static LaneSetFallCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get laneNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set laneNumber($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLaneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearLaneNumber() => clearField(1);
}

class RaceResetCommand extends $pb.GeneratedMessage {
  factory RaceResetCommand() => create();
  RaceResetCommand._() : super();
  factory RaceResetCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RaceResetCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RaceResetCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RaceResetCommand clone() => RaceResetCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RaceResetCommand copyWith(void Function(RaceResetCommand) updates) => super.copyWith((message) => updates(message as RaceResetCommand)) as RaceResetCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaceResetCommand create() => RaceResetCommand._();
  RaceResetCommand createEmptyInstance() => create();
  static $pb.PbList<RaceResetCommand> createRepeated() => $pb.PbList<RaceResetCommand>();
  @$core.pragma('dart2js:noInline')
  static RaceResetCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RaceResetCommand>(create);
  static RaceResetCommand? _defaultInstance;
}

class RebootCommand extends $pb.GeneratedMessage {
  factory RebootCommand() => create();
  RebootCommand._() : super();
  factory RebootCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RebootCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RebootCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RebootCommand clone() => RebootCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RebootCommand copyWith(void Function(RebootCommand) updates) => super.copyWith((message) => updates(message as RebootCommand)) as RebootCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RebootCommand create() => RebootCommand._();
  RebootCommand createEmptyInstance() => create();
  static $pb.PbList<RebootCommand> createRepeated() => $pb.PbList<RebootCommand>();
  @$core.pragma('dart2js:noInline')
  static RebootCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RebootCommand>(create);
  static RebootCommand? _defaultInstance;
}

class SayAtYourMarksCommand extends $pb.GeneratedMessage {
  factory SayAtYourMarksCommand() => create();
  SayAtYourMarksCommand._() : super();
  factory SayAtYourMarksCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SayAtYourMarksCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SayAtYourMarksCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SayAtYourMarksCommand clone() => SayAtYourMarksCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SayAtYourMarksCommand copyWith(void Function(SayAtYourMarksCommand) updates) => super.copyWith((message) => updates(message as SayAtYourMarksCommand)) as SayAtYourMarksCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SayAtYourMarksCommand create() => SayAtYourMarksCommand._();
  SayAtYourMarksCommand createEmptyInstance() => create();
  static $pb.PbList<SayAtYourMarksCommand> createRepeated() => $pb.PbList<SayAtYourMarksCommand>();
  @$core.pragma('dart2js:noInline')
  static SayAtYourMarksCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SayAtYourMarksCommand>(create);
  static SayAtYourMarksCommand? _defaultInstance;
}

/// sets the race from FINISHED to FINISHED_MUTED, only works in FINISHED state
class MuteFalseStartSoundCommand extends $pb.GeneratedMessage {
  factory MuteFalseStartSoundCommand() => create();
  MuteFalseStartSoundCommand._() : super();
  factory MuteFalseStartSoundCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MuteFalseStartSoundCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MuteFalseStartSoundCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MuteFalseStartSoundCommand clone() => MuteFalseStartSoundCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MuteFalseStartSoundCommand copyWith(void Function(MuteFalseStartSoundCommand) updates) => super.copyWith((message) => updates(message as MuteFalseStartSoundCommand)) as MuteFalseStartSoundCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MuteFalseStartSoundCommand create() => MuteFalseStartSoundCommand._();
  MuteFalseStartSoundCommand createEmptyInstance() => create();
  static $pb.PbList<MuteFalseStartSoundCommand> createRepeated() => $pb.PbList<MuteFalseStartSoundCommand>();
  @$core.pragma('dart2js:noInline')
  static MuteFalseStartSoundCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MuteFalseStartSoundCommand>(create);
  static MuteFalseStartSoundCommand? _defaultInstance;
}

enum Command_Command {
  start, 
  disable, 
  fall, 
  reset, 
  reboot, 
  sayAtYourMarks, 
  muteFalseStartSound, 
  notSet
}

class Command extends $pb.GeneratedMessage {
  factory Command({
    RaceStartCommand? start,
    LaneSetDisabledCommand? disable,
    LaneSetFallCommand? fall,
    RaceResetCommand? reset,
    RebootCommand? reboot,
    SayAtYourMarksCommand? sayAtYourMarks,
    MuteFalseStartSoundCommand? muteFalseStartSound,
  }) {
    final $result = create();
    if (start != null) {
      $result.start = start;
    }
    if (disable != null) {
      $result.disable = disable;
    }
    if (fall != null) {
      $result.fall = fall;
    }
    if (reset != null) {
      $result.reset = reset;
    }
    if (reboot != null) {
      $result.reboot = reboot;
    }
    if (sayAtYourMarks != null) {
      $result.sayAtYourMarks = sayAtYourMarks;
    }
    if (muteFalseStartSound != null) {
      $result.muteFalseStartSound = muteFalseStartSound;
    }
    return $result;
  }
  Command._() : super();
  factory Command.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Command.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Command_Command> _Command_CommandByTag = {
    1 : Command_Command.start,
    2 : Command_Command.disable,
    3 : Command_Command.fall,
    4 : Command_Command.reset,
    5 : Command_Command.reboot,
    6 : Command_Command.sayAtYourMarks,
    7 : Command_Command.muteFalseStartSound,
    0 : Command_Command.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Command', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
    ..aOM<RaceStartCommand>(1, _omitFieldNames ? '' : 'start', subBuilder: RaceStartCommand.create)
    ..aOM<LaneSetDisabledCommand>(2, _omitFieldNames ? '' : 'disable', subBuilder: LaneSetDisabledCommand.create)
    ..aOM<LaneSetFallCommand>(3, _omitFieldNames ? '' : 'fall', subBuilder: LaneSetFallCommand.create)
    ..aOM<RaceResetCommand>(4, _omitFieldNames ? '' : 'reset', subBuilder: RaceResetCommand.create)
    ..aOM<RebootCommand>(5, _omitFieldNames ? '' : 'reboot', subBuilder: RebootCommand.create)
    ..aOM<SayAtYourMarksCommand>(6, _omitFieldNames ? '' : 'sayAtYourMarks', protoName: 'sayAtYourMarks', subBuilder: SayAtYourMarksCommand.create)
    ..aOM<MuteFalseStartSoundCommand>(7, _omitFieldNames ? '' : 'muteFalseStartSound', protoName: 'muteFalseStartSound', subBuilder: MuteFalseStartSoundCommand.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Command clone() => Command()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Command copyWith(void Function(Command) updates) => super.copyWith((message) => updates(message as Command)) as Command;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Command create() => Command._();
  Command createEmptyInstance() => create();
  static $pb.PbList<Command> createRepeated() => $pb.PbList<Command>();
  @$core.pragma('dart2js:noInline')
  static Command getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Command>(create);
  static Command? _defaultInstance;

  Command_Command whichCommand() => _Command_CommandByTag[$_whichOneof(0)]!;
  void clearCommand() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RaceStartCommand get start => $_getN(0);
  @$pb.TagNumber(1)
  set start(RaceStartCommand v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);
  @$pb.TagNumber(1)
  RaceStartCommand ensureStart() => $_ensure(0);

  @$pb.TagNumber(2)
  LaneSetDisabledCommand get disable => $_getN(1);
  @$pb.TagNumber(2)
  set disable(LaneSetDisabledCommand v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisable() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisable() => clearField(2);
  @$pb.TagNumber(2)
  LaneSetDisabledCommand ensureDisable() => $_ensure(1);

  @$pb.TagNumber(3)
  LaneSetFallCommand get fall => $_getN(2);
  @$pb.TagNumber(3)
  set fall(LaneSetFallCommand v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFall() => $_has(2);
  @$pb.TagNumber(3)
  void clearFall() => clearField(3);
  @$pb.TagNumber(3)
  LaneSetFallCommand ensureFall() => $_ensure(2);

  @$pb.TagNumber(4)
  RaceResetCommand get reset => $_getN(3);
  @$pb.TagNumber(4)
  set reset(RaceResetCommand v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReset() => $_has(3);
  @$pb.TagNumber(4)
  void clearReset() => clearField(4);
  @$pb.TagNumber(4)
  RaceResetCommand ensureReset() => $_ensure(3);

  @$pb.TagNumber(5)
  RebootCommand get reboot => $_getN(4);
  @$pb.TagNumber(5)
  set reboot(RebootCommand v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasReboot() => $_has(4);
  @$pb.TagNumber(5)
  void clearReboot() => clearField(5);
  @$pb.TagNumber(5)
  RebootCommand ensureReboot() => $_ensure(4);

  @$pb.TagNumber(6)
  SayAtYourMarksCommand get sayAtYourMarks => $_getN(5);
  @$pb.TagNumber(6)
  set sayAtYourMarks(SayAtYourMarksCommand v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSayAtYourMarks() => $_has(5);
  @$pb.TagNumber(6)
  void clearSayAtYourMarks() => clearField(6);
  @$pb.TagNumber(6)
  SayAtYourMarksCommand ensureSayAtYourMarks() => $_ensure(5);

  @$pb.TagNumber(7)
  MuteFalseStartSoundCommand get muteFalseStartSound => $_getN(6);
  @$pb.TagNumber(7)
  set muteFalseStartSound(MuteFalseStartSoundCommand v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMuteFalseStartSound() => $_has(6);
  @$pb.TagNumber(7)
  void clearMuteFalseStartSound() => clearField(7);
  @$pb.TagNumber(7)
  MuteFalseStartSoundCommand ensureMuteFalseStartSound() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
