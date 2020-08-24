import 'package:flutter/services.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class FirebaseException extends PlatformException implements Exception {}
