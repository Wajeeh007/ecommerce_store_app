import 'dart:async';
import 'dart:io';
import 'package:ecommerce_store/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return await const FlutterSecureStorage().read(key: key, aOptions: androidOptions, iOptions: iOSOptions);
  }

  writeValueToStrg(String key, String value) async {
    if(Platform.isAndroid) {
      await const FlutterSecureStorage().write(key: key, value: value, aOptions: androidOptions);
    } else {
      await const FlutterSecureStorage().write(key: key, value: value, iOptions: iOSOptions);
    }
  }

  static showSnackBar({
    String title = '',
    String message = '',
    required bool isError,
    required BuildContext context
  }) {
    ScaffoldMessenger.of(context)..clearMaterialBanners()..showSnackBar(
        SnackBar(
          content: Column(
            spacing: 8,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: primaryWhite,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                  message,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: primaryCreamWhite,
                ),
              ),
            ],
          ),
          backgroundColor: isError ? Colors.red : Colors.lightGreenAccent,
          duration: const Duration(seconds: 2),
          dismissDirection: DismissDirection.up,
        )
    );
  }
}