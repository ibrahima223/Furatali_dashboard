import 'package:dashboard_furatali/composants/side_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../dashboard_controller.dart';
import '../composants/addMedoc.dart';
import '../composants/hearder.dart';

class AjouterMedicament extends StatefulWidget {
  const AjouterMedicament({super.key});

  @override
  State<AjouterMedicament> createState() => _AjouterMedicamentState();
}

class _AjouterMedicamentState extends State<AjouterMedicament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      key: context.read<DashboardController>().scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            AddMedoc(),
          ],
        ),
      ),
    );
  }
}
