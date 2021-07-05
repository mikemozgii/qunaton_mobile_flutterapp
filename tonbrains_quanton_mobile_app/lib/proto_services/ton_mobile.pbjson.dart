///
//  Generated code. Do not modify.
//  source: ton_mobile.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const AppVersionRequest$json = const {
  '1': 'AppVersionRequest',
};

const AppVersionReply$json = const {
  '1': 'AppVersionReply',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
  ],
};

const PaymentRequest$json = const {
  '1': 'PaymentRequest',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'clientData', '3': 2, '4': 1, '5': 9, '10': 'clientData'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 9, '10': 'amount'},
  ],
};

const PaymentReply$json = const {
  '1': 'PaymentReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'user_name', '3': 3, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const PublicSecretKeySignInRequest$json = const {
  '1': 'PublicSecretKeySignInRequest',
  '2': const [
    const {'1': 'public_key', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'secret_key', '3': 2, '4': 1, '5': 9, '10': 'secretKey'},
  ],
};

const MnemonicPhraseSignInRequest$json = const {
  '1': 'MnemonicPhraseSignInRequest',
  '2': const [
    const {'1': 'phrase', '3': 1, '4': 1, '5': 9, '10': 'phrase'},
  ],
};

const SignInReply$json = const {
  '1': 'SignInReply',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

const TestRequest$json = const {
  '1': 'TestRequest',
};

const TestReply$json = const {
  '1': 'TestReply',
};

const GetSmartAccountRequest$json = const {
  '1': 'GetSmartAccountRequest',
};

const GetSmartAccountReply$json = const {
  '1': 'GetSmartAccountReply',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'mnemonicPhrase', '3': 2, '4': 1, '5': 9, '10': 'mnemonicPhrase'},
    const {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'secretKey', '3': 4, '4': 1, '5': 9, '10': 'secretKey'},
  ],
};

const GetBalanceRequest$json = const {
  '1': 'GetBalanceRequest',
};

const GetBalanceReply$json = const {
  '1': 'GetBalanceReply',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 3, '10': 'balance'},
  ],
};

const TransferBalanceRequest$json = const {
  '1': 'TransferBalanceRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
  ],
};

const TransferBalanceReply$json = const {
  '1': 'TransferBalanceReply',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

const TransferLogsRequest$json = const {
  '1': 'TransferLogsRequest',
};

const TransferLogsReply$json = const {
  '1': 'TransferLogsReply',
  '2': const [
    const {'1': 'transferLogs', '3': 1, '4': 3, '5': 11, '6': '.ton_mobile.TransferLogs', '10': 'transferLogs'},
  ],
};

const TransferLogs$json = const {
  '1': 'TransferLogs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'time', '3': 2, '4': 1, '5': 9, '10': 'time'},
    const {'1': 'date', '3': 3, '4': 1, '5': 9, '10': 'date'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phone', '3': 7, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'isPayment', '3': 8, '4': 1, '5': 8, '10': 'isPayment'},
    const {'1': 'isRecipient', '3': 9, '4': 1, '5': 8, '10': 'isRecipient'},
  ],
};

const AnnouncementsRequest$json = const {
  '1': 'AnnouncementsRequest',
};

const AnnouncementItem$json = const {
  '1': 'AnnouncementItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'date', '3': 4, '4': 1, '5': 3, '10': 'date'},
    const {'1': 'url', '3': 5, '4': 1, '5': 9, '10': 'url'},
  ],
};

const AnnouncementsReply$json = const {
  '1': 'AnnouncementsReply',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.ton_mobile.AnnouncementItem', '10': 'items'},
  ],
};

const SaveIssueRequest$json = const {
  '1': 'SaveIssueRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'files', '3': 3, '4': 3, '5': 11, '6': '.ton_mobile.SaveIssueRequest.FilesEntry', '10': 'files'},
  ],
  '3': const [SaveIssueRequest_FilesEntry$json],
};

const SaveIssueRequest_FilesEntry$json = const {
  '1': 'FilesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const SaveIssueReply$json = const {
  '1': 'SaveIssueReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

const SetTransferStatusRequest$json = const {
  '1': 'SetTransferStatusRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

const SetTransferStatusReply$json = const {
  '1': 'SetTransferStatusReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

const ReceiveTokenRequest$json = const {
  '1': 'ReceiveTokenRequest',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

const ReceiveTokenReply$json = const {
  '1': 'ReceiveTokenReply',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

const ExistContactsRequest$json = const {
  '1': 'ExistContactsRequest',
  '2': const [
    const {'1': 'emails', '3': 1, '4': 3, '5': 9, '10': 'emails'},
    const {'1': 'phones', '3': 2, '4': 3, '5': 9, '10': 'phones'},
  ],
};

const ExistContactsReply$json = const {
  '1': 'ExistContactsReply',
  '2': const [
    const {'1': 'emails', '3': 1, '4': 3, '5': 9, '10': 'emails'},
    const {'1': 'phones', '3': 2, '4': 3, '5': 9, '10': 'phones'},
  ],
};

