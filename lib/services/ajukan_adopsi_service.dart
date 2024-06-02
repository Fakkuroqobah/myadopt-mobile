import 'package:dio/dio.dart';

import '../../configs/api.dart';

class AjukanAdopsiService {
  final Dio _dio = Dio();

  Future<bool> add(
      int? idPengguna, int idHewan, String pekerjaan, String alasan) async {
    await _dio.post(
      Api.ajukanAdopsi,
      data: {
        "id_pengguna": idPengguna,
        "id_hewan": idHewan,
        "pekerjaan": pekerjaan,
        "alasan": alasan
      },
    );

    return true;
  }
}
