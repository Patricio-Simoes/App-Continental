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
      ]),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}
