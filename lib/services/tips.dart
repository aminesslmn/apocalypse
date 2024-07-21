import 'package:apocalypsea2sv/config/api_config.dart';
import 'package:dio/dio.dart';

class TipService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchDailyTip() async {
    try {
      final response = await _dio.get(APIConfig.APIURL_GET_TIPS);
      if (response.statusCode == 200) {
        return response.data['data']
            ["llm_response"]; // Adjust this based on actual response
      } else {
        throw Exception('Failed to load tip');
      }
    } catch (e) {
      throw Exception('Failed to load tip: $e');
    }
  }
}
