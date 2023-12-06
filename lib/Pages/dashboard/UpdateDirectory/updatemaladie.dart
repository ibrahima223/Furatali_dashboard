import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../composants/side_menu.dart';
import '../../../controllers/dashboard_controller.dart';
import '../composants/hearder.dart';
import '../composants/updatemaladie.dart';

class ModifierMaladie extends StatefulWidget {
  const ModifierMaladie({super.key});

  @override
  State<ModifierMaladie> createState() => _ModifierMaladieState();
}

class _ModifierMaladieState extends State<ModifierMaladie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            UpdateMaladie(),
          ],
        ),
      ),
    );
  }
}
