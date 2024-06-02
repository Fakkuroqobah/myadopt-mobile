import 'package:dio/dio.dart';

import '../configs/api.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<void> register(String fullName, String gender, String address,
      String phone, String username, String password) async {
    final response = await _dio.post(
      Api.daftar,
      data: {
        'nama': fullName,
        'jenis_kelamin': gender,
        'alamat': address,
        'no_telepon': phone,
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal Register');
    }
  }
}
