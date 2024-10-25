import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage; // = FlutterSecureStorage();
  static late SecureStorage _instance;

  SecureStorage._({required FlutterSecureStorage flutterSecureStorage}) : _storage = flutterSecureStorage;

  static SecureStorage getInstance() {
    _instance = SecureStorage._(
      flutterSecureStorage: const FlutterSecureStorage(),
    );
    return _instance;
  }

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteSecuredData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  Future<bool> containsKey(String key) async {
    var containsData = await _storage.containsKey(key: key);
    return containsData;
  }

  Future<Map<String, String>> readAllData() async {
    var readAllData = await _storage.readAll();
    return readAllData;
  }

  Future deleteAllData() async {
    var deletedAllData = await _storage.deleteAll();
    return deletedAllData;
  }
}
