import 'package:dio/dio.dart';
import 'package:flutter_covid19/models/mundo_model.dart';
import 'package:flutter_covid19/models/pais_model.dart';

class CovidApiRepository {
  final Dio _dio = Dio();
  String url = "https://corona.lmao.ninja";

  Future<Mundo> getMundo() async {
    Response response = await _dio.get('$url/all');
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Mundo.fromJson(response.data);
    }
  }

  Future<Pais> getPais({String pais}) async {
    Response response = await _dio.get('$url/countries/$pais');
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Pais.fromJson(response.data);
    }
  }
}
