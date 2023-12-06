import 'package:dashboard_furatali/Pages/dashboard/composants/listMal.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/listMedoc.dart';
import 'package:dashboard_furatali/composants/side_menu.dart';
import 'package:flutter/material.dart';

import '../composants/hearder.dart';
class ListeMaladie extends StatefulWidget {
  const ListeMaladie({super.key});

  @override
  State<ListeMaladie> createState() => _ListeMaladieState();
}

class _ListeMaladieState extends State<ListeMaladie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            ListMal(),
          ],
        ),
      ),
    );
  }
}
