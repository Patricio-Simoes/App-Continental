import 'dart:convert';
import 'dart:math';
import 'package:app_continental/alert_info.dart';
import 'package:app_continental/create_alert.dart';
import 'package:dart_amqp/dart_amqp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/helpers/flutterfont.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'AvariaNotification.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<AvariaNotification> alertas = List.empty();

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

  void _setupRabbitMQ() async {
    ConnectionSettings settings = ConnectionSettings(
      host: "192.168.28.86",
    );
    Client client = Client(settings: settings);
    client.channel().then((Channel channel) async {
      Queue queue = await channel.queue(
        "notification",
      );
      Exchange exchange = await channel.exchange(
        "alertas",
        ExchangeType.TOPIC,
      );
      Consumer consumer = await exchange.bindQueueConsumer(
        "notification",
        ["alerts.maintenance.new"],
      );
      print("Rabbit listening...");
      consumer.listen((AmqpMessage message) {
        print("[x] Received Alert: ${message.payloadAsJson}");

        var payload = message.payloadAsString != null
            ? jsonDecode(message.payloadAsString)
            : null;
        String? linhaId = payload != null ? payload['linhaId'] : null;

        navigateToPage();

      });
    });
  }

  void navigateToPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home(emailUtilizador: FirebaseAuth.instance.currentUser
          ?.displayName.toString())),
    );
  }

  // Método responsável por receber as avarias enviadas pela API.
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


  // Método responsável por marcar avarias existentes como resolvidas.
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
      print('Error: ${e.error}');
      print('Error info: ${e.response?.data}');
    }

    navigateToPage();

  }

  List generateLinhas(List linhas){
    for(int i = 0; i <= nLinhas; i++) {
      Map<String, dynamic> linha = Map();
      linha["titulo"] = "${i}";
      linha["estado"] = "Sem Problemas";
      linhas.add(linha);
    }

    return linhas;
  }

  @override

  Widget build(BuildContext context) {

    List Linhas = generateLinhas([]);

    _setupRabbitMQ();
    navigatorKey: navigatorKey;

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
                        alertas = snapshot.data!;
                        alertas.sort((a, b) => int.parse(b.prioridade).compareTo(int.parse(a.prioridade)));
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: ListView.builder(
                            itemCount: alertas.length,
                            itemBuilder: (context, index) {
                              final avaria = alertas[index];
                              Color avariaTileColor;
                              if (avaria.prioridade == '1') {
                                Linhas[avaria.linhaID]["estado"] = "Avaria nv.1";
                                avariaTileColor = Colors.green;
                              } else if (avaria.prioridade == '2') {
                                avariaTileColor = Colors.yellow;
                                Linhas[avaria.linhaID]["estado"] = "Avaria nv.2";
                              } else if (avaria.prioridade == '3') {
                                avariaTileColor = Colors.red;
                                Linhas[avaria.linhaID]["estado"] = "Avaria nv.3";
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
                                                  setState(() {
                                                    alertas.removeWhere((avaria) => avaria.id.toString() == avaria.id.toString());
                                                  });
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
                              child: Text(Linhas[i + 1]["titulo"].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(Linhas[i + 1]["estado"].toString(),
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
