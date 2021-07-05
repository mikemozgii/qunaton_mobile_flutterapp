import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'dart:async';
import 'package:tonbrains_quanton_mobile_app/globals.dart';
import 'package:tonbrains_quanton_mobile_app/heplers/logsManager.dart';

GlobalKey<NavigatorState> navigator;

ClientChannel apiChannel() {
  return ClientChannel(apiHost, port: apiPort, options: apiChannelOptions);
}

CallOptions apiOptions(Map<String, String> metadata) {
  return CallOptions(metadata: metadata);
}

Future prepareApiSession(Function handler, {bool withLogs = true}) async {
  var channel = apiChannel();

  var metadata = Map<String, String>();
  if (currentUserToken.isNotEmpty)
    metadata.putIfAbsent('token', () => currentUserToken);

  if (withLogs) {
    var logInfo = await getLogInfo();
    if (logInfo != null) metadata.addAll(logInfo);
  }

  try {
    await handler(channel, metadata);
  } catch (e) {
    if (e is GrpcError) {
      if (e.message == "Permission denied") {
        currentUserToken = "";
        final storage = new FlutterSecureStorage();
        await storage.delete(key: 'currentUser');
        navigator.currentState.pushReplacementNamed('/login');
      }
    }
    print('Caught error: $e');
  } finally {
    await channel.shutdown();
  }
}
