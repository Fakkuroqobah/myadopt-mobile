import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../configs/api.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Either<String, String>> add(
      String nama,
      String jenisKelamin,
      String alamat,
      String noTelepon,
      Uint8List fotoByte,
      String fotoExtension) async {
    final data = FormData.fromMap({
      "name": nama,
      "jenis_kelamin": jenisKelamin,
      "alamat": alamat,
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

      if (response.statusCode == 201) {
        return const Right("Success");
      }

      return const Left('Terjadi kesalahan');
    } on DioException catch (_) {
      return const Left('Terjadi kesalahan pada server');
    }
  }
}
