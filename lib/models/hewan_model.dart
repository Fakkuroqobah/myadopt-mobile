import 'dart:convert';

HewanModel hewanModelFromJson(String str) =>
    HewanModel.fromJson(json.decode(str));

String hewanModelToJson(HewanModel data) => json.encode(data.toJson());

class HewanModel {
  int id;
  String nama;
  String jenis;
  String ras;
  int umur;
  String gender;
  int berat;
  String foto;
  String keterangan;

  HewanModel({
    required this.id,
    required this.nama,
    required this.jenis,
    required this.ras,
    required this.umur,
    required this.gender,
    required this.berat,
    required this.foto,
    required this.keterangan,
  });

  factory HewanModel.fromJson(Map<String, dynamic> json) => HewanModel(
        id: json["id"],
        nama: json["nama"],
        jenis: json["jenis"],
        ras: json["ras"],
        umur: json["umur"],
        gender: json["gender"],
        berat: json["berat"],
        foto: json["foto"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis": jenis,
        "ras": ras,
        "umur": umur,
        "gender": gender,
        "berat": berat,
        "foto": foto,
        "keterangan": keterangan,
      };
}
