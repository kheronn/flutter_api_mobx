import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: (this.controller.mundo != null || this.controller.pais != null)
            ? _buildBody()
            : Center(child:CircularProgressIndicator()),
        bottomNavigationBar: _buildBottomBar(),
      );
    });
  }

  Widget _buildBody() {
    return (this.controller.currentIndex == 0)
        ? _buildBodyMundo()
        : _buildBodyPais();
  }

  Widget _buildBodyMundo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader("Informações COVID-19 "),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Dados atualizados em ${controller.mundo.ultimaAtualizacao.day}/0${controller.mundo.ultimaAtualizacao.month} às ${controller.mundo.ultimaAtualizacao.hour}:${controller.mundo.ultimaAtualizacao.minute}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Card(
            elevation: 4.0,
            color: Colors.white,
            margin: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 25,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 40,
                            width: 8.0,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 30,
                            width: 8.0,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                    title: Text("Paises Afetados"),
                    subtitle: Text(controller.mundo.paisesAfetados.toString()),
                  ),
                ),
              ],
            ),
          ),
          _buildRow(Colors.brown, Icons.person_outline, "Total de Infectados",
              controller.mundo.casos.toString()),
          const SizedBox(height: 16.0),
          _buildRow(Colors.red, Icons.person_pin, "Mortes",
              controller.mundo.mortes.toString()),
          const SizedBox(height: 16.0),
          _buildRow(Colors.green, Icons.person_add, "Recuperados",
              controller.mundo.recuperados.toString()),
        ],
      ),
    );
  }

  Widget _buildBodyPais() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(controller.pais.nome,
              isPais: true, url: controller.pais.urlBandeira),
          const SizedBox(height: 20.0),
          _buildRow(Colors.brown, Icons.person_outline, "Total de Infectados",
              controller.pais.casos.toString()),
          const SizedBox(height: 16.0),
          _buildRow(Colors.red, Icons.person_pin, "Mortes",
              controller.pais.mortes.toString()),
          const SizedBox(height: 16.0),
          _buildRow(Colors.green, Icons.person_add, "Recuperados",
              controller.pais.recuperados.toString()),
        ],
      ),
    );
  }

  Padding _buildRow(Color color, IconData icon, String titulo, String data) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: <Widget>[
          Expanded(
            flex: 3,
            child: _buildTile(
              color: color,
              icon: icon,
              title: titulo,
              data: data.toString(),
            ),
          )
        ]));
  }

  Container _buildHeader(String titulo,
      {bool isPais = false, String url = ''}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(
              titulo,
              style: whiteText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 5.0),
          isPais
              ? Center(
                  child: Image.network(
                  url,
                  width: 150,
                ))
              : SizedBox()
        ],
      ),
    );
  }

  Container _buildTile(
      {Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
            ),
            title: Text(
              title,
              style: whiteText.copyWith(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              data,
              style: whiteText.copyWith(
                  fontWeight: FontWeight.w300, fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.grey.shade800,
      unselectedItemColor: Colors.grey,
      currentIndex: this.controller.currentIndex,
      onTap: this.controller.changePage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.group_work),
          title: Text("Mundo"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          title: Text("Pais"),
        ),
      ],
    );
  }
}
