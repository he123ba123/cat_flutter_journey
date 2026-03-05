import 'package:cat_flutter_journey/core/utils/secure_storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  // Create a single instance of FlutterSecureStorage
  final FlutterSecureStorage _secureStorage;

  SecureStorageHelper(this._secureStorage);

  // Common Keys
  static const String _emailKey = SecureStorageKeys.email;
  static const String _passwordKey = SecureStorageKeys.password;

  // Write Data
  Future<void> writeData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Read Data
  Future<String?> readData(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Delete Data
  Future<void> deleteData(String key) async {
    await _secureStorage.delete(key: key);
  }

  // Clear All
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }

  // Email Helpers
  Future<void> saveEmail(String email) async {
    await _secureStorage.write(key: _emailKey, value: email);
  }

  // Get Email
  Future<String?> getEmail() async {
    return await _secureStorage.read(key: _emailKey);
  }

  // Delete Email
  Future<void> deleteEmail() async {
    await _secureStorage.delete(key: _emailKey);
  }

  // password Helpers
  Future<void> savePassword(String password) async {
    await _secureStorage.write(key: _passwordKey, value: password);
  }

  // Get password
  Future<String?> getPassword() async {
    return await _secureStorage.read(key: _passwordKey);
  }

  // Delete password
  Future<void> deletePassword() async {
    await _secureStorage.delete(key: _passwordKey);
  }

  // First Name Helpers
  Future<void> saveFirstName(String firstName) async {
    await _secureStorage.write(
      key: SecureStorageKeys.firstName,
      value: firstName,
    );
  }

  // Get First Name
  Future<String?> getFirstName() async {
    return await _secureStorage.read(key: SecureStorageKeys.firstName);
  }

  // Delete First Name
  Future<void> deleteFirstName() async {
    await _secureStorage.delete(key: SecureStorageKeys.firstName);
  }

  // Last Name Helpers
  Future<void> saveLastName(String lastName) async {
    await _secureStorage.write(
      key: SecureStorageKeys.lastName,
      value: lastName,
    );
  }

  // Get Last Name
  Future<String?> getLastName() async {
    return await _secureStorage.read(key: SecureStorageKeys.lastName);
  }

  // Delete Last Name
  Future<void> deleteLastName() async {
    await _secureStorage.delete(key: SecureStorageKeys.lastName);
  }

  // Phone Helpers
  Future<void> savePhone(String phone) async {
    await _secureStorage.write(key: SecureStorageKeys.phone, value: phone);
  }

  // Get Phone
  Future<String?> getPhone() async {
    return await _secureStorage.read(key: SecureStorageKeys.phone);
  }

  // Delete Phone
  Future<void> deletePhone() async {
    await _secureStorage.delete(key: SecureStorageKeys.phone);
  }
}
