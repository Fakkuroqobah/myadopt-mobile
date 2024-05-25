import 'package:dio/dio.dart';

import '../../configs/api.dart';
import '../models/hewan_model.dart';

class HewanService {
  final Dio _dio = Dio();

  Future<List<HewanModel>> getHewan() async {
    final response = await _dio.get(Api.hewan);

    List<HewanModel> data = <HewanModel>[];
    response.data.forEach((val) {
      data.add(HewanModel.fromJson(val));
    });

    return data;
  }
}
