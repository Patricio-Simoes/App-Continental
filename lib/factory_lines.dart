import 'package:flutter/material.dart';
import 'package:app_continental/TopAppBar.dart';
import 'LowerAppBar.dart';

class FactoryLines extends StatefulWidget {
  const FactoryLines({super.key});

  @override
  State<FactoryLines> createState() => _FactoryLinesState();
}

class _FactoryLinesState extends State<FactoryLines> {


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
                  padding: EdgeInsets.only(left: 34),
                  child: Text(
                    'Linhas Disponíveis',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 150),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),

                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            // Clear the search query
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
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
                        'Linha 6',
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
                        'Linha 7',
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
                        'Com falta de stock',
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
                        'Linha 8',
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
                        'Avaria nv.1',
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
                        'Linha 9',
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
                        'Linha 10',
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
                        'Linha 11',
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
        ],
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}