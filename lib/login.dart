import 'package:flutter/material.dart';
import 'TopAppBar.dart';
import 'LowerAppBar.dart';
import 'home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  //Navigator.push(
  //context,
  //MaterialPageRoute(builder: (context) => const Home())
  //)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Image.asset(
          "assets/images/logo.png",
          height: 100,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 250, right: 250),
            child: Container(
              color: Colors.orange,
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 50, left: 16, right: 16),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          "Email do Utilizador:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          "Password:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
                    child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: ElevatedButton(
                            // Lógica de SignIn
                            onPressed: null,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue)),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Efetuar Login",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 75),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        "Se não consegue fazer login, entre em contacto com um administrador",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
