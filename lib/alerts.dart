import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:flutter/material.dart';
import 'AvariaNotification.dart';
import 'alert_info.dart';
import 'helpers/flutterfont.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

Future<String?> getToken() async {
  User? user = FirebaseAuth.instance.currentUser;
  return user?.getIdToken();
}

Future<List<AvariaNotification>> getAvarias() async {
  final token = await getToken();
  final url = Uri.http('192.168.28.86:7071', 'Alert/GetMaintenanceMessages');

  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );

  final body = jsonDecode(response.body);

  if (body is List) {
    final notifications = body
        .map<AvariaNotification>((json) => AvariaNotification.fromJson(json))
        .toList();

    return notifications;
  } else {
    throw Exception('Invalid response body');
  }
}

void updateAvaria(String? nLinha) async {
  User? user = FirebaseAuth.instance.currentUser;
  String? token = await user?.getIdToken();
  String funcionarioId = user?.displayName ?? '';

  final dio = Dio();

  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "Bearer ${token ?? ''}";

  try {
    Response response = await dio
        .put('http://192.168.28.86:7071/Alert/AcknowledgeMaintenanceMessage?id=${int.parse(nLinha!)}');
  } on DioError catch (e) {
  }
}

class _AlertsState extends State<Alerts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(75), child: TopAppBar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho "Alertas Recebidos".
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
                        )
                      ],
                    )),
              ],
            ),
          ),
          // Área de apresentação de alertas recebidos.
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<AvariaNotification>>(
                    future: getAvarias(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<AvariaNotification> alertas = snapshot.data!;
                        alertas.sort((a, b) => int.parse(b.prioridade).compareTo(int.parse(a.prioridade)));
                        return SizedBox(
                          // Valor temporário.
                          height: MediaQuery.of(context).size.height * 0.853,
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
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Linha ${avaria.linhaID.toString()}'),
                                          titlePadding: EdgeInsets.all(32),
                                          titleTextStyle: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          content: Text('Pretende marcar este alerta como resolvido ou ver mais detalhes?'),
                                          contentPadding: EdgeInsets.only(left: 32, right: 32),
                                          contentTextStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          backgroundColor: Colors.orange,
                                          actions: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 16, right: 32, bottom: 16),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  updateAvaria(avaria.id.toString());
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                Text("Marcar como Resolvido",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 32, vertical: 12),
                                                  backgroundColor: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => DisplayAlertInfo(avaria.funcionarioId, avaria.linhaID.toString(), avaria.tipo, avaria.prioridade, avaria.estado.toString(), avaria.criacao),
                                                      )
                                                  );
                                                },
                                                child:
                                                Text("Ver Detalhes",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 32, vertical: 12),
                                                  backgroundColor: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
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
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(top: 200),
                              child: CircularProgressIndicator(),
                            )
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
