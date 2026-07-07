//
//  Generated code. Do not modify.
//  source: SocketMessage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Command.pb.dart' as $2;
import 'RaceState.pb.dart' as $1;
import 'Settings.pb.dart' as $3;
import 'SystemInfo.pb.dart' as $4;

enum SocketMessage_Message {
  raceFullState, 
  command, 
  settings, 
  systemInfo, 
  notSet
}

class SocketMessage extends $pb.GeneratedMessage {
  factory SocketMessage({
    $1.RaceFullState? raceFullState,
    $2.Command? command,
    $3.Settings? settings,
    $4.SystemInfo? systemInfo,
  }) {
    final $result = create();
    if (raceFullState != null) {
      $result.raceFullState = raceFullState;
    }
    if (command != null) {
      $result.command = command;
    }
    if (settings != null) {
      $result.settings = settings;
    }
    if (systemInfo != null) {
      $result.systemInfo = systemInfo;
    }
    return $result;
  }
  SocketMessage._() : super();
  factory SocketMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SocketMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SocketMessage_Message> _SocketMessage_MessageByTag = {
    1 : SocketMessage_Message.raceFullState,
    2 : SocketMessage_Message.command,
    3 : SocketMessage_Message.settings,
    4 : SocketMessage_Message.systemInfo,
    0 : SocketMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SocketMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'ScStw'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<$1.RaceFullState>(1, _omitFieldNames ? '' : 'raceFullState', protoName: 'raceFullState', subBuilder: $1.RaceFullState.create)
    ..aOM<$2.Command>(2, _omitFieldNames ? '' : 'command', subBuilder: $2.Command.create)
    ..aOM<$3.Settings>(3, _omitFieldNames ? '' : 'settings', subBuilder: $3.Settings.create)
    ..aOM<$4.SystemInfo>(4, _omitFieldNames ? '' : 'systemInfo', protoName: 'systemInfo', subBuilder: $4.SystemInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SocketMessage clone() => SocketMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SocketMessage copyWith(void Function(SocketMessage) updates) => super.copyWith((message) => updates(message as SocketMessage)) as SocketMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SocketMessage create() => SocketMessage._();
  SocketMessage createEmptyInstance() => create();
  static $pb.PbList<SocketMessage> createRepeated() => $pb.PbList<SocketMessage>();
  @$core.pragma('dart2js:noInline')
  static SocketMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SocketMessage>(create);
  static SocketMessage? _defaultInstance;

  SocketMessage_Message whichMessage() => _SocketMessage_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.RaceFullState get raceFullState => $_getN(0);
  @$pb.TagNumber(1)
  set raceFullState($1.RaceFullState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRaceFullState() => $_has(0);
  @$pb.TagNumber(1)
  void clearRaceFullState() => clearField(1);
  @$pb.TagNumber(1)
  $1.RaceFullState ensureRaceFullState() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Command get command => $_getN(1);
  @$pb.TagNumber(2)
  set command($2.Command v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCommand() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommand() => clearField(2);
  @$pb.TagNumber(2)
  $2.Command ensureCommand() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.Settings get settings => $_getN(2);
  @$pb.TagNumber(3)
  set settings($3.Settings v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSettings() => $_has(2);
  @$pb.TagNumber(3)
  void clearSettings() => clearField(3);
  @$pb.TagNumber(3)
  $3.Settings ensureSettings() => $_ensure(2);

  @$pb.TagNumber(4)
  $4.SystemInfo get systemInfo => $_getN(3);
  @$pb.TagNumber(4)
  set systemInfo($4.SystemInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSystemInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearSystemInfo() => clearField(4);
  @$pb.TagNumber(4)
  $4.SystemInfo ensureSystemInfo() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
