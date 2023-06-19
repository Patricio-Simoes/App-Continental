import 'package:app_continental/TopAppBar.dart';
import 'package:flutter/material.dart';
import 'LowerAppBar.dart';
import 'helpers/flutterfont.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<String> funcionarios = ["José Rocha", "Patrício Simões"];
  List<String> emails = ["jose.func@utad.pt", "patricio.func@utad.pt"];

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
                    onPressed: /*_registerUser*/ () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          FlutterFontIcons.admin,
                          color: Colors.black,
                        ),
                        iconSize: 40,
                        onPressed: null,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Lista de Utilizadores:',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
            child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  for (int i = 0; i < funcionarios.length; i++)
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
                              'assets/images/operario.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              funcionarios[i].toString(),
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
                            child: Text(
                              emails[i].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      "NOTA: A listagem de utilizadores não está implementada",
                      style: TextStyle(
                          color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ]),
    );
  }
}
