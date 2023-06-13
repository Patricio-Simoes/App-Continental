import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  // Responsável por receber as credenciais no campo de email.
  TextEditingController _emailController = TextEditingController();
  // Responsável por receber as credenciais no campo de password.
  TextEditingController _passwordController = TextEditingController();

  Future _efetuarLogin() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
    }
    on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found' || e.code == 'invalid-email' || e.code == 'wrong-password' || e.code == 'unknown'){
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("ERRO :: Credenciais Inválidas"),
              titlePadding: EdgeInsets.all(32),
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              content: Text("As credenciais que inseriu não estão corretas. Por favor, tente novamente, ou contacte um Administrador do sistema."),
              contentPadding: EdgeInsets.only(left: 32, right: 32),
              contentTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              backgroundColor: Colors.orange,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 32, bottom: 16),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:
                    Text("OK",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                )
              ],
            );},
        );
      }
      else {
        // Handle other FirebaseAuthException codes if needed
        print('A autenticação falhou com o código de erro: ${e.code}');
      }
    }
  }

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
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(
                          controller: _emailController,
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
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(
                          controller: _passwordController,
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
                            // Função que trata da lógica de Login.
                            onPressed: _efetuarLogin,
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
