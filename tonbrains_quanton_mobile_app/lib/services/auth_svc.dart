import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';

import '../globals.dart';

class QuanTonUser {
  String email;
  String name;
  bool authorized = false;
  bool nightMode = false;
  String token;
}

class AuthService with ChangeNotifier {
  final QuanTonUser _user = new QuanTonUser();

  Future<QuanTonUser> getUser() async {
    if (!_user.authorized) {
      final storage = new FlutterSecureStorage();
      final data = await storage.read(key: 'currentUser');
      if (data != null && data.isNotEmpty) {
        final json = jsonDecode(data);
        _user.authorized = json["authorized"];
        currentUserToken = _user.token = json["token"];
        _user.email = json["email"];
        _user.name = json["name"];
      }
    }
    return Future<QuanTonUser>.value(_user);
  }

  Future<QuanTonUser> getUserOnLoad() async {
    await validaTeApiVersion();
    if (!_user.authorized) {
      final storage = new FlutterSecureStorage();
      final data = await storage.read(key: 'currentUser');
      if (data != null && data.isNotEmpty) {
        final json = jsonDecode(data);
        _user.authorized = json["authorized"];
        currentUserToken = _user.token = json["token"];
        _user.email = json["email"];
        _user.name = json["name"];
      }
    }
    return Future<QuanTonUser>.value(_user);
  }

  // wrapping the firebase calls
  Future logout() async {
    _user.authorized = false;
    _user.token = null;
    currentUserToken = "";
    currentUserToken = "";
    final storage = new FlutterSecureStorage();
    await storage.delete(key: 'currentUser');
    notifyListeners();
    return;
  }

  Future validaTeApiVersion() async {
    try {
      await prepareApiSession(
          (ClientChannel channel, Map<String, String> options) async {
        final client = TonMobileClient(channel);

        final request = AppVersionRequest();

        final result =
            await client.appVersion(request, options: apiOptions(options));

        var apiVersion = result.version;
        final storage = new FlutterSecureStorage();
        var currenApiVersion = await storage.read(key: "api_version");
        if (currenApiVersion != apiVersion) {
          await storage.write(key: "api_version", value: apiVersion);
          await logout();
        }
      });
    } catch (error) {
      await logout();
    }
  }

  Future<QuanTonUser> signInUser({String email, String password}) async {
    try {
      //var user = new QuanTonUser();
      _user.email = "test@gmail.com";
      _user.authorized = true;
      _user.token = "12345";
      notifyListeners();
      return _user;
    } catch (e) {
      throw new Exception(e.message);
    }
  }

  Future<QuanTonUser> googleSignInUser() async {
    try {
      await validaTeApiVersion();
      var userAccount = await googleSignIn.signIn();
      await prepareApiSession(
          (ClientChannel channel, Map<String, String> options) async {
        final client = TonMobileClient(channel);

        final request = SignInRequest()
          ..id = userAccount.id
          ..data = userAccount.email
          ..userName = userAccount.displayName;

        final result =
            await client.signIn(request, options: apiOptions(options));
        currentUserToken = result.token;
        _user.email = result.email; //userAccount.email;
        _user.name = result.name; //userAccount.displayName;
        _user.authorized = true;
        _user.token = result.token;
        final storage = new FlutterSecureStorage();
        await storage.write(
            key: 'currentUser',
            value: jsonEncode({
              'name': _user.name,
              'token': _user.token,
              'email': _user.email,
              'authorized': _user.authorized,
            }));
      });
    } catch (error) {
      _user.token = "";
      _user.authorized = false;
    }
    notifyListeners();
  }

  Future signInWithKeys(String publicKey, String secretKey) async {
    await validaTeApiVersion();
    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = PublicSecretKeySignInRequest()
        ..publicKey = publicKey
        ..secretKey = secretKey;
      // .. = description
      // ..files.addAll(files);

      final result = await client.publicSecretKeySignIn(request,
          options: apiOptions(options));

      currentUserToken = result.token;
      _user.email = result.email; //userAccount.email;
      _user.name = result.name; //userAccount.displayName;
      _user.authorized = true;
      _user.token = result.token;
      final storage = new FlutterSecureStorage();
      await storage.write(
          key: 'currentUser',
          value: jsonEncode({
            'name': _user.name,
            'token': _user.token,
            'email': _user.email,
            'authorized': _user.authorized,
          }));

      notifyListeners();
    });
  }

  Future signInWitPhrase(String prase) async {
    await validaTeApiVersion();
    await prepareApiSession(
        (ClientChannel channel, Map<String, String> options) async {
      final client = TonMobileClient(channel);
      final request = MnemonicPhraseSignInRequest()..phrase = prase;

      final result = await client.mnemonicPhraseSignIn(request,
          options: apiOptions(options));

      currentUserToken = result.token;
      _user.email = result.email; //userAccount.email;
      _user.name = result.name; //userAccount.displayName;
      _user.authorized = true;
      _user.token = result.token;
      final storage = new FlutterSecureStorage();
      await storage.write(
          key: 'currentUser',
          value: jsonEncode({
            'name': _user.name,
            'token': _user.token,
            'email': _user.email,
            'authorized': _user.authorized,
          }));

      notifyListeners();
    });
  }
}
