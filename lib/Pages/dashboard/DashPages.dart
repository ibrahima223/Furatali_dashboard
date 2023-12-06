import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addmedicament.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/listMal.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/listMedoc.dart';
import 'package:dashboard_furatali/Pages/dashboard/dashboardscreen.dart';
import 'package:dashboard_furatali/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashPages extends StatelessWidget{
  final List<Widget> pages = [const DashboardScreen(),const AjouterMedicament()];
  @override
  Widget build(BuildContext context) {
    return pages[context.watch<DashboardController>().indiceDashPages];
  }
}
