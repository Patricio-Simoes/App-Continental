import 'dart:convert';
import 'dart:math';
import 'package:app_continental/home.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:dart_amqp/dart_amqp.dart';


Future main() async{
    // Comunicação com o Firebase
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp(MaterialApp(
      // Verifica se o utilizador já está autenticado.
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // Caso esteja, redireciona para a página principal.
            if (snapshot.hasData) {
              print(FirebaseAuth.instance.currentUser);
              return Home(emailUtilizador: FirebaseAuth.instance.currentUser
                  ?.displayName.toString());
            }
            else {
              // Caso não esteja, apresenta uma mensagem de erro e redireciona para a página de login.
              return login();
            }
          }
      ),
      debugShowCheckedModeBanner: false,
    ));
  }