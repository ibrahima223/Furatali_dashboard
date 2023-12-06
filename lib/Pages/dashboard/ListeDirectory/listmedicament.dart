import 'package:dashboard_furatali/Pages/dashboard/composants/listMedoc.dart';
import 'package:dashboard_furatali/composants/side_menu.dart';
import 'package:flutter/material.dart';

import '../composants/hearder.dart';
class ListeMedicament extends StatefulWidget {
  const ListeMedicament({super.key});

  @override
  State<ListeMedicament> createState() => _ListeMedicamentState();
}

class _ListeMedicamentState extends State<ListeMedicament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            ListMedoc(),
          ],
        ),
      ),
    );
  }
}
