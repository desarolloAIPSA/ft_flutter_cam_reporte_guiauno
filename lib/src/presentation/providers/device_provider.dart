import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../config/target_info_flutter.dart';

class DevicePro with ChangeNotifier {
  late PackageInfo _package = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  DeviceName _device=DeviceName.android;

  set package(PackageInfo package) {
    _package = package;
    notifyListeners();
  }
  PackageInfo get package => _package;


  set device(DeviceName device) {
    _device = device;
    notifyListeners();
  }
  DeviceName get device => _device;
}
