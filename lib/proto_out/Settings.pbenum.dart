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

class CompetitionRound extends $pb.ProtobufEnum {
  static const CompetitionRound UNSPECIFIED = CompetitionRound._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const CompetitionRound QUALIFICATION = CompetitionRound._(1, _omitEnumNames ? '' : 'QUALIFICATION');
  static const CompetitionRound FINAL = CompetitionRound._(2, _omitEnumNames ? '' : 'FINAL');

  static const $core.List<CompetitionRound> values = <CompetitionRound> [
    UNSPECIFIED,
    QUALIFICATION,
    FINAL,
  ];

  static final $core.Map<$core.int, CompetitionRound> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CompetitionRound? valueOf($core.int value) => _byValue[value];

  const CompetitionRound._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
