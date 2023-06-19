import 'package:flutter/material.dart';
import 'package:app_continental/TopAppBar.dart';
import 'LowerAppBar.dart';
import 'helpers/flutterfont.dart';

class FactoryLines extends StatefulWidget {
  const FactoryLines({super.key});

  @override
  State<FactoryLines> createState() => _FactoryLinesState();
}

class _FactoryLinesState extends State<FactoryLines> {

  // Número de linhas de produção disponíveis.
  int nLinhas = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(preferredSize: Size.fromHeight(75), child: TopAppBar()),
      body: Column(
        children: [
          // Cabeçalho "Linhas Disponíveis".
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
                                    'Linha ${i+1}',
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
    );
  }
}