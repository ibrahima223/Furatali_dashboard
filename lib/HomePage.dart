import 'package:dashboard_furatali/Pages/dashboard/DashPages.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/MedocsPages.dart';
import 'package:dashboard_furatali/Pages/dashboard/dashboardscreen.dart';
import 'package:dashboard_furatali/composants/drawerlist.dart';
import 'package:dashboard_furatali/composants/side_menu.dart';
import 'package:dashboard_furatali/controllers/dashboard_controller.dart';
import 'package:dashboard_furatali/controllers/side_bar_controller.dart';
import 'package:dashboard_furatali/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideMenu(),
      key: context.read<DashboardController>().scaffoldKey,
      body: SafeArea(
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                child:SideMenu(),
              ),
              // Expanded(
              //   flex: 5,
              //   child: DashboardScreen(),
              // )
              Expanded(
                flex: 5,
                child: context.watch<SideBarController>().pageToShow,
              )
            ],
          )
        ),
    );
  }
}


