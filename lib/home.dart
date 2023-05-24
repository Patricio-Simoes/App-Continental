import 'package:flutter/material.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:app_continental/LowerAppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 0, 16),
                  child: Text(
                    'Linhas Disponíveis',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/tap.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Linha 1',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Sem Problemas',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/tap.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Linha 2',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Com falta de Stock',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/tap.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Linha 3',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Avaria nv. 1',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/tap.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Linha 4',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Sem Problemas',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        'assets/images/tap.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Linha 5',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Avaria nv.3',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
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
        ],
      ),
      bottomNavigationBar: const LowerAppBar(),
    );
  }
}