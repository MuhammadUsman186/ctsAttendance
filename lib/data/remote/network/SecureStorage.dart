import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final String _keyUsername = 'Username';
  final String _keyPassword = 'Password';

  Future setUsername(String username) async {
    await storage.write(key: _keyUsername, value: username);
  }

  Future<String?> getUsername() async {
    return await storage.read(key: _keyUsername);
  }

  Future setPassword(String password) async {
    await storage.write(key: _keyPassword, value: password);
  }

  Future<String?> getPassword() async {
    return await storage.read(key: _keyPassword);
  }
}

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});
