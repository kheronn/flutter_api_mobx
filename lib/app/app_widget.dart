import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Rota inicial
      initialRoute: "/",
      //adicione o Modular para que ele possa gerenciar o sistema de rotas.
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
