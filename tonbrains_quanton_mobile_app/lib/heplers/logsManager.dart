import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:tonbrains_quanton_mobile_app/globals.dart';

Future<Map<String, String>> getLogInfo() async {
  Map<String, String> logInfo = Map<String, String>();

  DateTime dateTime = DateTime.now();
  logInfo.addAll(<String, String>{
    'timeZone': dateTime.timeZoneName,
    'timeStamp': dateTime.toString(),
  });

  try {
    if (deviceInfo == null || deviceInfo.length == 0) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      deviceInfo = Map<String, String>();

      if (defaultTargetPlatform == TargetPlatform.android) {
        deviceInfo.addAll(<String, String>{'platform': "Android"});
        deviceInfo
            .addAll(readAndroidBuildData(await deviceInfoPlugin.androidInfo));
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        deviceInfo.addAll(<String, String>{'platform': "iOS"});
        deviceInfo.addAll(readIosDeviceInfo(await deviceInfoPlugin.iosInfo));
      }
    }
    logInfo.addAll(deviceInfo);
  } catch (e) {}

  try {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    logInfo.addAll(<String, String>{
      'latitude': position.latitude.toString(),
      'longitude': position.longitude.toString(),
    });
  } catch (e) {}

  return logInfo;
}

Map<String, String> readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, String>{
    'deviceId': build.androidId,
    'model': build.model,
    'isPhysicalDevice': build.isPhysicalDevice.toString(),
    'release': build.version.release,
    'securityPatch': build.version.securityPatch,
    'sdk': build.version.sdkInt.toString(),
    'incremental': build.version.incremental,
    'codename': build.version.codename,
    'baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'buildHost': build.host,
    'buildId': build.id,
    'manufacturer': build.manufacturer,
    'product': build.product,
    'tags': build.tags,
    'type': build.type,
  };
}

Map<String, String> readIosDeviceInfo(IosDeviceInfo data) {
  return <String, String>{
    'deviceId': data.identifierForVendor,
    'model': data.model,
    'isPhysicalDevice': data.isPhysicalDevice.toString(),
    'release:': data.utsname.release,
    'name': data.name,
    'systemName': data.systemName,
    'systemVersion': data.systemVersion,
    'localizedModel': data.localizedModel,
    'sysname:': data.utsname.sysname,
    'nodename:': data.utsname.nodename,
    'version:': data.utsname.version,
    'machine:': data.utsname.machine,
  };
}
