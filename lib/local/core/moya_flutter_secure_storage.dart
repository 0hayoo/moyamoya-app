import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

final moyaFlutterSecureStorage = FlutterSecureStorage(
  aOptions: _getAndroidOptions(),
);
