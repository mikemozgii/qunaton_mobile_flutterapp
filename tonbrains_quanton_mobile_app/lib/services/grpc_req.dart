import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';

import 'api.dart';

// Future validaTeApiVersion() async {
//   try {
//     await prepareApiSession(
//         (ClientChannel channel, Map<String, String> options) async {
//       final client = TonMobileClient(channel);

//       final request = AppVersionRequest();

//       final result =
//           await client.appVersion(request, options: apiOptions(options));

//       var apiVersion = result.version;
//       final storage = new FlutterSecureStorage();
//       var currenApiVersion = await storage.read(key: "api_version");
//       if (currenApiVersion != apiVersion) {
//         await storage.write(key: "api_version", value: apiVersion);
//         await logout();
//       }
//     });
//   } catch (error) {
//     await logout();
//   }
// }
