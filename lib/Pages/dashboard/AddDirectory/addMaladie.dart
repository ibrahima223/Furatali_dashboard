import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../composants/side_menu.dart';
import '../../../dashboard_controller.dart';
import '../composants/addMaladie.dart';
import '../composants/hearder.dart';
class AjouterMaladie extends StatefulWidget {
  const AjouterMaladie({super.key});

  @override
  State<AjouterMaladie> createState() => _AjouterMaladieState();
}

class _AjouterMaladieState extends State<AjouterMaladie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      key: context.read<DashboardController>().scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            AddMaladie(),
          ],
        ),
      ),
    );
  }
}
