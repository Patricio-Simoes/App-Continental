import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LowerAppBar.dart';
import 'helpers/flutterfont.dart';
import 'package:http/http.dart' as http;

class handle_users extends StatefulWidget {
  String? header = "";
  handle_users({this.header});

  @override
  State<handle_users> createState() => handle_usersState();
}

class handle_usersState extends State<handle_users> {

  // Controladores que guardam as informações inseridas pelo utilizador.
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  final TextEditingController _confirmUserPassword = TextEditingController();
  final TextEditingController _userRole = TextEditingController();
  // Token do utilizador atualmente logado.
  User? user = FirebaseAuth.instance.currentUser;

  // Função responsável por registar novos utilizadores.
  void _registerUser() async{
    // Link da API.
    String url = "https://, 192.168.28.86:7071";
    String? token = await user?.getIdToken();

    http.Response response = await http.post(
        Uri.parse(url),
        // Cabeçalho da mensagem, no caso, formato JSON.
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'Authorization': (token ?? ''),
        },
        // Codificação dos campos para JSON
        body: json.encode(
        {
        "displayName": _displayName.text,
        "email": _userEmail.text,
        "password": _userPassword.text,
        "role": _userRole.text
        }
    ));

    print("Mensagem enviada com sucesso!");
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
                    onPressed: /*_registerUser*/(){},
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
                                FlutterFontIcons.admin,
                                color: Colors.black,
                              ),
                              iconSize: 40,
                              onPressed: null,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                '${widget.header}',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                    ),
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
                                // Nome do Utilizador.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Nome do Utilizador:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: TextField(
                                        controller: _displayName,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // E-mail do Utilizador.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "E-mail do Utilizador:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: TextField(
                                        controller: _userEmail,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Password do Utilizador.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Password do Utilizador:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: TextField(
                                        controller: _userPassword,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Confirmar Password do Utilizador.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Confirmar Password:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 10),
                                      child: TextField(
                                        controller: _confirmUserPassword,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Role do Utilizador.
                                TableRow(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 25),
                                      child: Text(
                                        "Role de Utilizador:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'supervisor',
                                          child: Text('Supervisor'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'funcionario',
                                          child: Text('Funcionário'),
                                        ),
                                      ],
                                      onChanged: (String? newRole) {
                                        setState(() {
                                          _userRole.text = newRole ?? '';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top:32),
                child: Text("NOTA: A gestão de utilizadores não está implementada",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
              ),
              )
            ],
          )),
    );
  }
}
