class SdkException implements Exception {
  final String message;
  final int? code;

  SdkException(this.message, [this.code]);

  @override
  String toString() => 'SdkException: $message${code != null ? ' (Code: $code)' : ''}';
}