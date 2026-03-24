// This is a generated file - do not edit.
//
// Generated from pairingmessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roleTypeDescriptor instead')
const RoleType$json = {
  '1': 'RoleType',
  '2': [
    {'1': 'ROLE_TYPE_UNKNOWN', '2': 0},
    {'1': 'ROLE_TYPE_INPUT', '2': 1},
    {'1': 'ROLE_TYPE_OUTPUT', '2': 2},
    {'1': 'UNRECOGNIZED', '2': -1},
  ],
};

/// Descriptor for `RoleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleTypeDescriptor = $convert.base64Decode(
    'CghSb2xlVHlwZRIVChFST0xFX1RZUEVfVU5LTk9XThAAEhMKD1JPTEVfVFlQRV9JTlBVVBABEh'
    'QKEFJPTEVfVFlQRV9PVVRQVVQQAhIZCgxVTlJFQ09HTklaRUQQ////////////AQ==');

@$core.Deprecated('Use pairingRequestDescriptor instead')
const PairingRequest$json = {
  '1': 'PairingRequest',
  '2': [
    {'1': 'client_name', '3': 2, '4': 1, '5': 9, '10': 'clientName'},
    {'1': 'service_name', '3': 1, '4': 1, '5': 9, '10': 'serviceName'},
  ],
};

/// Descriptor for `PairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestDescriptor = $convert.base64Decode(
    'Cg5QYWlyaW5nUmVxdWVzdBIfCgtjbGllbnRfbmFtZRgCIAEoCVIKY2xpZW50TmFtZRIhCgxzZX'
    'J2aWNlX25hbWUYASABKAlSC3NlcnZpY2VOYW1l');

@$core.Deprecated('Use pairingRequestAckDescriptor instead')
const PairingRequestAck$json = {
  '1': 'PairingRequestAck',
  '2': [
    {'1': 'server_name', '3': 1, '4': 1, '5': 9, '10': 'serverName'},
  ],
};

/// Descriptor for `PairingRequestAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestAckDescriptor = $convert.base64Decode(
    'ChFQYWlyaW5nUmVxdWVzdEFjaxIfCgtzZXJ2ZXJfbmFtZRgBIAEoCVIKc2VydmVyTmFtZQ==');

@$core.Deprecated('Use pairingEncodingDescriptor instead')
const PairingEncoding$json = {
  '1': 'PairingEncoding',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.pairing.PairingEncoding.EncodingType',
      '10': 'type'
    },
    {'1': 'symbol_length', '3': 2, '4': 1, '5': 13, '10': 'symbolLength'},
  ],
  '4': [PairingEncoding_EncodingType$json],
};

@$core.Deprecated('Use pairingEncodingDescriptor instead')
const PairingEncoding_EncodingType$json = {
  '1': 'EncodingType',
  '2': [
    {'1': 'ENCODING_TYPE_UNKNOWN', '2': 0},
    {'1': 'ENCODING_TYPE_ALPHANUMERIC', '2': 1},
    {'1': 'ENCODING_TYPE_NUMERIC', '2': 2},
    {'1': 'ENCODING_TYPE_HEXADECIMAL', '2': 3},
    {'1': 'ENCODING_TYPE_QRCODE', '2': 4},
    {'1': 'UNRECOGNIZED', '2': -1},
  ],
};

/// Descriptor for `PairingEncoding`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingEncodingDescriptor = $convert.base64Decode(
    'Cg9QYWlyaW5nRW5jb2RpbmcSOQoEdHlwZRgBIAEoDjIlLnBhaXJpbmcuUGFpcmluZ0VuY29kaW'
    '5nLkVuY29kaW5nVHlwZVIEdHlwZRIjCg1zeW1ib2xfbGVuZ3RoGAIgASgNUgxzeW1ib2xMZW5n'
    'dGgiuAEKDEVuY29kaW5nVHlwZRIZChVFTkNPRElOR19UWVBFX1VOS05PV04QABIeChpFTkNPRE'
    'lOR19UWVBFX0FMUEhBTlVNRVJJQxABEhkKFUVOQ09ESU5HX1RZUEVfTlVNRVJJQxACEh0KGUVO'
    'Q09ESU5HX1RZUEVfSEVYQURFQ0lNQUwQAxIYChRFTkNPRElOR19UWVBFX1FSQ09ERRAEEhkKDF'
    'VOUkVDT0dOSVpFRBD///////////8B');

@$core.Deprecated('Use pairingOptionDescriptor instead')
const PairingOption$json = {
  '1': 'PairingOption',
  '2': [
    {
      '1': 'input_encodings',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pairing.PairingEncoding',
      '10': 'inputEncodings'
    },
    {
      '1': 'output_encodings',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.pairing.PairingEncoding',
      '10': 'outputEncodings'
    },
    {
      '1': 'preferred_role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.pairing.RoleType',
      '10': 'preferredRole'
    },
  ],
};

/// Descriptor for `PairingOption`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingOptionDescriptor = $convert.base64Decode(
    'Cg1QYWlyaW5nT3B0aW9uEkEKD2lucHV0X2VuY29kaW5ncxgBIAMoCzIYLnBhaXJpbmcuUGFpcm'
    'luZ0VuY29kaW5nUg5pbnB1dEVuY29kaW5ncxJDChBvdXRwdXRfZW5jb2RpbmdzGAIgAygLMhgu'
    'cGFpcmluZy5QYWlyaW5nRW5jb2RpbmdSD291dHB1dEVuY29kaW5ncxI4Cg5wcmVmZXJyZWRfcm'
    '9sZRgDIAEoDjIRLnBhaXJpbmcuUm9sZVR5cGVSDXByZWZlcnJlZFJvbGU=');

@$core.Deprecated('Use pairingConfigurationDescriptor instead')
const PairingConfiguration$json = {
  '1': 'PairingConfiguration',
  '2': [
    {
      '1': 'encoding',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingEncoding',
      '10': 'encoding'
    },
    {
      '1': 'client_role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pairing.RoleType',
      '10': 'clientRole'
    },
  ],
};

/// Descriptor for `PairingConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingConfigurationDescriptor = $convert.base64Decode(
    'ChRQYWlyaW5nQ29uZmlndXJhdGlvbhI0CghlbmNvZGluZxgBIAEoCzIYLnBhaXJpbmcuUGFpcm'
    'luZ0VuY29kaW5nUghlbmNvZGluZxIyCgtjbGllbnRfcm9sZRgCIAEoDjIRLnBhaXJpbmcuUm9s'
    'ZVR5cGVSCmNsaWVudFJvbGU=');

@$core.Deprecated('Use pairingConfigurationAckDescriptor instead')
const PairingConfigurationAck$json = {
  '1': 'PairingConfigurationAck',
};

/// Descriptor for `PairingConfigurationAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingConfigurationAckDescriptor =
    $convert.base64Decode('ChdQYWlyaW5nQ29uZmlndXJhdGlvbkFjaw==');

@$core.Deprecated('Use pairingSecretDescriptor instead')
const PairingSecret$json = {
  '1': 'PairingSecret',
  '2': [
    {'1': 'secret', '3': 1, '4': 1, '5': 12, '10': 'secret'},
  ],
};

/// Descriptor for `PairingSecret`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingSecretDescriptor = $convert
    .base64Decode('Cg1QYWlyaW5nU2VjcmV0EhYKBnNlY3JldBgBIAEoDFIGc2VjcmV0');

@$core.Deprecated('Use pairingSecretAckDescriptor instead')
const PairingSecretAck$json = {
  '1': 'PairingSecretAck',
  '2': [
    {'1': 'secret', '3': 1, '4': 1, '5': 12, '10': 'secret'},
  ],
};

/// Descriptor for `PairingSecretAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingSecretAckDescriptor = $convert
    .base64Decode('ChBQYWlyaW5nU2VjcmV0QWNrEhYKBnNlY3JldBgBIAEoDFIGc2VjcmV0');

@$core.Deprecated('Use pairingMessageDescriptor instead')
const PairingMessage$json = {
  '1': 'PairingMessage',
  '2': [
    {'1': 'protocol_version', '3': 1, '4': 1, '5': 5, '10': 'protocolVersion'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pairing.PairingMessage.Status',
      '10': 'status'
    },
    {'1': 'request_case', '3': 3, '4': 1, '5': 5, '10': 'requestCase'},
    {
      '1': 'pairing_request',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingRequest',
      '10': 'pairingRequest'
    },
    {
      '1': 'pairing_request_ack',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingRequestAck',
      '10': 'pairingRequestAck'
    },
    {
      '1': 'pairing_option',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingOption',
      '10': 'pairingOption'
    },
    {
      '1': 'pairing_configuration',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingConfiguration',
      '10': 'pairingConfiguration'
    },
    {
      '1': 'pairing_configuration_ack',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingConfigurationAck',
      '10': 'pairingConfigurationAck'
    },
    {
      '1': 'pairing_secret',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingSecret',
      '10': 'pairingSecret'
    },
    {
      '1': 'pairing_secret_ack',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingSecretAck',
      '10': 'pairingSecretAck'
    },
  ],
  '4': [PairingMessage_Status$json],
};

@$core.Deprecated('Use pairingMessageDescriptor instead')
const PairingMessage_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'STATUS_OK', '2': 200},
    {'1': 'STATUS_ERROR', '2': 400},
    {'1': 'STATUS_BAD_CONFIGURATION', '2': 401},
    {'1': 'STATUS_BAD_SECRET', '2': 402},
    {'1': 'UNRECOGNIZED', '2': -1},
  ],
};

/// Descriptor for `PairingMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingMessageDescriptor = $convert.base64Decode(
    'Cg5QYWlyaW5nTWVzc2FnZRIpChBwcm90b2NvbF92ZXJzaW9uGAEgASgFUg9wcm90b2NvbFZlcn'
    'Npb24SNgoGc3RhdHVzGAIgASgOMh4ucGFpcmluZy5QYWlyaW5nTWVzc2FnZS5TdGF0dXNSBnN0'
    'YXR1cxIhCgxyZXF1ZXN0X2Nhc2UYAyABKAVSC3JlcXVlc3RDYXNlEkAKD3BhaXJpbmdfcmVxdW'
    'VzdBgKIAEoCzIXLnBhaXJpbmcuUGFpcmluZ1JlcXVlc3RSDnBhaXJpbmdSZXF1ZXN0EkoKE3Bh'
    'aXJpbmdfcmVxdWVzdF9hY2sYCyABKAsyGi5wYWlyaW5nLlBhaXJpbmdSZXF1ZXN0QWNrUhFwYW'
    'lyaW5nUmVxdWVzdEFjaxI9Cg5wYWlyaW5nX29wdGlvbhgUIAEoCzIWLnBhaXJpbmcuUGFpcmlu'
    'Z09wdGlvblINcGFpcmluZ09wdGlvbhJSChVwYWlyaW5nX2NvbmZpZ3VyYXRpb24YHiABKAsyHS'
    '5wYWlyaW5nLlBhaXJpbmdDb25maWd1cmF0aW9uUhRwYWlyaW5nQ29uZmlndXJhdGlvbhJcChlw'
    'YWlyaW5nX2NvbmZpZ3VyYXRpb25fYWNrGB8gASgLMiAucGFpcmluZy5QYWlyaW5nQ29uZmlndX'
    'JhdGlvbkFja1IXcGFpcmluZ0NvbmZpZ3VyYXRpb25BY2sSPQoOcGFpcmluZ19zZWNyZXQYKCAB'
    'KAsyFi5wYWlyaW5nLlBhaXJpbmdTZWNyZXRSDXBhaXJpbmdTZWNyZXQSRwoScGFpcmluZ19zZW'
    'NyZXRfYWNrGCkgASgLMhkucGFpcmluZy5QYWlyaW5nU2VjcmV0QWNrUhBwYWlyaW5nU2VjcmV0'
    'QWNrIooBCgZTdGF0dXMSCwoHVU5LTk9XThAAEg4KCVNUQVRVU19PSxDIARIRCgxTVEFUVVNfRV'
    'JST1IQkAMSHQoYU1RBVFVTX0JBRF9DT05GSUdVUkFUSU9OEJEDEhYKEVNUQVRVU19CQURfU0VD'
    'UkVUEJIDEhkKDFVOUkVDT0dOSVpFRBD///////////8B');
