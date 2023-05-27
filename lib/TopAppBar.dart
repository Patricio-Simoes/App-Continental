import 'dart:math';
import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.orange,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Image.asset(
        "assets/images/logo.png",
        height: 100,
      ),
    );
  }
}
