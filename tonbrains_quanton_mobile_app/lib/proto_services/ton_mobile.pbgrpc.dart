///
//  Generated code. Do not modify.
//  source: ton_mobile.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'ton_mobile.pb.dart' as $0;
export 'ton_mobile.pb.dart';

class TonMobileClient extends $grpc.Client {
  static final _$signIn = $grpc.ClientMethod<$0.SignInRequest, $0.SignInReply>(
      '/ton_mobile.TonMobile/SignIn',
      ($0.SignInRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignInReply.fromBuffer(value));
  static final _$publicSecretKeySignIn =
      $grpc.ClientMethod<$0.PublicSecretKeySignInRequest, $0.SignInReply>(
          '/ton_mobile.TonMobile/PublicSecretKeySignIn',
          ($0.PublicSecretKeySignInRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignInReply.fromBuffer(value));
  static final _$mnemonicPhraseSignIn =
      $grpc.ClientMethod<$0.MnemonicPhraseSignInRequest, $0.SignInReply>(
          '/ton_mobile.TonMobile/MnemonicPhraseSignIn',
          ($0.MnemonicPhraseSignInRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignInReply.fromBuffer(value));
  static final _$test = $grpc.ClientMethod<$0.TestRequest, $0.TestReply>(
      '/ton_mobile.TonMobile/Test',
      ($0.TestRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TestReply.fromBuffer(value));
  static final _$getSmartAccount =
      $grpc.ClientMethod<$0.GetSmartAccountRequest, $0.GetSmartAccountReply>(
          '/ton_mobile.TonMobile/GetSmartAccount',
          ($0.GetSmartAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetSmartAccountReply.fromBuffer(value));
  static final _$getBalance =
      $grpc.ClientMethod<$0.GetBalanceRequest, $0.GetBalanceReply>(
          '/ton_mobile.TonMobile/GetBalance',
          ($0.GetBalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBalanceReply.fromBuffer(value));
  static final _$transferBalance =
      $grpc.ClientMethod<$0.TransferBalanceRequest, $0.TransferBalanceReply>(
          '/ton_mobile.TonMobile/TransferBalance',
          ($0.TransferBalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TransferBalanceReply.fromBuffer(value));
  static final _$transferLogs =
      $grpc.ClientMethod<$0.TransferLogsRequest, $0.TransferLogsReply>(
          '/ton_mobile.TonMobile/TransferLogs',
          ($0.TransferLogsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TransferLogsReply.fromBuffer(value));
  static final _$payment =
      $grpc.ClientMethod<$0.PaymentRequest, $0.PaymentReply>(
          '/ton_mobile.TonMobile/Payment',
          ($0.PaymentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.PaymentReply.fromBuffer(value));
  static final _$getAnnouncements =
      $grpc.ClientMethod<$0.AnnouncementsRequest, $0.AnnouncementsReply>(
          '/ton_mobile.TonMobile/GetAnnouncements',
          ($0.AnnouncementsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AnnouncementsReply.fromBuffer(value));
  static final _$setTransferStatus = $grpc.ClientMethod<
          $0.SetTransferStatusRequest, $0.SetTransferStatusReply>(
      '/ton_mobile.TonMobile/SetTransferStatus',
      ($0.SetTransferStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.SetTransferStatusReply.fromBuffer(value));
  static final _$saveIssue =
      $grpc.ClientMethod<$0.SaveIssueRequest, $0.SaveIssueReply>(
          '/ton_mobile.TonMobile/SaveIssue',
          ($0.SaveIssueRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SaveIssueReply.fromBuffer(value));
  static final _$receiveToken =
      $grpc.ClientMethod<$0.ReceiveTokenRequest, $0.ReceiveTokenReply>(
          '/ton_mobile.TonMobile/ReceiveToken',
          ($0.ReceiveTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ReceiveTokenReply.fromBuffer(value));
  static final _$existContacts =
      $grpc.ClientMethod<$0.ExistContactsRequest, $0.ExistContactsReply>(
          '/ton_mobile.TonMobile/ExistContacts',
          ($0.ExistContactsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ExistContactsReply.fromBuffer(value));
  static final _$appVersion =
      $grpc.ClientMethod<$0.AppVersionRequest, $0.AppVersionReply>(
          '/ton_mobile.TonMobile/AppVersion',
          ($0.AppVersionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AppVersionReply.fromBuffer(value));

  TonMobileClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SignInReply> signIn($0.SignInRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignInReply> publicSecretKeySignIn(
      $0.PublicSecretKeySignInRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$publicSecretKeySignIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignInReply> mnemonicPhraseSignIn(
      $0.MnemonicPhraseSignInRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$mnemonicPhraseSignIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.TestReply> test($0.TestRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$test, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSmartAccountReply> getSmartAccount(
      $0.GetSmartAccountRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getSmartAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBalanceReply> getBalance(
      $0.GetBalanceRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getBalance, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransferBalanceReply> transferBalance(
      $0.TransferBalanceRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$transferBalance, request, options: options);
  }

  $grpc.ResponseFuture<$0.TransferLogsReply> transferLogs(
      $0.TransferLogsRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$transferLogs, request, options: options);
  }

  $grpc.ResponseFuture<$0.PaymentReply> payment($0.PaymentRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$payment, request, options: options);
  }

  $grpc.ResponseFuture<$0.AnnouncementsReply> getAnnouncements(
      $0.AnnouncementsRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getAnnouncements, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetTransferStatusReply> setTransferStatus(
      $0.SetTransferStatusRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$setTransferStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.SaveIssueReply> saveIssue($0.SaveIssueRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$saveIssue, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReceiveTokenReply> receiveToken(
      $0.ReceiveTokenRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$receiveToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExistContactsReply> existContacts(
      $0.ExistContactsRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$existContacts, request, options: options);
  }

  $grpc.ResponseFuture<$0.AppVersionReply> appVersion(
      $0.AppVersionRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$appVersion, request, options: options);
  }
}

abstract class TonMobileServiceBase extends $grpc.Service {
  $core.String get $name => 'ton_mobile.TonMobile';

  TonMobileServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignInRequest, $0.SignInReply>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignInRequest.fromBuffer(value),
        ($0.SignInReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.PublicSecretKeySignInRequest, $0.SignInReply>(
            'PublicSecretKeySignIn',
            publicSecretKeySignIn_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.PublicSecretKeySignInRequest.fromBuffer(value),
            ($0.SignInReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MnemonicPhraseSignInRequest, $0.SignInReply>(
            'MnemonicPhraseSignIn',
            mnemonicPhraseSignIn_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MnemonicPhraseSignInRequest.fromBuffer(value),
            ($0.SignInReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TestRequest, $0.TestReply>(
        'Test',
        test_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TestRequest.fromBuffer(value),
        ($0.TestReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetSmartAccountRequest, $0.GetSmartAccountReply>(
            'GetSmartAccount',
            getSmartAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetSmartAccountRequest.fromBuffer(value),
            ($0.GetSmartAccountReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBalanceRequest, $0.GetBalanceReply>(
        'GetBalance',
        getBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBalanceRequest.fromBuffer(value),
        ($0.GetBalanceReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TransferBalanceRequest, $0.TransferBalanceReply>(
            'TransferBalance',
            transferBalance_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.TransferBalanceRequest.fromBuffer(value),
            ($0.TransferBalanceReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TransferLogsRequest, $0.TransferLogsReply>(
            'TransferLogs',
            transferLogs_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.TransferLogsRequest.fromBuffer(value),
            ($0.TransferLogsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PaymentRequest, $0.PaymentReply>(
        'Payment',
        payment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PaymentRequest.fromBuffer(value),
        ($0.PaymentReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AnnouncementsRequest, $0.AnnouncementsReply>(
            'GetAnnouncements',
            getAnnouncements_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AnnouncementsRequest.fromBuffer(value),
            ($0.AnnouncementsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetTransferStatusRequest,
            $0.SetTransferStatusReply>(
        'SetTransferStatus',
        setTransferStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetTransferStatusRequest.fromBuffer(value),
        ($0.SetTransferStatusReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SaveIssueRequest, $0.SaveIssueReply>(
        'SaveIssue',
        saveIssue_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SaveIssueRequest.fromBuffer(value),
        ($0.SaveIssueReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ReceiveTokenRequest, $0.ReceiveTokenReply>(
            'ReceiveToken',
            receiveToken_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ReceiveTokenRequest.fromBuffer(value),
            ($0.ReceiveTokenReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ExistContactsRequest, $0.ExistContactsReply>(
            'ExistContacts',
            existContacts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ExistContactsRequest.fromBuffer(value),
            ($0.ExistContactsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AppVersionRequest, $0.AppVersionReply>(
        'AppVersion',
        appVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AppVersionRequest.fromBuffer(value),
        ($0.AppVersionReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignInReply> signIn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignInRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.SignInReply> publicSecretKeySignIn_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.PublicSecretKeySignInRequest> request) async {
    return publicSecretKeySignIn(call, await request);
  }

  $async.Future<$0.SignInReply> mnemonicPhraseSignIn_Pre($grpc.ServiceCall call,
      $async.Future<$0.MnemonicPhraseSignInRequest> request) async {
    return mnemonicPhraseSignIn(call, await request);
  }

  $async.Future<$0.TestReply> test_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TestRequest> request) async {
    return test(call, await request);
  }

  $async.Future<$0.GetSmartAccountReply> getSmartAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetSmartAccountRequest> request) async {
    return getSmartAccount(call, await request);
  }

  $async.Future<$0.GetBalanceReply> getBalance_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBalanceRequest> request) async {
    return getBalance(call, await request);
  }

  $async.Future<$0.TransferBalanceReply> transferBalance_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TransferBalanceRequest> request) async {
    return transferBalance(call, await request);
  }

  $async.Future<$0.TransferLogsReply> transferLogs_Pre($grpc.ServiceCall call,
      $async.Future<$0.TransferLogsRequest> request) async {
    return transferLogs(call, await request);
  }

  $async.Future<$0.PaymentReply> payment_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PaymentRequest> request) async {
    return payment(call, await request);
  }

  $async.Future<$0.AnnouncementsReply> getAnnouncements_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AnnouncementsRequest> request) async {
    return getAnnouncements(call, await request);
  }

  $async.Future<$0.SetTransferStatusReply> setTransferStatus_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SetTransferStatusRequest> request) async {
    return setTransferStatus(call, await request);
  }

  $async.Future<$0.SaveIssueReply> saveIssue_Pre($grpc.ServiceCall call,
      $async.Future<$0.SaveIssueRequest> request) async {
    return saveIssue(call, await request);
  }

  $async.Future<$0.ReceiveTokenReply> receiveToken_Pre($grpc.ServiceCall call,
      $async.Future<$0.ReceiveTokenRequest> request) async {
    return receiveToken(call, await request);
  }

  $async.Future<$0.ExistContactsReply> existContacts_Pre($grpc.ServiceCall call,
      $async.Future<$0.ExistContactsRequest> request) async {
    return existContacts(call, await request);
  }

  $async.Future<$0.AppVersionReply> appVersion_Pre($grpc.ServiceCall call,
      $async.Future<$0.AppVersionRequest> request) async {
    return appVersion(call, await request);
  }

  $async.Future<$0.SignInReply> signIn(
      $grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$0.SignInReply> publicSecretKeySignIn(
      $grpc.ServiceCall call, $0.PublicSecretKeySignInRequest request);
  $async.Future<$0.SignInReply> mnemonicPhraseSignIn(
      $grpc.ServiceCall call, $0.MnemonicPhraseSignInRequest request);
  $async.Future<$0.TestReply> test(
      $grpc.ServiceCall call, $0.TestRequest request);
  $async.Future<$0.GetSmartAccountReply> getSmartAccount(
      $grpc.ServiceCall call, $0.GetSmartAccountRequest request);
  $async.Future<$0.GetBalanceReply> getBalance(
      $grpc.ServiceCall call, $0.GetBalanceRequest request);
  $async.Future<$0.TransferBalanceReply> transferBalance(
      $grpc.ServiceCall call, $0.TransferBalanceRequest request);
  $async.Future<$0.TransferLogsReply> transferLogs(
      $grpc.ServiceCall call, $0.TransferLogsRequest request);
  $async.Future<$0.PaymentReply> payment(
      $grpc.ServiceCall call, $0.PaymentRequest request);
  $async.Future<$0.AnnouncementsReply> getAnnouncements(
      $grpc.ServiceCall call, $0.AnnouncementsRequest request);
  $async.Future<$0.SetTransferStatusReply> setTransferStatus(
      $grpc.ServiceCall call, $0.SetTransferStatusRequest request);
  $async.Future<$0.SaveIssueReply> saveIssue(
      $grpc.ServiceCall call, $0.SaveIssueRequest request);
  $async.Future<$0.ReceiveTokenReply> receiveToken(
      $grpc.ServiceCall call, $0.ReceiveTokenRequest request);
  $async.Future<$0.ExistContactsReply> existContacts(
      $grpc.ServiceCall call, $0.ExistContactsRequest request);
  $async.Future<$0.AppVersionReply> appVersion(
      $grpc.ServiceCall call, $0.AppVersionRequest request);
}
