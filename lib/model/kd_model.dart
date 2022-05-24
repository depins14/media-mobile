// ignore_for_file: non_constant_identifier_names

class KdModel {
  late int? id;
  String? kd;
  String? nama_kd;

  KdModel({
    this.id,
    this.kd,
    this.nama_kd,
  });

  KdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kd = json['kd'];
    nama_kd = json['nama_kd'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kd': kd,
      'nama_kd': nama_kd,
    };
  }
}
