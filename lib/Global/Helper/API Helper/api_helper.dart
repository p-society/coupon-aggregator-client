import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiHelper {
  static final baseUrl = dotenv.env['Base_URL'] as String;
  static Map<String, String> getApiHeader({required String jwt}) {
    Map<String, String> header = {
      "content-type": "application/json",
      "Authorization": "Bearer $jwt",
    };
    return header;
  }

  static Uri getUri({
    required Map<String, dynamic> queryParams,
    required String urlEndpoint,
  }) {
    final uri = Uri.parse('$baseUrl$urlEndpoint')
        .replace(queryParameters: queryParams);
    return uri;
  }
}
