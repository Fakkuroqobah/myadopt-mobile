import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/api.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Either<String, String>> add(
      int id,
      String nama,
      String jenisKelamin,
      String alamat,
      String noTelepon,
      Uint8List fotoByte,
      String fotoExtension) async {
    final data = FormData.fromMap({
      "id": id,
      "nama": nama,
      "jenis_kelamin": jenisKelamin,
      "alamat": alamat,
      "no_telepon": noTelepon,
      "foto": MultipartFile.fromBytes(fotoByte,
          filename: "image.$fotoExtension",
          contentType: MediaType('image', fotoExtension))
    });

    try {
      _dio.options.headers['accept'] = 'application/json';
      _dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await _dio.post(
        Api.ubahProfil,
        data: data,
      );

      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();

        preferences.setString("nama", nama);
        preferences.setString("jenis_kelamin", jenisKelamin);
        preferences.setString("alamat", alamat);
        preferences.setString("no_telepon", noTelepon);

        return const Right("Success");
      }

      return const Left('Terjadi kesalahan');
    } on DioException catch (_) {
      return const Left('Terjadi kesalahan pada server');
    }
  }
}
