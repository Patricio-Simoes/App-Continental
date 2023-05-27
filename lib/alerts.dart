import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:flutter/material.dart';

import 'helpers/flutterfont.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool isChecked_A1 = false;
  bool isChecked_A2 = false;
  bool isChecked_A3 = false;

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
          // Área de apresentação de alertas recebidos (40%) da tela.
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Alerta.
                    Container(
                        color: Colors.red,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 0, 8),
                                child: Image.asset(
                                  'assets/images/warning.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  'Linha 19 - Avaria nv.3',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                child: Transform.scale(
                                  scale: 1.5,
                                  // Adjust the scale factor to fit the container
                                  child: Checkbox(
                                    value: isChecked_A1,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isChecked_A1 = newValue!;
                                      });
                                    },
                                    activeColor: Colors.grey,
                                    materialTapTargetSize: MaterialTapTargetSize
                                        .shrinkWrap, // Increases the checkbox size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    // Alerta.
                    Container(
                        color: Colors.red,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 0, 8),
                                child: Image.asset(
                                  'assets/images/warning.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  'Linha 17 - Avaria nv.2',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                child: Transform.scale(
                                  scale: 1.5,
                                  // Adjust the scale factor to fit the container
                                  child: Checkbox(
                                    value: isChecked_A2,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isChecked_A2 = newValue!;
                                      });
                                    },
                                    activeColor: Colors.grey,
                                    materialTapTargetSize: MaterialTapTargetSize
                                        .shrinkWrap, // Increases the checkbox size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    // Alerta.
                    Container(
                        color: Colors.yellow,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 0, 8),
                                child: Image.asset(
                                  'assets/images/warning.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  'Linha 31 - Avaria nv.1',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                child: Transform.scale(
                                  scale: 1.5,
                                  // Adjust the scale factor to fit the container
                                  child: Checkbox(
                                    value: isChecked_A3,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isChecked_A3 = newValue!;
                                      });
                                    },
                                    activeColor: Colors.grey,
                                    materialTapTargetSize: MaterialTapTargetSize
                                        .shrinkWrap, // Increases the checkbox size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}
