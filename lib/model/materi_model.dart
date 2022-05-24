// ignore_for_file: non_constant_identifier_names

import 'package:media/model/kd_model.dart';
import 'package:media/model/soal_model.dart';

class MateriModel {
  late int? id;
  late String? judul;
  late String? ringkasan_materi;
  late String? materi;
  late String? thumbnail;
  late String? video;
  late String? soal;
  late KdModel? kd;
  late List<SoalModel>? questions;

  MateriModel({
    this.id,
    this.judul,
    this.ringkasan_materi,
    this.materi,
    this.thumbnail,
    this.video,
    this.soal,
    this.kd,
    this.questions,
  });

  MateriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    ringkasan_materi = json['ringkasan_materi'];
    materi = json['materi'];
    thumbnail = json['thumbnail'];
    video = json['video'];
    soal = json['soal'];
    kd = KdModel.fromJson(json['kd']);
    questions = json['questions']
        ?.map<SoalModel>((question) => SoalModel.fromJson(question))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'ringkasan_materi': ringkasan_materi,
      'materi': materi,
      'thumbnail': thumbnail,
      'video': video,
      'soal': soal,
      'kd': kd?.toJson(),
      'questions': questions?.map((question) => question.toJson()).toList(),
    };
  }
}
