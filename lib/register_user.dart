import 'package:flutter/material.dart';

import 'LowerAppBar.dart';
import 'TopAppBar.dart';

class register_user extends StatefulWidget {
  const register_user({Key? key}) : super(key: key);

  @override
  State<register_user> createState() => _register_userState();
}

class _register_userState extends State<register_user> {
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
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
                        children: const [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Text(
                                  "Nome do Utilizador:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Text(
                                  "E-mail do Utilizador:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Text(
                                  "Password do Utilizador:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Text(
                                  "Confirmar Password:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ],
          )
      ),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}
