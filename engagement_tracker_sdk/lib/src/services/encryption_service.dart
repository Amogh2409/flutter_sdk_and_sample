import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:typed_data';

class EncryptionService {
  String encryptData(String data, String encryptionKey) {
    final keyBytes = sha256.convert(utf8.encode(encryptionKey)).bytes;
    final key = Key(Uint8List.fromList(keyBytes));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return '${iv.base64}:${encrypted.base64}';
  }

  String decryptData(String encryptedData, String encryptionKey) {
    final parts = encryptedData.split(':');
    if (parts.length != 2) throw FormatException('Invalid encrypted data format');

    final keyBytes = sha256.convert(utf8.encode(encryptionKey)).bytes;
    final key = Key(Uint8List.fromList(keyBytes));
    final iv = IV.fromBase64(parts[0]);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    return encrypter.decrypt(Encrypted.fromBase64(parts[1]), iv: iv);
  }
}

