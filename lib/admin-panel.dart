import 'package:app_continental/LowerAppBar.dart';
import 'package:app_continental/TopAppBar.dart';
import 'package:app_continental/handle_users.dart';
import 'package:app_continental/user_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: adminPanel(),
    debugShowCheckedModeBanner: false,
  ));
}

class adminPanel extends StatefulWidget {
  const adminPanel({Key? key}) : super(key: key);

  @override
  State<adminPanel> createState() => _adminPanelState();
}

class _adminPanelState extends State<adminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(75), child: TopAppBar()),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(128, 72, 128, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 250,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => handle_users(header: "Registo de Utilizador:",)),
                            );
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/register-user.png",
                                  width: 150,
                                  height: 150,
                                ),
                                Text(
                                  "Registar Utilizador",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserList()),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/users-list.png",
                                width: 150,
                                height: 150,
                              ),
                              Text(
                                "Lista de Utilizadores",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(128, 72, 128, 24),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Colors.black,
            //             width: 2.0,
            //          ),
            //        ),
                    // child: SizedBox(
                    //   width: 250,
                    //   height: 250,
                    //   child: Container(
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Image.asset(
                        //       "assets/images/create-line.png",
                        //       width: 150,
                        //       height: 150,
                        //     ),
                        //     Text(
                        //       "Gerir Linhas",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 24,
                        //       ),
                        //     )
                        //   ],
                        // ),
                    //   ),
                    // ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
