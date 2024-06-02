import 'dart:convert';

AdopsiModel adopsiModelFromJson(String str) =>
    AdopsiModel.fromJson(json.decode(str));

String adopsiModelToJson(AdopsiModel data) => json.encode(data.toJson());

class AdopsiModel {
  int id;
  int idPengguna;
  int idHewan;
  String pekerjaan;
  String alasan;
  String status;
  String nama;
  String jenis;
  String ras;
  int umur;
  String gender;
  int berat;
  String foto;
  String keterangan;

  AdopsiModel({
    required this.id,
    required this.idPengguna,
    required this.idHewan,
    required this.pekerjaan,
    required this.alasan,
    required this.status,
    required this.nama,
    required this.jenis,
    required this.ras,
    required this.umur,
    required this.gender,
    required this.berat,
    required this.foto,
    required this.keterangan,
  });

  factory AdopsiModel.fromJson(Map<String, dynamic> json) => AdopsiModel(
        id: json["id"],
        idPengguna: json["id_pengguna"],
        idHewan: json["id_hewan"],
        pekerjaan: json["pekerjaan"],
        alasan: json["alasan"],
        status: json["status"],
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
        "id_pengguna": idPengguna,
        "id_hewan": idHewan,
        "pekerjaan": pekerjaan,
        "alasan": alasan,
        "status": status,
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
