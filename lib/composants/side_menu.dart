import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawerlist.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/Logo.png'),
            ),
            DrawerListTile(
                title: "Dashboard",
                icon: const Icon(Icons.grid_view_outlined),
                press: (){}
            ),
            DrawerListTile(
                title: "Médicaments",
                icon: const Icon(Icons.medication_outlined),
                press: (){
                }
            ),
            DrawerListTile(
                title: "Maladies",
                icon: const Icon(Icons.coronavirus_outlined),
                press: (){}
            ),
            DrawerListTile(
                title: "Utilisateurs",
                icon: const Icon(Icons.account_circle_outlined),
                press: (){}
            ),
            DrawerListTile(
                title: "Rappels",
                icon: const Icon(Icons.alarm_add_outlined),
                press: (){}
            ),
            DrawerListTile(
                title: "Déconnexion",
                icon: const Icon(Icons.logout),
                press: (){}
            )
          ],
        ),
      ),
    );
  }
}
