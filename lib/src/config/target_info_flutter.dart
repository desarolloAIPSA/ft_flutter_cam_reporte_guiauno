// ignore_for_file: unnecessary_null_comparison

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum DeviceName { android, ios, linux, mac, web, windows }

class TargetInfoC extends ChangeNotifier {
  Future<DeviceName> getTarget() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    DeviceName dispo = DeviceName.android;
    
    try {
      final android = await deviceInfoPlugin.androidInfo;
      if (android != null) dispo = DeviceName.android;
    } catch (e) {
      //debugPrint("androidInfo error: $e");
    }
    try {
      final ios = await deviceInfoPlugin.iosInfo;
      if (ios != null) dispo = DeviceName.ios;
    } catch (e) {
      //debugPrint("iosInfo error: $e");
    }
    try {
      final linux = await deviceInfoPlugin.linuxInfo;
      if (linux != null) dispo = DeviceName.linux;
    } catch (e) {
      //debugPrint("linuxInfo error: $e");
    }
    try {
      final mac = await deviceInfoPlugin.macOsInfo;
      if (mac != null) dispo = DeviceName.mac;
    } catch (e) {
      //debugPrint("macOsInfo error: $e");
    }
    try {
      final web = await deviceInfoPlugin.webBrowserInfo;
      if (web != null) dispo = DeviceName.web;
    } catch (e) {
      //debugPrint("webBrowserInfo error: $e");
    }
    try {
      final windows = await deviceInfoPlugin.windowsInfo;
      if (windows != null) dispo = DeviceName.windows;
    } catch (e) {
      //debugPrint("windowsInfo error: $e");
    }
    
    //debugPrint("deviceInfo: $dispo");
    return dispo;
  }

  Future<PackageInfo> initPackageInfo() async => await PackageInfo.fromPlatform();
    
    
    
  
  
}

/* try {
    final device = await deviceInfoPlugin.deviceInfo;
    debugPrint("device: ${deviceInfoPlugin.deviceInfo.}");
  } catch (e) {
    debugPrint("deviceInfo error: $e");
  } 

  PackageInfo packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown',
      installerStore: 'Unknown',
    );
  try {
      final tipo = deviceInfoPlugin.runtimeType;
      //debugPrint("tipo: ${tipo.toString()}");
    } catch (e) {
      //debugPrint("runtimeType error: $e");
    }
*/