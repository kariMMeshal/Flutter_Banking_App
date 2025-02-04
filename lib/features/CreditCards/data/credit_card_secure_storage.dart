import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SecureStorageHelper {
  static const _secureStorage = FlutterSecureStorage();

  static final key = encrypt.Key.fromUtf8('32characterslongsecretkey12345');
  static final iv = encrypt.IV.fromLength(16);

  // Encrypt data method
  static String encryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  // Decrypt data method
  static String decryptData(String encryptedData) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedData, iv: iv);
    return decrypted;
  }

  static Future<void> saveEncryptedData(
      String id, String name, String value) async {
    final encryptedValue = encryptData(value);
    await _secureStorage.write(key: '${name}_$id', value: encryptedValue);
  }

  static Future<String?> getEncryptedData(String id, String name) async {
    final encryptedData = await _secureStorage.read(key: '${name}_$id');
    if (encryptedData != null) {
      return decryptData(encryptedData);
    }
    return null;
  }

  static Future<void> deleteEncryptedData(String id, String name) async {
    await _secureStorage.delete(key: '${name}_$id');
  }
}
