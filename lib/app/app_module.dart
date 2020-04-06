import 'package:flutter/material.dart';
import 'package:flutter_covid19/pages/home_controller.dart';
import 'package:flutter_covid19/pages/home_page.dart';
import 'package:flutter_covid19/respositories/covidapi_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {

  //aqui ficarão todas as classes que deseja Injetar no seu projeto (ex: bloc, dependency)
  @override
  List<Bind> get binds => [
      Bind((i) => CovidApiRepository()), //usando bloc
      Bind((i) => HomeController()), //usando bloc
  ];

  //aqui ficarão as rotas do seu módulo
  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => HomePage()),     
  ];

  //adicione seu widget principal aqui  
  @override
  Widget get bootstrap => AppWidget();
}
