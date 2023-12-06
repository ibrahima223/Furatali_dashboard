import 'package:flutter/material.dart';
class DashboardController extends ChangeNotifier{
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldstate;

  //************************SLIDEBAR************************************
  int _indiceSideBar = 0;
  set indiceSideBar(int val){
    _indiceSideBar = val;
    notifyListeners();
  }
  int get indiceSideBar => _indiceSideBar;

//************************DASHBOARD***********************************
  int _indiceDashPages = 0;
  set indiceDashPages(int val){
    _indiceDashPages = val;
    notifyListeners();
  }
  int get indiceDashPages => _indiceDashPages;

//************************MEDICAMENTS************************************
  int _indiceMedocPages = 0;
  set indiceMedocPages(int val){
    _indiceMedocPages = val;
    notifyListeners();
  }
  int get indiceMedocpages => _indiceMedocPages;

  //************************OUVERTURE DRAWER************************************
  void dashcontrol(){
    if(!_scaffoldstate.currentState!.isDrawerOpen){
      _scaffoldstate.currentState?.openDrawer();
    }
  }

}