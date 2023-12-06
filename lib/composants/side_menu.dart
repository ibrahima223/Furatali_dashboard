import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addMaladie.dart';
import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addmedicament.dart';
import 'package:dashboard_furatali/Pages/dashboard/dashboardscreen.dart';
import 'package:dashboard_furatali/controllers/dashboard_controller.dart';
import 'package:dashboard_furatali/controllers/side_bar_controller.dart';
import 'package:dashboard_furatali/helpers/authentification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                press: () {
                  context.read<SideBarController>().sideBarIndex = 0;
                }),
            DrawerListTile(
                title: "Médicaments",
                icon: const Icon(Icons.medication_outlined),
                press: () {
                  context.read<SideBarController>().sideBarIndex = 1;
                }),
            DrawerListTile(
                title: "Maladies",
                icon: const Icon(Icons.coronavirus_outlined),
                press: () {
                  context.read<SideBarController>().sideBarIndex = 2;
                }),
            DrawerListTile(
                title: "Utilisateurs",
                icon: const Icon(Icons.account_circle_outlined),
                press: () {
                  context.read<SideBarController>().sideBarIndex = 3;
                }),
            DrawerListTile(
                title: "Rappels",
                icon: const Icon(Icons.alarm_add_outlined),
                press: () {
                  context.read<SideBarController>().sideBarIndex = 4;
                }),
            DrawerListTile(
                title: "Déconnexion",
                icon: const Icon(Icons.logout),
                press: () {
                  FirebaseAuth.instance.signOut();
                })
          ],
        ),
      ),
    );
  }
}
