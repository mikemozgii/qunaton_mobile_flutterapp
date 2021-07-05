import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/theme_svc.dart';

final String apiHost = '10.0.2.2';
final int apiPort = 8000;
final apiChannelOptions = ChannelOptions(
    credentials: ChannelCredentials.insecure(),
    idleTimeout: Duration(seconds: 2),
    connectionTimeout: Duration(seconds: 2));

// final String apiHost = 'tonbrains.com';
// final int apiPort = 8000;
// final apiChannelOptions = ChannelOptions(
//     credentials: ChannelCredentials.secure(),
//     idleTimeout: Duration(seconds: 2),
//     connectionTimeout: Duration(seconds: 2));

String currentUserToken = "";
Map<String, String> deviceInfo;

final MyTheme appTheme = MyTheme();

bool darkTheme = false;

Future initAppTheme() async {
  final storage = new FlutterSecureStorage();
  final theme = await storage.read(key: 'currentTheme');
  if (theme == null) return;
  darkTheme = theme == "dark";
}

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

String qo = 'QNY';

String shareMessageTitle = 'Welcome to QUANTON Ecosystem!';
String shareMessageLink = 'https://tonbrains.com/quanton';
String shareMessageText =
    'You have been invited to join the awesome app. Please visit the link below to choose the right version of your app and Enter the token {newline} ‘AAAAAAAA’ {newline} upon successful signup you will get a welcome bonus of 100 QUANNIES. Please share the awesome experiences with your friends, family members, and co-workers.';
String deActionFeeDesc =
    'Every DeAction has a fee. The Minimum fee is 1 (QUANY). The fee protects QUANTCHAIN from DDoS, Spam, or Fraud attacks.';

String deactionText1 =
    "Keep in mind all Actions are asynchronous operations. You can create as many Actions as you like and wait for their completion. Some Actions can take up to a few minutes to complete. If you are you are using Recurrent DeAction you can pause or cancel it at any time.";
String deactionText2 =
    "All Actions will be processed in QUANTCHAINs which you have selected. ";

String deactionText3 =
    "QUANY (QNY)  is a crypto resource used by QUANTCHAINs to execute operations";

//
