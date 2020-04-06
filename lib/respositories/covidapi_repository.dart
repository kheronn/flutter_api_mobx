import 'package:dio/dio.dart';
import 'package:flutter_covid19/models/mundo_model.dart';
import 'package:flutter_covid19/models/pais_model.dart';

class CovidApiRepository {
  final Dio _dio = Dio();
  String url = "https://corona.lmao.ninja";

  Future<Mundo> getMundo() async {
    try {
      Response response = await _dio.get('$url/all');
      return Mundo.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }

  Future<Pais> getPais({String pais}) async {
    try {
      Response response = await _dio.get('$url/countries/$pais');
      return Pais.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }
}
