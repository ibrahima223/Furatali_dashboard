import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../dashboardscreen.dart';
class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child:Stack(
        children: [
          PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sections:piechartsectiondata,
              )
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("10 %",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text("d'utilisation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
        ],
      ) ,
    );
  }
}
