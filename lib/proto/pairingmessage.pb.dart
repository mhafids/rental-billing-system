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

import 'pairingmessage.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'pairingmessage.pbenum.dart';

class PairingRequest extends $pb.GeneratedMessage {
  factory PairingRequest({
    $core.String? serviceName,
    $core.String? clientName,
  }) {
    final result = create();
    if (serviceName != null) result.serviceName = serviceName;
    if (clientName != null) result.clientName = clientName;
    return result;
  }

  PairingRequest._();

  factory PairingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceName')
    ..aOS(2, _omitFieldNames ? '' : 'clientName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequest copyWith(void Function(PairingRequest) updates) =>
      super.copyWith((message) => updates(message as PairingRequest))
          as PairingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingRequest create() => PairingRequest._();
  @$core.override
  PairingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingRequest>(create);
  static PairingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServiceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientName => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientName() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientName() => $_clearField(2);
}

class PairingRequestAck extends $pb.GeneratedMessage {
  factory PairingRequestAck({
    $core.String? serverName,
  }) {
    final result = create();
    if (serverName != null) result.serverName = serverName;
    return result;
  }

  PairingRequestAck._();

  factory PairingRequestAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingRequestAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingRequestAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequestAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequestAck copyWith(void Function(PairingRequestAck) updates) =>
      super.copyWith((message) => updates(message as PairingRequestAck))
          as PairingRequestAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingRequestAck create() => PairingRequestAck._();
  @$core.override
  PairingRequestAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingRequestAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingRequestAck>(create);
  static PairingRequestAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerName() => $_clearField(1);
}

class PairingEncoding extends $pb.GeneratedMessage {
  factory PairingEncoding({
    PairingEncoding_EncodingType? type,
    $core.int? symbolLength,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (symbolLength != null) result.symbolLength = symbolLength;
    return result;
  }

  PairingEncoding._();

  factory PairingEncoding.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingEncoding.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingEncoding',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aE<PairingEncoding_EncodingType>(1, _omitFieldNames ? '' : 'type',
        enumValues: PairingEncoding_EncodingType.values)
    ..aI(2, _omitFieldNames ? '' : 'symbolLength',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingEncoding clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingEncoding copyWith(void Function(PairingEncoding) updates) =>
      super.copyWith((message) => updates(message as PairingEncoding))
          as PairingEncoding;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingEncoding create() => PairingEncoding._();
  @$core.override
  PairingEncoding createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingEncoding getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingEncoding>(create);
  static PairingEncoding? _defaultInstance;

  @$pb.TagNumber(1)
  PairingEncoding_EncodingType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PairingEncoding_EncodingType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get symbolLength => $_getIZ(1);
  @$pb.TagNumber(2)
  set symbolLength($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbolLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbolLength() => $_clearField(2);
}

class PairingOption extends $pb.GeneratedMessage {
  factory PairingOption({
    $core.Iterable<PairingEncoding>? inputEncodings,
    $core.Iterable<PairingEncoding>? outputEncodings,
    RoleType? preferredRole,
  }) {
    final result = create();
    if (inputEncodings != null) result.inputEncodings.addAll(inputEncodings);
    if (outputEncodings != null) result.outputEncodings.addAll(outputEncodings);
    if (preferredRole != null) result.preferredRole = preferredRole;
    return result;
  }

  PairingOption._();

  factory PairingOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingOption',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..pPM<PairingEncoding>(1, _omitFieldNames ? '' : 'inputEncodings',
        subBuilder: PairingEncoding.create)
    ..pPM<PairingEncoding>(2, _omitFieldNames ? '' : 'outputEncodings',
        subBuilder: PairingEncoding.create)
    ..aE<RoleType>(3, _omitFieldNames ? '' : 'preferredRole',
        enumValues: RoleType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingOption copyWith(void Function(PairingOption) updates) =>
      super.copyWith((message) => updates(message as PairingOption))
          as PairingOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingOption create() => PairingOption._();
  @$core.override
  PairingOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingOption>(create);
  static PairingOption? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PairingEncoding> get inputEncodings => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<PairingEncoding> get outputEncodings => $_getList(1);

  @$pb.TagNumber(3)
  RoleType get preferredRole => $_getN(2);
  @$pb.TagNumber(3)
  set preferredRole(RoleType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPreferredRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreferredRole() => $_clearField(3);
}

class PairingConfiguration extends $pb.GeneratedMessage {
  factory PairingConfiguration({
    PairingEncoding? encoding,
    RoleType? clientRole,
  }) {
    final result = create();
    if (encoding != null) result.encoding = encoding;
    if (clientRole != null) result.clientRole = clientRole;
    return result;
  }

  PairingConfiguration._();

  factory PairingConfiguration.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingConfiguration.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingConfiguration',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aOM<PairingEncoding>(1, _omitFieldNames ? '' : 'encoding',
        subBuilder: PairingEncoding.create)
    ..aE<RoleType>(2, _omitFieldNames ? '' : 'clientRole',
        enumValues: RoleType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfiguration clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfiguration copyWith(void Function(PairingConfiguration) updates) =>
      super.copyWith((message) => updates(message as PairingConfiguration))
          as PairingConfiguration;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingConfiguration create() => PairingConfiguration._();
  @$core.override
  PairingConfiguration createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingConfiguration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingConfiguration>(create);
  static PairingConfiguration? _defaultInstance;

  @$pb.TagNumber(1)
  PairingEncoding get encoding => $_getN(0);
  @$pb.TagNumber(1)
  set encoding(PairingEncoding value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoding() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoding() => $_clearField(1);
  @$pb.TagNumber(1)
  PairingEncoding ensureEncoding() => $_ensure(0);

  @$pb.TagNumber(2)
  RoleType get clientRole => $_getN(1);
  @$pb.TagNumber(2)
  set clientRole(RoleType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasClientRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientRole() => $_clearField(2);
}

class PairingConfigurationAck extends $pb.GeneratedMessage {
  factory PairingConfigurationAck() => create();

  PairingConfigurationAck._();

  factory PairingConfigurationAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingConfigurationAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingConfigurationAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfigurationAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfigurationAck copyWith(
          void Function(PairingConfigurationAck) updates) =>
      super.copyWith((message) => updates(message as PairingConfigurationAck))
          as PairingConfigurationAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingConfigurationAck create() => PairingConfigurationAck._();
  @$core.override
  PairingConfigurationAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingConfigurationAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingConfigurationAck>(create);
  static PairingConfigurationAck? _defaultInstance;
}

class PairingSecret extends $pb.GeneratedMessage {
  factory PairingSecret({
    $core.List<$core.int>? secret,
  }) {
    final result = create();
    if (secret != null) result.secret = secret;
    return result;
  }

  PairingSecret._();

  factory PairingSecret.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingSecret.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingSecret',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'secret', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingSecret clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingSecret copyWith(void Function(PairingSecret) updates) =>
      super.copyWith((message) => updates(message as PairingSecret))
          as PairingSecret;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingSecret create() => PairingSecret._();
  @$core.override
  PairingSecret createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingSecret getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingSecret>(create);
  static PairingSecret? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get secret => $_getN(0);
  @$pb.TagNumber(1)
  set secret($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSecret() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecret() => $_clearField(1);
}

class PairingSecretAck extends $pb.GeneratedMessage {
  factory PairingSecretAck({
    $core.List<$core.int>? secret,
  }) {
    final result = create();
    if (secret != null) result.secret = secret;
    return result;
  }

  PairingSecretAck._();

  factory PairingSecretAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingSecretAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingSecretAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'secret', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingSecretAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingSecretAck copyWith(void Function(PairingSecretAck) updates) =>
      super.copyWith((message) => updates(message as PairingSecretAck))
          as PairingSecretAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingSecretAck create() => PairingSecretAck._();
  @$core.override
  PairingSecretAck createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingSecretAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingSecretAck>(create);
  static PairingSecretAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get secret => $_getN(0);
  @$pb.TagNumber(1)
  set secret($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSecret() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecret() => $_clearField(1);
}

class PairingMessage extends $pb.GeneratedMessage {
  factory PairingMessage({
    $core.int? protocolVersion,
    PairingMessage_Status? status,
    $core.int? requestCase,
    PairingRequest? pairingRequest,
    PairingRequestAck? pairingRequestAck,
    PairingOption? pairingOption,
    PairingConfiguration? pairingConfiguration,
    PairingConfigurationAck? pairingConfigurationAck,
    PairingSecret? pairingSecret,
    PairingSecretAck? pairingSecretAck,
  }) {
    final result = create();
    if (protocolVersion != null) result.protocolVersion = protocolVersion;
    if (status != null) result.status = status;
    if (requestCase != null) result.requestCase = requestCase;
    if (pairingRequest != null) result.pairingRequest = pairingRequest;
    if (pairingRequestAck != null) result.pairingRequestAck = pairingRequestAck;
    if (pairingOption != null) result.pairingOption = pairingOption;
    if (pairingConfiguration != null)
      result.pairingConfiguration = pairingConfiguration;
    if (pairingConfigurationAck != null)
      result.pairingConfigurationAck = pairingConfigurationAck;
    if (pairingSecret != null) result.pairingSecret = pairingSecret;
    if (pairingSecretAck != null) result.pairingSecretAck = pairingSecretAck;
    return result;
  }

  PairingMessage._();

  factory PairingMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'protocolVersion')
    ..aE<PairingMessage_Status>(2, _omitFieldNames ? '' : 'status',
        enumValues: PairingMessage_Status.values)
    ..aI(3, _omitFieldNames ? '' : 'requestCase')
    ..aOM<PairingRequest>(10, _omitFieldNames ? '' : 'pairingRequest',
        subBuilder: PairingRequest.create)
    ..aOM<PairingRequestAck>(11, _omitFieldNames ? '' : 'pairingRequestAck',
        subBuilder: PairingRequestAck.create)
    ..aOM<PairingOption>(20, _omitFieldNames ? '' : 'pairingOption',
        subBuilder: PairingOption.create)
    ..aOM<PairingConfiguration>(
        30, _omitFieldNames ? '' : 'pairingConfiguration',
        subBuilder: PairingConfiguration.create)
    ..aOM<PairingConfigurationAck>(
        31, _omitFieldNames ? '' : 'pairingConfigurationAck',
        subBuilder: PairingConfigurationAck.create)
    ..aOM<PairingSecret>(40, _omitFieldNames ? '' : 'pairingSecret',
        subBuilder: PairingSecret.create)
    ..aOM<PairingSecretAck>(41, _omitFieldNames ? '' : 'pairingSecretAck',
        subBuilder: PairingSecretAck.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingMessage copyWith(void Function(PairingMessage) updates) =>
      super.copyWith((message) => updates(message as PairingMessage))
          as PairingMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingMessage create() => PairingMessage._();
  @$core.override
  PairingMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairingMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingMessage>(create);
  static PairingMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get protocolVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set protocolVersion($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProtocolVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocolVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  PairingMessage_Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(PairingMessage_Status value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get requestCase => $_getIZ(2);
  @$pb.TagNumber(3)
  set requestCase($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRequestCase() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestCase() => $_clearField(3);

  @$pb.TagNumber(10)
  PairingRequest get pairingRequest => $_getN(3);
  @$pb.TagNumber(10)
  set pairingRequest(PairingRequest value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasPairingRequest() => $_has(3);
  @$pb.TagNumber(10)
  void clearPairingRequest() => $_clearField(10);
  @$pb.TagNumber(10)
  PairingRequest ensurePairingRequest() => $_ensure(3);

  @$pb.TagNumber(11)
  PairingRequestAck get pairingRequestAck => $_getN(4);
  @$pb.TagNumber(11)
  set pairingRequestAck(PairingRequestAck value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPairingRequestAck() => $_has(4);
  @$pb.TagNumber(11)
  void clearPairingRequestAck() => $_clearField(11);
  @$pb.TagNumber(11)
  PairingRequestAck ensurePairingRequestAck() => $_ensure(4);

  @$pb.TagNumber(20)
  PairingOption get pairingOption => $_getN(5);
  @$pb.TagNumber(20)
  set pairingOption(PairingOption value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasPairingOption() => $_has(5);
  @$pb.TagNumber(20)
  void clearPairingOption() => $_clearField(20);
  @$pb.TagNumber(20)
  PairingOption ensurePairingOption() => $_ensure(5);

  @$pb.TagNumber(30)
  PairingConfiguration get pairingConfiguration => $_getN(6);
  @$pb.TagNumber(30)
  set pairingConfiguration(PairingConfiguration value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasPairingConfiguration() => $_has(6);
  @$pb.TagNumber(30)
  void clearPairingConfiguration() => $_clearField(30);
  @$pb.TagNumber(30)
  PairingConfiguration ensurePairingConfiguration() => $_ensure(6);

  @$pb.TagNumber(31)
  PairingConfigurationAck get pairingConfigurationAck => $_getN(7);
  @$pb.TagNumber(31)
  set pairingConfigurationAck(PairingConfigurationAck value) =>
      $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasPairingConfigurationAck() => $_has(7);
  @$pb.TagNumber(31)
  void clearPairingConfigurationAck() => $_clearField(31);
  @$pb.TagNumber(31)
  PairingConfigurationAck ensurePairingConfigurationAck() => $_ensure(7);

  @$pb.TagNumber(40)
  PairingSecret get pairingSecret => $_getN(8);
  @$pb.TagNumber(40)
  set pairingSecret(PairingSecret value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasPairingSecret() => $_has(8);
  @$pb.TagNumber(40)
  void clearPairingSecret() => $_clearField(40);
  @$pb.TagNumber(40)
  PairingSecret ensurePairingSecret() => $_ensure(8);

  @$pb.TagNumber(41)
  PairingSecretAck get pairingSecretAck => $_getN(9);
  @$pb.TagNumber(41)
  set pairingSecretAck(PairingSecretAck value) => $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasPairingSecretAck() => $_has(9);
  @$pb.TagNumber(41)
  void clearPairingSecretAck() => $_clearField(41);
  @$pb.TagNumber(41)
  PairingSecretAck ensurePairingSecretAck() => $_ensure(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
