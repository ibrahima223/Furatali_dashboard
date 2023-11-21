import 'package:dashboard_furatali/Pages/dashboard/composants/my_fiels.dart';
import 'package:dashboard_furatali/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'composants/InfoStatistiques.dart';
import 'composants/hearder.dart';
import 'composants/list_rappels.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Header(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child:Column(
                  children: [
                    SizedBox(height: 10),
                    const MyFiels(),
                    RecentPrises(),

                    if(Responsive.isMobile(context))
                      SizedBox(height: 10),
                    if(Responsive.isMobile(context))
                      InfoStatistiques(),
                  ],
                ),
              ),
              if(!Responsive.isMobile(context))
              SizedBox(width: 10),
              if(!Responsive.isMobile(context))
                Expanded(
                flex: 2,
                child: InfoStatistiques(),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

List<PieChartSectionData> piechartsectiondata=[
  PieChartSectionData(
      value: 75,
      color: Colors.green,
      showTitle: false,
      title: "Utilisateurs",
      radius: 25,
  ),
  PieChartSectionData(
      value: 60,
      color: Colors.blue,
      showTitle: false,
      title: "Traitements",
      radius: 25,
  ),
  PieChartSectionData(
      value: 50,
      color: Colors.purpleAccent,
      showTitle: false,
      title: "Medicaments",
      radius: 25,
  ),
  PieChartSectionData(
      value: 50,
      color: Colors.red,
      showTitle: false,
      title: "Maladies",
      radius: 25,
  ),
  PieChartSectionData(
      value: 20,
      color: Colors.amber,
      showTitle: false,
      title: "Rappels",
      radius: 25,
  ),
];



