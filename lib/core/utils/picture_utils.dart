import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class PictureUtils {
  static String getFullUrl({required String url}) {
    final baseUrl = (dotenv.env['BACKEND_BASE_URL'] as String).replaceFirst(
      RegExp(r'/api/?$'),
      '',
    );
    final cleanPath = url.replaceFirst(RegExp(r'^/+'), '');
    return '$baseUrl/$cleanPath';
  }
}
