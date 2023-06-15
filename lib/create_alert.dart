import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LowerAppBar.dart';
import 'helpers/flutterfont.dart';

class CreateAlert extends StatefulWidget {
  const CreateAlert({super.key});

  @override
  State<CreateAlert> createState() => _CreateAlertState();
}

class _CreateAlertState extends State<CreateAlert> {
  // Número de Linhas
  int i = 45;
  // Controllers dos campos do alerta inseridos pelo utilizador.
  String? _nLinha = "8";
  String? _prioridade = "2";

  // Método responsável por enviar novas avarias para a API.
  void sendAvaria(String? nLinha, String? prioridade) async {
    User? user = FirebaseAuth.instance.currentUser;
    String? token = await user?.getIdToken();
    String funcionarioId = user?.displayName ?? '';

    final dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${token ?? ''}";

    final data = {
      'id': 0,
      'funcionarioId': funcionarioId,
      'linhaId': int.parse(nLinha!),
      'tipo': 'Avaria',
      'prioridade': prioridade,
      'estado': true,
      'criacao': DateTime.now().toIso8601String(),
    };

    try {
      Response response = await dio
          .post('http://192.168.28.86:7071/Alert/SendAlert', data: data);
      print(response);
      print("Enviado com sucesso!");
    } on DioError catch (e) {
      print('Error: ${e.error}');
      print('Error info: ${e.response?.data}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        // Barra de Cabeçalho.
        child: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.orange,
          title: Image.asset(
            "assets/images/logo.png",
            height: 100,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.black,
                    ),
                    // Botão de submissão do formulário.
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirmação"),
                            titlePadding: EdgeInsets.all(32),
                            titleTextStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            content: Text("Tem a certeza que deseja emitir este alerta?"),
                            contentPadding: EdgeInsets.only(left: 32, right: 32),
                            contentTextStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.orange,
                            actions: [
                              Padding(
                                padding: EdgeInsets.only(right: 32, bottom: 16, top: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child:
                                  Text("Não",
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
                              // Sim
                              Padding(
                                padding: EdgeInsets.only(right: 16, bottom: 16, top: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Caso tenha inserido informações válidas.
                                    if (_prioridade != "" && _nLinha != "" && _prioridade != null && _nLinha != null) {
                                      sendAvaria(_nLinha.toString(), _prioridade.toString());
                                    }
                                    // Caso tenha inserido informações inválidas.
                                    else {
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child:
                                  Text("Sim",
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
                            ],
                          );
                        },
                      );
                    },

                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const IconButton(
                              tooltip: null,
                              icon: Icon(
                                FlutterFontIcons.alert,
                                color: Colors.black,
                              ),
                              iconSize: 40,
                              onPressed: null,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Emitir Alerta',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Table(
                              columnWidths: const {
                                0: FixedColumnWidth(300),
                                // Adjust the width as needed
                              },
                              children: [
                                // Nome do Funcionário.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Nome do Funcionário:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TextField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: FirebaseAuth
                                              .instance.currentUser?.displayName
                                              .toString(),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Nº de Linha.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Nº de Linha:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: DropdownButtonFormField<String>(
                                        items: List.generate(i, (index) {
                                          return DropdownMenuItem<String>(
                                            value: "${index + 1}",
                                            child: Text("Linha ${index + 1}"),
                                          );
                                        }),
                                        onChanged: (value) {
                                          setState(() {
                                            _nLinha = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Grau de prioridade
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Grau de Prioridade:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        items: List.generate(3, (index) {
                                          return DropdownMenuItem<String>(
                                            value: "${index + 1}",
                                            child: Text("${index + 1}"),
                                          );
                                        }),
                                        onChanged: (value) {
                                          setState(() {
                                            _prioridade = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Estado do Alerta.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Estado do Alerta:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TextField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: "Ativo",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Data de Criação.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Data de Criação:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TextField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              DateTime.now().toIso8601String(),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          )),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}
