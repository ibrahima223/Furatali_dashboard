import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
