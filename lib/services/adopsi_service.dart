import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/api.dart';
import '../models/adopsi_model.dart';

class AdopsiService {
  final Dio _dio = Dio();

  Future<List<AdopsiModel>> getAdopsi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final response =
        await _dio.get(Api.adopsi + preferences.getInt('id').toString());

    List<AdopsiModel> data = <AdopsiModel>[];
    response.data.forEach((val) {
      data.add(AdopsiModel.fromJson(val));
    });

    return data;
  }
}
