import 'package:dashboard_furatali/Pages/dashboard/composants/statistiques.dart';
import 'package:flutter/material.dart';

import 'chart.dart';
class InfoStatistiques extends StatefulWidget {
  const InfoStatistiques({super.key});

  @override
  State<InfoStatistiques> createState() => _InfoStatistiquesState();
}

class _InfoStatistiquesState extends State<InfoStatistiques> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xff18534f),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Statistiques",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 16),
          Chart(),
          SizedBox(height: 16),
          Statistiques(
            title: "Utilisateurs",
            icon: Icon(Icons.account_circle_outlined,
            ),
            amontOfFiles: "75K",
            iconColor: Colors.green,
          ),
          Statistiques(
            title: "Traitements",
            icon: Icon(Icons.medical_services_outlined,
            ),
            amontOfFiles: "35K",
            iconColor: Colors.blue,
          ),
          Statistiques(
            title: "Medicaments",
            icon: Icon(Icons.medication_liquid_outlined,
            ),
            amontOfFiles: "50K",
            iconColor: Colors.purpleAccent,
          ),
          Statistiques(
            title: "Maladies",
            icon: Icon(Icons.sick_outlined,
            ),
            amontOfFiles: "45K",
            iconColor: Colors.red,
          ),
          Statistiques(
            title: "Rappels",
            icon: Icon(Icons.alarm_outlined,
            ),
            amontOfFiles: "15K",
            iconColor: Colors.amber,
          )
        ],
      ),
    );
  }
}
