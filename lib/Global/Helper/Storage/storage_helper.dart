import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  StorageHelper._privateConstructor();

  // The single instance of the class
  static final StorageHelper instance = StorageHelper._privateConstructor();

  // The FlutterSecureStorage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Getter to access the storage
  FlutterSecureStorage get storage => _storage;
}
