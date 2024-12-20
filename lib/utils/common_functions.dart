import 'dart:async';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CommonFunctions {

  final iOSOptions = const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  final androidOptions = const AndroidOptions(encryptedSharedPreferences: true);

  Future<bool> hasInternet () async {
    try {
      final result = await InternetAddress.lookup('google.com').timeout(
          const Duration(seconds: 15)
      );
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  readValueFromStrg(String key) async {
    return await const FlutterSecureStorage().read(key: key);
  }

  writeValueToStrg(String key, dynamic value) async {
    if(Platform.isAndroid) {
      await const FlutterSecureStorage().write(key: key, value: value, aOptions: androidOptions);
    } else {
      await const FlutterSecureStorage().write(key: key, value: value, iOptions: iOSOptions);
    }
  }
}