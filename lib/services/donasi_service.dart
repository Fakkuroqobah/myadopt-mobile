import 'package:dio/dio.dart';

import '../../configs/api.dart';

class MidtransService {
  final Dio dio = Dio();

  Future<String?> getSnapToken() async {
    try {
      final response = await dio.get(Api.donasi);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['token'] != null) {
          return data['token']; // Kembalikan token
        } else {
          // print("Error: ${data['error']}");
          return null;
        }
      } else {
        // print("Failed to connect to server: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // print("Error occurred: $e");
      return null;
    }
  }
}
