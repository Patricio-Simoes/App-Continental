import 'package:flutter/material.dart';
import 'TopAppBar.dart';
import 'LowerAppBar.dart';

// import 'app_bar.dart';
void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Center(),
      bottomNavigationBar: LowerAppBar(),
    );
  }
}