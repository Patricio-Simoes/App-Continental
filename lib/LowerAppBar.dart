import 'package:flutter/material.dart';
import 'package:app_continental/helpers/flutterfont.dart';
import 'package:app_continental/factory_lines.dart';
import 'admin-panel.dart';
import 'alerts.dart';

class LowerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LowerAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 75,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            tooltip: 'Painel de Administração',
            icon: const Icon(FlutterFontIcons.admin),
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const adminPanel()),
              );
            },
          ),
          IconButton(
            tooltip: 'Gestão de Linhas',
            icon: const Icon(FlutterFontIcons.lines),
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FactoryLines()),
              );
            },
          ),
          IconButton(
            tooltip: 'Alertas Recebidos',
            icon: const Icon(FlutterFontIcons.alert),
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Alerts()),
              );},
          ),
        ],
      ),
    );
  }
}