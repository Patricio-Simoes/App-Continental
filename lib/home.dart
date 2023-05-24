import 'package:flutter/material.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:app_continental/LowerAppBar.dart';

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