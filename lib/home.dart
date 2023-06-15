import 'dart:convert';
import 'dart:math';
import 'package:app_continental/create_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/helpers/flutterfont.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'AvariaNotification.dart';

class Home extends StatefulWidget {
  String? emailUtilizador = "";

  Home({this.emailUtilizador});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Número de linhas de produção disponíveis.
  int nLinhas = 45;

  Future<String?> getToken() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.getIdToken();
  }

  // Método responsável por receber as avarias enviadas pela API.
  Future<List<AvariaNotification>> getAvarias() async {
    final token = await getToken();
    final url = Uri.http('192.168.28.86:7071', 'Alert/GetMaintenanceMessages');
    print("Token: $token");

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    print("Código de resposta: ${response.statusCode}");
    final body = jsonDecode(response.body);
    print("Corpo de mensagem: $body");

    if (body is List) {
      final notifications = body
          .map<AvariaNotification>((json) => AvariaNotification.fromJson(json))
          .toList();

      return notifications;
    } else {
      throw Exception('Invalid response body');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.orange,
          title: Image.asset(
            "assets/images/logo.png",
            height: 100,
          ),
          leading: Transform.rotate(
            angle: -pi,
            child: IconButton(
              icon: Icon(
                Icons.login,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    "Bem-Vindo, ${widget.emailUtilizador}!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho "Alertas Recebidos".
          Container(
            color: Colors.grey,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        IconButton(
                          tooltip: null,
                          icon: Icon(
                            FlutterFontIcons.alert,
                            color: Colors.black,
                          ),
                          iconSize: 40,
                          onPressed: null,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'Alertas Recebidos:',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAlert(),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Text(
                                "Emitir Alerta",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAlert(),
                                ),
                              );
                            },
                            child: IconButton(
                              tooltip: null,
                              icon: Icon(
                                Icons.add_alert,
                                size: 35,
                                color: Colors.black,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                      ],
                  )
                )
              ],
            ),
          ),
          // Área de apresentação de alertas recebidos (40%) da tela.
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<AvariaNotification>>(
                    future: getAvarias(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final alertas = snapshot.data!;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: ListView.builder(
                            itemCount: alertas.length,
                            itemBuilder: (context, index) {
                              final avaria = alertas[index];
                              Color avariaTileColor;
                              if (avaria.prioridade == '1') {
                                avariaTileColor = Colors.green;
                              } else if (avaria.prioridade == '2') {
                                avariaTileColor = Colors.yellow;
                              } else if (avaria.prioridade == '3') {
                                avariaTileColor = Colors.red;
                              } else {
                                avariaTileColor = Colors.transparent;
                              }
                              return Container(
                                color: avariaTileColor,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.add_alert,
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    "Linha ${avaria.linhaID.toString()}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Avaria nv.${avaria.prioridade.toString()}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                  trailing: Checkbox(
                                    value: !avaria.estado ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        avaria.estado = !(value ?? true);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          // Cabeçalho "Linhas disponíveis".
          Container(
            color: Colors.grey,
            width: double.infinity,
            child: const Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        IconButton(
                          tooltip: null,
                          icon: Icon(
                            FlutterFontIcons.lines,
                            color: Colors.black,
                          ),
                          iconSize: 40,
                          onPressed: null,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'Linhas Disponíveis:',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          // Área de apresentação de linhas disponíveis.
          Container(
              child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    for (int i = 0; i < nLinhas; i++)
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                'assets/images/tap.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Linha ${i + 1}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Sem Problemas',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}
