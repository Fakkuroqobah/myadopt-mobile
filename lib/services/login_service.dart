import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/api.dart';
import '../../models/login_model.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<bool> login(String txtUsername, String txtPassword) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final response = await _dio.post(
      Api.login,
      data: {"username": txtUsername, "password": txtPassword},
    );

    LoginModel loginModel = LoginModel.fromJson(response.data);

    preferences.setInt("id", loginModel.data.id);
    preferences.setString("nama", loginModel.data.nama);
    preferences.setString("jenis_kelamin", loginModel.data.jenisKelamin);
    preferences.setString("alamat", loginModel.data.alamat);
    preferences.setString("no_telepon", loginModel.data.noTelepon);
    preferences.setString("username", loginModel.data.username);

    return true;
  }
}
