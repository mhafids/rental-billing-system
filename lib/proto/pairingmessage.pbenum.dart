// This is a generated file - do not edit.
//
// Generated from pairingmessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoleType extends $pb.ProtobufEnum {
  static const RoleType ROLE_TYPE_UNKNOWN =
      RoleType._(0, _omitEnumNames ? '' : 'ROLE_TYPE_UNKNOWN');
  static const RoleType ROLE_TYPE_INPUT =
      RoleType._(1, _omitEnumNames ? '' : 'ROLE_TYPE_INPUT');
  static const RoleType ROLE_TYPE_OUTPUT =
      RoleType._(2, _omitEnumNames ? '' : 'ROLE_TYPE_OUTPUT');
  static const RoleType UNRECOGNIZED =
      RoleType._(-1, _omitEnumNames ? '' : 'UNRECOGNIZED');

  static const $core.List<RoleType> values = <RoleType>[
    ROLE_TYPE_UNKNOWN,
    ROLE_TYPE_INPUT,
    ROLE_TYPE_OUTPUT,
    UNRECOGNIZED,
  ];

  static final $core.Map<$core.int, RoleType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoleType? valueOf($core.int value) => _byValue[value];

  const RoleType._(super.value, super.name);
}

class PairingEncoding_EncodingType extends $pb.ProtobufEnum {
  static const PairingEncoding_EncodingType ENCODING_TYPE_UNKNOWN =
      PairingEncoding_EncodingType._(
          0, _omitEnumNames ? '' : 'ENCODING_TYPE_UNKNOWN');
  static const PairingEncoding_EncodingType ENCODING_TYPE_ALPHANUMERIC =
      PairingEncoding_EncodingType._(
          1, _omitEnumNames ? '' : 'ENCODING_TYPE_ALPHANUMERIC');
  static const PairingEncoding_EncodingType ENCODING_TYPE_NUMERIC =
      PairingEncoding_EncodingType._(
          2, _omitEnumNames ? '' : 'ENCODING_TYPE_NUMERIC');
  static const PairingEncoding_EncodingType ENCODING_TYPE_HEXADECIMAL =
      PairingEncoding_EncodingType._(
          3, _omitEnumNames ? '' : 'ENCODING_TYPE_HEXADECIMAL');
  static const PairingEncoding_EncodingType ENCODING_TYPE_QRCODE =
      PairingEncoding_EncodingType._(
          4, _omitEnumNames ? '' : 'ENCODING_TYPE_QRCODE');
  static const PairingEncoding_EncodingType UNRECOGNIZED =
      PairingEncoding_EncodingType._(-1, _omitEnumNames ? '' : 'UNRECOGNIZED');

  static const $core.List<PairingEncoding_EncodingType> values =
      <PairingEncoding_EncodingType>[
    ENCODING_TYPE_UNKNOWN,
    ENCODING_TYPE_ALPHANUMERIC,
    ENCODING_TYPE_NUMERIC,
    ENCODING_TYPE_HEXADECIMAL,
    ENCODING_TYPE_QRCODE,
    UNRECOGNIZED,
  ];

  static final $core.Map<$core.int, PairingEncoding_EncodingType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PairingEncoding_EncodingType? valueOf($core.int value) =>
      _byValue[value];

  const PairingEncoding_EncodingType._(super.value, super.name);
}

class PairingMessage_Status extends $pb.ProtobufEnum {
  static const PairingMessage_Status UNKNOWN =
      PairingMessage_Status._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const PairingMessage_Status STATUS_OK =
      PairingMessage_Status._(200, _omitEnumNames ? '' : 'STATUS_OK');
  static const PairingMessage_Status STATUS_ERROR =
      PairingMessage_Status._(400, _omitEnumNames ? '' : 'STATUS_ERROR');
  static const PairingMessage_Status STATUS_BAD_CONFIGURATION =
      PairingMessage_Status._(
          401, _omitEnumNames ? '' : 'STATUS_BAD_CONFIGURATION');
  static const PairingMessage_Status STATUS_BAD_SECRET =
      PairingMessage_Status._(402, _omitEnumNames ? '' : 'STATUS_BAD_SECRET');
  static const PairingMessage_Status UNRECOGNIZED =
      PairingMessage_Status._(-1, _omitEnumNames ? '' : 'UNRECOGNIZED');

  static const $core.List<PairingMessage_Status> values =
      <PairingMessage_Status>[
    UNKNOWN,
    STATUS_OK,
    STATUS_ERROR,
    STATUS_BAD_CONFIGURATION,
    STATUS_BAD_SECRET,
    UNRECOGNIZED,
  ];

  static final $core.Map<$core.int, PairingMessage_Status> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PairingMessage_Status? valueOf($core.int value) => _byValue[value];

  const PairingMessage_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
