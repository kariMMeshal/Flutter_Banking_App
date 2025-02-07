import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SecureStorageHelper {
  static const _secureStorage = FlutterSecureStorage();

  // Ensure the key is exactly 32 bytes (256 bits)
  static final key = encrypt.Key.fromBase16(
      '0000000000000000000000000000000000000000000000000000000000000000'); // 256-bit key

  // Encrypt data method
  static String encryptData(String data) {
    final iv = encrypt.IV.fromLength(16); // Generate a new IV for each encryption
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);

    // Store IV with encrypted data (IV:Ciphertext format)
    return "${iv.base64}:${encrypted.base64}";
  }

  // Decrypt data method
  static String decryptData(String encryptedData) {
    try {
      final parts = encryptedData.split(':');
      if (parts.length != 2) throw Exception("Invalid encrypted data format");

      final iv = encrypt.IV.fromBase64(parts[0]);
      final encryptedText = parts[1];

      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
      return encrypter.decrypt64(encryptedText, iv: iv);
    } catch (e) {
      return "Decryption error: ${e.toString()}";
    }
  }

  // Save encrypted data
  static Future<void> saveEncryptedData(String id, String name, String value) async {
    final encryptedValue = encryptData(value);
    await _secureStorage.write(key: '${name}_$id', value: encryptedValue);
  }

  // Get decrypted data
  static Future<String?> getEncryptedData(String id, String name) async {
    final encryptedData = await _secureStorage.read(key: '${name}_$id');
    return encryptedData != null ? decryptData(encryptedData) : null;
  }

  // Delete encrypted data
  static Future<void> deleteEncryptedData(String id, String name) async {
    await _secureStorage.delete(key: '${name}_$id');
  }
}
