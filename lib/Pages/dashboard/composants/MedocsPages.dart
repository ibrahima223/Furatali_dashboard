import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addMaladie.dart';
import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addmedicament.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/updateMedoc.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/updatemaladie.dart';
import 'package:dashboard_furatali/controllers/dashboard_controller.dart';
import 'package:dashboard_furatali/controllers/medoc_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedocPages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return context.watch<MedocController>().pageToShow;
  }
}