import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements  PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Image.asset(
        "assets/images/logo.png",
        height: 100,
      ),
      actions: const <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: Text(
                "Bem-Vindo!",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            IconButton(
              icon: Icon(Icons.login,
              size: 25,
              ),
              tooltip: 'Efetuar Logout',
              onPressed: (null),
            )
          ],
        )
      ],
    );
  }
}