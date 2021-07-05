import 'package:grpc/grpc.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pb.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';

String getStatus(TransferLogs e) {
  if (e.isPayment) {
    return "purchase";
  } else if (e.isRecipient) {
    return "Received";
  } else if (e.status == "Completed") {
    return "Completed";
  }

  if (!e.isPayment) {
    if (e.status == "WaitingForAuthToken") {
      return "Pending";
    } else if (e.status == "Paused") {
      return "Paused";
    }
  }

  return e.status;
}

Future setTransferStatushlp(TransferLogs item, String status) async {
  await prepareApiSession(
      (ClientChannel channel, Map<String, String> options) async {
    final client = TonMobileClient(channel);
    final request = SetTransferStatusRequest()
      ..id = item.id
      ..status = status;

    final result =
        await client.setTransferStatus(request, options: apiOptions(options));

    if (result.status.isEmpty) return;
  });
}
