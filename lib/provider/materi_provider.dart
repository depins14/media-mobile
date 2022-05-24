import 'package:flutter/material.dart';
import 'package:media/model/materi_model.dart';
import 'package:media/service/materi_service.dart';

class MateriProvider with ChangeNotifier {
  List<MateriModel> _materis = [];

  List<MateriModel> get materis => _materis;
  set materis(List<MateriModel> materis) {
    _materis = materis;
    notifyListeners();
  }

  Future<void> getMateris() async {
    try {
      List<MateriModel> materis = await MateriServices().getMateri();
      _materis = materis;
    } catch (e) {
      print(e);
    }
  }
}
