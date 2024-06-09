import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../configs/api.dart';

class AjukanAdopsiService {
  final Dio _dio = Dio();

  Future<Either<String, String>> add(
      int? idPengguna,
      int idHewan,
      String pekerjaan,
      String alasan,
      String hobi,
      String alamat,
      Uint8List fotoByte,
      String fotoExtension,
      String penghasilan) async {
    final data = FormData.fromMap({
      "id_pengguna": idPengguna,
      "id_hewan": idHewan,
      "pekerjaan": pekerjaan,
      "alasan": alasan,
      "hobi": hobi,
      "alamat": alamat,
      "penghasilan": penghasilan,
      "ktp": MultipartFile.fromBytes(fotoByte,
          filename: "image.$fotoExtension",
          contentType: MediaType('image', fotoExtension))
    });

    try {
      _dio.options.headers['accept'] = 'application/json';
      _dio.options.headers['Content-Type'] = 'multipart/form-data';
      final response = await _dio.post(
        Api.ajukanAdopsi,
        data: data,
      );

      if (response.statusCode == 200) {
        return const Right("Success");
      }

      return const Left('Terjadi kesalahan');
    } on DioException catch (_) {
      return const Left('Terjadi kesalahan pada server');
    }
  }
}
