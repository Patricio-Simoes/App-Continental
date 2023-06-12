import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

// import 'app_bar.dart';
Future main() async{
  // Comunicação com o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Redirecionamento para o menu de login.
  runApp(MaterialApp(
    home: login(),
    debugShowCheckedModeBanner: false,
  ));
}