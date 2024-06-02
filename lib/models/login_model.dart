class LoginModel {
  final String message;
  final UserData data;

  LoginModel({required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final int id;
  final String nama;
  final String jenisKelamin;
  final String alamat;
  final String noTelepon;
  final String foto;
  final String username;

  UserData({
    required this.id,
    required this.nama,
    required this.jenisKelamin,
    required this.alamat,
    required this.noTelepon,
    required this.foto,
    required this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      nama: json['nama'],
      jenisKelamin: json['jenis_kelamin'],
      alamat: json['alamat'],
      noTelepon: json['no_telepon'],
      foto: json['foto'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'jenis_kelamin': jenisKelamin,
      'alamat': alamat,
      'no_telepon': noTelepon,
      'foto': foto,
      'username': username,
    };
  }
}
