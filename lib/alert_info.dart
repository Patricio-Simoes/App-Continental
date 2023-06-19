import 'package:flutter/material.dart';
import 'LowerAppBar.dart';
import 'helpers/flutterfont.dart';

class DisplayAlertInfo extends StatefulWidget {
  String? funcionarioId = "";
  String? linhaId = "";
  String? tipo = "";
  String? prioridade = "";
  String? estado = "";
  String? criacao = "";
  DisplayAlertInfo(this.funcionarioId, this.linhaId, this.tipo, this.prioridade, this.estado, this.criacao);

  @override
  State<DisplayAlertInfo> createState() => _DisplayAlertInfoState();
}

class _DisplayAlertInfoState extends State<DisplayAlertInfo> {
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
                                'Detalhes do Alerta',
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
                                // Email do Funcionário.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Email do Funcionário:",
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
                                            hintText: widget.funcionarioId,
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
                                      child: TextField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: "Linha ${widget.linhaId}",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
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
                                          vertical: 10),
                                      child: TextField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: widget.prioridade,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
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
    );
  }
}
