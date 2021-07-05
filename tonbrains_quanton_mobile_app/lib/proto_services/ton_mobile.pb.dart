///
//  Generated code. Do not modify.
//  source: ton_mobile.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class AppVersionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppVersionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AppVersionRequest._() : super();
  factory AppVersionRequest() => create();
  factory AppVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppVersionRequest clone() => AppVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppVersionRequest copyWith(void Function(AppVersionRequest) updates) => super.copyWith((message) => updates(message as AppVersionRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppVersionRequest create() => AppVersionRequest._();
  AppVersionRequest createEmptyInstance() => create();
  static $pb.PbList<AppVersionRequest> createRepeated() => $pb.PbList<AppVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static AppVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppVersionRequest>(create);
  static AppVersionRequest _defaultInstance;
}

class AppVersionReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppVersionReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..hasRequiredFields = false
  ;

  AppVersionReply._() : super();
  factory AppVersionReply() => create();
  factory AppVersionReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppVersionReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppVersionReply clone() => AppVersionReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppVersionReply copyWith(void Function(AppVersionReply) updates) => super.copyWith((message) => updates(message as AppVersionReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppVersionReply create() => AppVersionReply._();
  AppVersionReply createEmptyInstance() => create();
  static $pb.PbList<AppVersionReply> createRepeated() => $pb.PbList<AppVersionReply>();
  @$core.pragma('dart2js:noInline')
  static AppVersionReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppVersionReply>(create);
  static AppVersionReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);
}

class PaymentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PaymentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientData', protoName: 'clientData')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  PaymentRequest._() : super();
  factory PaymentRequest() => create();
  factory PaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaymentRequest clone() => PaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaymentRequest copyWith(void Function(PaymentRequest) updates) => super.copyWith((message) => updates(message as PaymentRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentRequest create() => PaymentRequest._();
  PaymentRequest createEmptyInstance() => create();
  static $pb.PbList<PaymentRequest> createRepeated() => $pb.PbList<PaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static PaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaymentRequest>(create);
  static PaymentRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientData => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientData($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientData() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientData() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get amount => $_getSZ(2);
  @$pb.TagNumber(3)
  set amount($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class PaymentReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PaymentReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  PaymentReply._() : super();
  factory PaymentReply() => create();
  factory PaymentReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaymentReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaymentReply clone() => PaymentReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaymentReply copyWith(void Function(PaymentReply) updates) => super.copyWith((message) => updates(message as PaymentReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaymentReply create() => PaymentReply._();
  PaymentReply createEmptyInstance() => create();
  static $pb.PbList<PaymentReply> createRepeated() => $pb.PbList<PaymentReply>();
  @$core.pragma('dart2js:noInline')
  static PaymentReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaymentReply>(create);
  static PaymentReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class SignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignInRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName')
    ..hasRequiredFields = false
  ;

  SignInRequest._() : super();
  factory SignInRequest() => create();
  factory SignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignInRequest clone() => SignInRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignInRequest copyWith(void Function(SignInRequest) updates) => super.copyWith((message) => updates(message as SignInRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInRequest create() => SignInRequest._();
  SignInRequest createEmptyInstance() => create();
  static $pb.PbList<SignInRequest> createRepeated() => $pb.PbList<SignInRequest>();
  @$core.pragma('dart2js:noInline')
  static SignInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInRequest>(create);
  static SignInRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => clearField(3);
}

class PublicSecretKeySignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublicSecretKeySignInRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secretKey')
    ..hasRequiredFields = false
  ;

  PublicSecretKeySignInRequest._() : super();
  factory PublicSecretKeySignInRequest() => create();
  factory PublicSecretKeySignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicSecretKeySignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicSecretKeySignInRequest clone() => PublicSecretKeySignInRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicSecretKeySignInRequest copyWith(void Function(PublicSecretKeySignInRequest) updates) => super.copyWith((message) => updates(message as PublicSecretKeySignInRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublicSecretKeySignInRequest create() => PublicSecretKeySignInRequest._();
  PublicSecretKeySignInRequest createEmptyInstance() => create();
  static $pb.PbList<PublicSecretKeySignInRequest> createRepeated() => $pb.PbList<PublicSecretKeySignInRequest>();
  @$core.pragma('dart2js:noInline')
  static PublicSecretKeySignInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicSecretKeySignInRequest>(create);
  static PublicSecretKeySignInRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secretKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set secretKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecretKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretKey() => clearField(2);
}

class MnemonicPhraseSignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MnemonicPhraseSignInRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phrase')
    ..hasRequiredFields = false
  ;

  MnemonicPhraseSignInRequest._() : super();
  factory MnemonicPhraseSignInRequest() => create();
  factory MnemonicPhraseSignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MnemonicPhraseSignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MnemonicPhraseSignInRequest clone() => MnemonicPhraseSignInRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MnemonicPhraseSignInRequest copyWith(void Function(MnemonicPhraseSignInRequest) updates) => super.copyWith((message) => updates(message as MnemonicPhraseSignInRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MnemonicPhraseSignInRequest create() => MnemonicPhraseSignInRequest._();
  MnemonicPhraseSignInRequest createEmptyInstance() => create();
  static $pb.PbList<MnemonicPhraseSignInRequest> createRepeated() => $pb.PbList<MnemonicPhraseSignInRequest>();
  @$core.pragma('dart2js:noInline')
  static MnemonicPhraseSignInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MnemonicPhraseSignInRequest>(create);
  static MnemonicPhraseSignInRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phrase => $_getSZ(0);
  @$pb.TagNumber(1)
  set phrase($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhrase() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhrase() => clearField(1);
}

class SignInReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignInReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  SignInReply._() : super();
  factory SignInReply() => create();
  factory SignInReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignInReply clone() => SignInReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignInReply copyWith(void Function(SignInReply) updates) => super.copyWith((message) => updates(message as SignInReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInReply create() => SignInReply._();
  SignInReply createEmptyInstance() => create();
  static $pb.PbList<SignInReply> createRepeated() => $pb.PbList<SignInReply>();
  @$core.pragma('dart2js:noInline')
  static SignInReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInReply>(create);
  static SignInReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class TestRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  TestRequest._() : super();
  factory TestRequest() => create();
  factory TestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TestRequest clone() => TestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TestRequest copyWith(void Function(TestRequest) updates) => super.copyWith((message) => updates(message as TestRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestRequest create() => TestRequest._();
  TestRequest createEmptyInstance() => create();
  static $pb.PbList<TestRequest> createRepeated() => $pb.PbList<TestRequest>();
  @$core.pragma('dart2js:noInline')
  static TestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestRequest>(create);
  static TestRequest _defaultInstance;
}

class TestReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TestReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  TestReply._() : super();
  factory TestReply() => create();
  factory TestReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TestReply clone() => TestReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TestReply copyWith(void Function(TestReply) updates) => super.copyWith((message) => updates(message as TestReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestReply create() => TestReply._();
  TestReply createEmptyInstance() => create();
  static $pb.PbList<TestReply> createRepeated() => $pb.PbList<TestReply>();
  @$core.pragma('dart2js:noInline')
  static TestReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestReply>(create);
  static TestReply _defaultInstance;
}

class GetSmartAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSmartAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetSmartAccountRequest._() : super();
  factory GetSmartAccountRequest() => create();
  factory GetSmartAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSmartAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSmartAccountRequest clone() => GetSmartAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSmartAccountRequest copyWith(void Function(GetSmartAccountRequest) updates) => super.copyWith((message) => updates(message as GetSmartAccountRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSmartAccountRequest create() => GetSmartAccountRequest._();
  GetSmartAccountRequest createEmptyInstance() => create();
  static $pb.PbList<GetSmartAccountRequest> createRepeated() => $pb.PbList<GetSmartAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSmartAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSmartAccountRequest>(create);
  static GetSmartAccountRequest _defaultInstance;
}

class GetSmartAccountReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSmartAccountReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mnemonicPhrase', protoName: 'mnemonicPhrase')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secretKey', protoName: 'secretKey')
    ..hasRequiredFields = false
  ;

  GetSmartAccountReply._() : super();
  factory GetSmartAccountReply() => create();
  factory GetSmartAccountReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSmartAccountReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSmartAccountReply clone() => GetSmartAccountReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSmartAccountReply copyWith(void Function(GetSmartAccountReply) updates) => super.copyWith((message) => updates(message as GetSmartAccountReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSmartAccountReply create() => GetSmartAccountReply._();
  GetSmartAccountReply createEmptyInstance() => create();
  static $pb.PbList<GetSmartAccountReply> createRepeated() => $pb.PbList<GetSmartAccountReply>();
  @$core.pragma('dart2js:noInline')
  static GetSmartAccountReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSmartAccountReply>(create);
  static GetSmartAccountReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mnemonicPhrase => $_getSZ(1);
  @$pb.TagNumber(2)
  set mnemonicPhrase($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMnemonicPhrase() => $_has(1);
  @$pb.TagNumber(2)
  void clearMnemonicPhrase() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secretKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set secretKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecretKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecretKey() => clearField(4);
}

class GetBalanceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBalanceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetBalanceRequest._() : super();
  factory GetBalanceRequest() => create();
  factory GetBalanceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBalanceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBalanceRequest clone() => GetBalanceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBalanceRequest copyWith(void Function(GetBalanceRequest) updates) => super.copyWith((message) => updates(message as GetBalanceRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBalanceRequest create() => GetBalanceRequest._();
  GetBalanceRequest createEmptyInstance() => create();
  static $pb.PbList<GetBalanceRequest> createRepeated() => $pb.PbList<GetBalanceRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBalanceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBalanceRequest>(create);
  static GetBalanceRequest _defaultInstance;
}

class GetBalanceReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBalanceReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'balance')
    ..hasRequiredFields = false
  ;

  GetBalanceReply._() : super();
  factory GetBalanceReply() => create();
  factory GetBalanceReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBalanceReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBalanceReply clone() => GetBalanceReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBalanceReply copyWith(void Function(GetBalanceReply) updates) => super.copyWith((message) => updates(message as GetBalanceReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBalanceReply create() => GetBalanceReply._();
  GetBalanceReply createEmptyInstance() => create();
  static $pb.PbList<GetBalanceReply> createRepeated() => $pb.PbList<GetBalanceReply>();
  @$core.pragma('dart2js:noInline')
  static GetBalanceReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBalanceReply>(create);
  static GetBalanceReply _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);
}

class TransferBalanceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransferBalanceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..hasRequiredFields = false
  ;

  TransferBalanceRequest._() : super();
  factory TransferBalanceRequest() => create();
  factory TransferBalanceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferBalanceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferBalanceRequest clone() => TransferBalanceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferBalanceRequest copyWith(void Function(TransferBalanceRequest) updates) => super.copyWith((message) => updates(message as TransferBalanceRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferBalanceRequest create() => TransferBalanceRequest._();
  TransferBalanceRequest createEmptyInstance() => create();
  static $pb.PbList<TransferBalanceRequest> createRepeated() => $pb.PbList<TransferBalanceRequest>();
  @$core.pragma('dart2js:noInline')
  static TransferBalanceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferBalanceRequest>(create);
  static TransferBalanceRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => clearField(3);
}

class TransferBalanceReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransferBalanceReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  TransferBalanceReply._() : super();
  factory TransferBalanceReply() => create();
  factory TransferBalanceReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferBalanceReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferBalanceReply clone() => TransferBalanceReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferBalanceReply copyWith(void Function(TransferBalanceReply) updates) => super.copyWith((message) => updates(message as TransferBalanceReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferBalanceReply create() => TransferBalanceReply._();
  TransferBalanceReply createEmptyInstance() => create();
  static $pb.PbList<TransferBalanceReply> createRepeated() => $pb.PbList<TransferBalanceReply>();
  @$core.pragma('dart2js:noInline')
  static TransferBalanceReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferBalanceReply>(create);
  static TransferBalanceReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class TransferLogsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransferLogsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  TransferLogsRequest._() : super();
  factory TransferLogsRequest() => create();
  factory TransferLogsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferLogsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferLogsRequest clone() => TransferLogsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferLogsRequest copyWith(void Function(TransferLogsRequest) updates) => super.copyWith((message) => updates(message as TransferLogsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferLogsRequest create() => TransferLogsRequest._();
  TransferLogsRequest createEmptyInstance() => create();
  static $pb.PbList<TransferLogsRequest> createRepeated() => $pb.PbList<TransferLogsRequest>();
  @$core.pragma('dart2js:noInline')
  static TransferLogsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferLogsRequest>(create);
  static TransferLogsRequest _defaultInstance;
}

class TransferLogsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransferLogsReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..pc<TransferLogs>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transferLogs', $pb.PbFieldType.PM, protoName: 'transferLogs', subBuilder: TransferLogs.create)
    ..hasRequiredFields = false
  ;

  TransferLogsReply._() : super();
  factory TransferLogsReply() => create();
  factory TransferLogsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferLogsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferLogsReply clone() => TransferLogsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferLogsReply copyWith(void Function(TransferLogsReply) updates) => super.copyWith((message) => updates(message as TransferLogsReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferLogsReply create() => TransferLogsReply._();
  TransferLogsReply createEmptyInstance() => create();
  static $pb.PbList<TransferLogsReply> createRepeated() => $pb.PbList<TransferLogsReply>();
  @$core.pragma('dart2js:noInline')
  static TransferLogsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferLogsReply>(create);
  static TransferLogsReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransferLogs> get transferLogs => $_getList(0);
}

class TransferLogs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransferLogs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isPayment', protoName: 'isPayment')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRecipient', protoName: 'isRecipient')
    ..hasRequiredFields = false
  ;

  TransferLogs._() : super();
  factory TransferLogs() => create();
  factory TransferLogs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferLogs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferLogs clone() => TransferLogs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferLogs copyWith(void Function(TransferLogs) updates) => super.copyWith((message) => updates(message as TransferLogs)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferLogs create() => TransferLogs._();
  TransferLogs createEmptyInstance() => create();
  static $pb.PbList<TransferLogs> createRepeated() => $pb.PbList<TransferLogs>();
  @$core.pragma('dart2js:noInline')
  static TransferLogs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferLogs>(create);
  static TransferLogs _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get time => $_getSZ(1);
  @$pb.TagNumber(2)
  set time($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get phone => $_getSZ(6);
  @$pb.TagNumber(7)
  set phone($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isPayment => $_getBF(7);
  @$pb.TagNumber(8)
  set isPayment($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsPayment() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsPayment() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isRecipient => $_getBF(8);
  @$pb.TagNumber(9)
  set isRecipient($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsRecipient() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsRecipient() => clearField(9);
}

class AnnouncementsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AnnouncementsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AnnouncementsRequest._() : super();
  factory AnnouncementsRequest() => create();
  factory AnnouncementsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnnouncementsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnnouncementsRequest clone() => AnnouncementsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnnouncementsRequest copyWith(void Function(AnnouncementsRequest) updates) => super.copyWith((message) => updates(message as AnnouncementsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnnouncementsRequest create() => AnnouncementsRequest._();
  AnnouncementsRequest createEmptyInstance() => create();
  static $pb.PbList<AnnouncementsRequest> createRepeated() => $pb.PbList<AnnouncementsRequest>();
  @$core.pragma('dart2js:noInline')
  static AnnouncementsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnnouncementsRequest>(create);
  static AnnouncementsRequest _defaultInstance;
}

class AnnouncementItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AnnouncementItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  AnnouncementItem._() : super();
  factory AnnouncementItem() => create();
  factory AnnouncementItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnnouncementItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnnouncementItem clone() => AnnouncementItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnnouncementItem copyWith(void Function(AnnouncementItem) updates) => super.copyWith((message) => updates(message as AnnouncementItem)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnnouncementItem create() => AnnouncementItem._();
  AnnouncementItem createEmptyInstance() => create();
  static $pb.PbList<AnnouncementItem> createRepeated() => $pb.PbList<AnnouncementItem>();
  @$core.pragma('dart2js:noInline')
  static AnnouncementItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnnouncementItem>(create);
  static AnnouncementItem _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get date => $_getI64(3);
  @$pb.TagNumber(4)
  set date($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);
}

class AnnouncementsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AnnouncementsReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..pc<AnnouncementItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: AnnouncementItem.create)
    ..hasRequiredFields = false
  ;

  AnnouncementsReply._() : super();
  factory AnnouncementsReply() => create();
  factory AnnouncementsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnnouncementsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnnouncementsReply clone() => AnnouncementsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnnouncementsReply copyWith(void Function(AnnouncementsReply) updates) => super.copyWith((message) => updates(message as AnnouncementsReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnnouncementsReply create() => AnnouncementsReply._();
  AnnouncementsReply createEmptyInstance() => create();
  static $pb.PbList<AnnouncementsReply> createRepeated() => $pb.PbList<AnnouncementsReply>();
  @$core.pragma('dart2js:noInline')
  static AnnouncementsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnnouncementsReply>(create);
  static AnnouncementsReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnnouncementItem> get items => $_getList(0);
}

class SaveIssueRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveIssueRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..m<$core.String, $core.String>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'files', entryClassName: 'SaveIssueRequest.FilesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('ton_mobile'))
    ..hasRequiredFields = false
  ;

  SaveIssueRequest._() : super();
  factory SaveIssueRequest() => create();
  factory SaveIssueRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveIssueRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveIssueRequest clone() => SaveIssueRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveIssueRequest copyWith(void Function(SaveIssueRequest) updates) => super.copyWith((message) => updates(message as SaveIssueRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveIssueRequest create() => SaveIssueRequest._();
  SaveIssueRequest createEmptyInstance() => create();
  static $pb.PbList<SaveIssueRequest> createRepeated() => $pb.PbList<SaveIssueRequest>();
  @$core.pragma('dart2js:noInline')
  static SaveIssueRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveIssueRequest>(create);
  static SaveIssueRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get files => $_getMap(2);
}

class SaveIssueReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SaveIssueReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  SaveIssueReply._() : super();
  factory SaveIssueReply() => create();
  factory SaveIssueReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveIssueReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveIssueReply clone() => SaveIssueReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveIssueReply copyWith(void Function(SaveIssueReply) updates) => super.copyWith((message) => updates(message as SaveIssueReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SaveIssueReply create() => SaveIssueReply._();
  SaveIssueReply createEmptyInstance() => create();
  static $pb.PbList<SaveIssueReply> createRepeated() => $pb.PbList<SaveIssueReply>();
  @$core.pragma('dart2js:noInline')
  static SaveIssueReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveIssueReply>(create);
  static SaveIssueReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class SetTransferStatusRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetTransferStatusRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  SetTransferStatusRequest._() : super();
  factory SetTransferStatusRequest() => create();
  factory SetTransferStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetTransferStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetTransferStatusRequest clone() => SetTransferStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetTransferStatusRequest copyWith(void Function(SetTransferStatusRequest) updates) => super.copyWith((message) => updates(message as SetTransferStatusRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetTransferStatusRequest create() => SetTransferStatusRequest._();
  SetTransferStatusRequest createEmptyInstance() => create();
  static $pb.PbList<SetTransferStatusRequest> createRepeated() => $pb.PbList<SetTransferStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static SetTransferStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetTransferStatusRequest>(create);
  static SetTransferStatusRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class SetTransferStatusReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetTransferStatusReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  SetTransferStatusReply._() : super();
  factory SetTransferStatusReply() => create();
  factory SetTransferStatusReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetTransferStatusReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetTransferStatusReply clone() => SetTransferStatusReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetTransferStatusReply copyWith(void Function(SetTransferStatusReply) updates) => super.copyWith((message) => updates(message as SetTransferStatusReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetTransferStatusReply create() => SetTransferStatusReply._();
  SetTransferStatusReply createEmptyInstance() => create();
  static $pb.PbList<SetTransferStatusReply> createRepeated() => $pb.PbList<SetTransferStatusReply>();
  @$core.pragma('dart2js:noInline')
  static SetTransferStatusReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetTransferStatusReply>(create);
  static SetTransferStatusReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class ReceiveTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReceiveTokenRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  ReceiveTokenRequest._() : super();
  factory ReceiveTokenRequest() => create();
  factory ReceiveTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveTokenRequest clone() => ReceiveTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveTokenRequest copyWith(void Function(ReceiveTokenRequest) updates) => super.copyWith((message) => updates(message as ReceiveTokenRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReceiveTokenRequest create() => ReceiveTokenRequest._();
  ReceiveTokenRequest createEmptyInstance() => create();
  static $pb.PbList<ReceiveTokenRequest> createRepeated() => $pb.PbList<ReceiveTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static ReceiveTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveTokenRequest>(create);
  static ReceiveTokenRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class ReceiveTokenReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReceiveTokenReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok')
    ..hasRequiredFields = false
  ;

  ReceiveTokenReply._() : super();
  factory ReceiveTokenReply() => create();
  factory ReceiveTokenReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiveTokenReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiveTokenReply clone() => ReceiveTokenReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiveTokenReply copyWith(void Function(ReceiveTokenReply) updates) => super.copyWith((message) => updates(message as ReceiveTokenReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReceiveTokenReply create() => ReceiveTokenReply._();
  ReceiveTokenReply createEmptyInstance() => create();
  static $pb.PbList<ReceiveTokenReply> createRepeated() => $pb.PbList<ReceiveTokenReply>();
  @$core.pragma('dart2js:noInline')
  static ReceiveTokenReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiveTokenReply>(create);
  static ReceiveTokenReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
}

class ExistContactsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExistContactsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emails')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phones')
    ..hasRequiredFields = false
  ;

  ExistContactsRequest._() : super();
  factory ExistContactsRequest() => create();
  factory ExistContactsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExistContactsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExistContactsRequest clone() => ExistContactsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExistContactsRequest copyWith(void Function(ExistContactsRequest) updates) => super.copyWith((message) => updates(message as ExistContactsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExistContactsRequest create() => ExistContactsRequest._();
  ExistContactsRequest createEmptyInstance() => create();
  static $pb.PbList<ExistContactsRequest> createRepeated() => $pb.PbList<ExistContactsRequest>();
  @$core.pragma('dart2js:noInline')
  static ExistContactsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExistContactsRequest>(create);
  static ExistContactsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get emails => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get phones => $_getList(1);
}

class ExistContactsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExistContactsReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ton_mobile'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emails')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phones')
    ..hasRequiredFields = false
  ;

  ExistContactsReply._() : super();
  factory ExistContactsReply() => create();
  factory ExistContactsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExistContactsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExistContactsReply clone() => ExistContactsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExistContactsReply copyWith(void Function(ExistContactsReply) updates) => super.copyWith((message) => updates(message as ExistContactsReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExistContactsReply create() => ExistContactsReply._();
  ExistContactsReply createEmptyInstance() => create();
  static $pb.PbList<ExistContactsReply> createRepeated() => $pb.PbList<ExistContactsReply>();
  @$core.pragma('dart2js:noInline')
  static ExistContactsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExistContactsReply>(create);
  static ExistContactsReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get emails => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get phones => $_getList(1);
}

