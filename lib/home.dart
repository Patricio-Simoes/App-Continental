import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/helpers/flutterfont.dart';

class Home extends StatefulWidget {
  String? emailUtilizador = "";
  Home({this.emailUtilizador});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked_A1 = false;
  bool isChecked_A2 = false;
  bool isChecked_A3 = false;

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
            height: MediaQuery.of(context).size.height * 0.40,
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
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 1',
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 2',
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 3',
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 4',
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 5',
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 6',
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Linha.
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
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Linha 7',
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
                                color: Colors.black,
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
