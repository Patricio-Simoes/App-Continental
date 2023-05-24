import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            width: double.infinity,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 0, 16),
                  child: Text(
                    'Alertas Recebidos',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/images/warning.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    'Linha 17 - Avaria nv.2',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/images/warning.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    'Linha 31 - Avaria nv.1',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/images/warning.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    'Linha 21 - Com Falta de Stock',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/images/warning.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    'Linha 22 - Com Falta de Stock',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(
                    'assets/images/warning.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    'Linha 25 - Com Falta de Stock',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Add more rows as needed
        ],
      ),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}