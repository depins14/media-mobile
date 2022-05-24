import 'dart:convert';

import 'package:media/model/materi_model.dart';
import 'package:http/http.dart' as http;

class MateriServices {
  String baseUrl = 'http://media-backend.web.id/api';

  Future<List<MateriModel>> getMateri() async {
    var url = '$baseUrl/course';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<MateriModel> materis = [];

      for (var item in data) {
        materis.add(MateriModel.fromJson(item));
      }

      return materis;
    } else {
      throw Exception('Terjadi kesalahan');
    }
  }
}
