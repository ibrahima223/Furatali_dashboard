import 'package:flutter/material.dart';
class DashboardController extends ChangeNotifier{
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldstate;

  void dashcontrol(){
    if(!_scaffoldstate.currentState!.isDrawerOpen){
      _scaffoldstate.currentState?.openDrawer();
    }
  }

}