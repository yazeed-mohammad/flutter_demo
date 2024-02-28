import 'package:demo_app/core/cache/secure_storage_utils.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class CacheManager {
  static Future<bool> isExist(String key) async => await SecureStorageUtils.storage.containsKey(key: key);
}

class UserCache {
  static Future<bool> isTokenExist() async => await SecureStorageUtils.storage.containsKey(key: 'token');

  static Future<void> setToken(String? token) async {
    if (token != null) {
      await SecureStorageUtils.storage.write(key: 'token', value: token);
    }
  }

  static Future<String> getToken() async => await SecureStorageUtils.storage.read(key: 'token') ?? '';

  static Future clearCache(String key) async => await SecureStorageUtils.storage.delete(key: key);

  static Future clearAllCache() async => await SecureStorageUtils.storage.deleteAll();

  static void setUser(String user) async => await SecureStorageUtils.storage.write(key: 'user', value: user);
}
