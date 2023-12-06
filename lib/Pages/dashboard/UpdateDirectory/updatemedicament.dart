import 'package:dashboard_furatali/Pages/dashboard/composants/updateMedoc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../composants/side_menu.dart';
import '../../../controllers/dashboard_controller.dart';
import '../composants/hearder.dart';
class ModifierMedicament extends StatefulWidget {
  const ModifierMedicament({super.key});

  @override
  State<ModifierMedicament> createState() => _ModifierMedicamentState();
}

class _ModifierMedicamentState extends State<ModifierMedicament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      // key: context.read<DashboardController>().scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            UpdateMedoc(),
          ],
        ),
      ),
    );
  }
}
