import 'package:dashboard_furatali/Pages/dashboard/composants/MalPages.dart';
import 'package:flutter/material.dart';

import '../Pages/dashboard/DashPages.dart';
import '../Pages/dashboard/composants/MedocsPages.dart';

class SideBarController extends ChangeNotifier {
  int _sideBarIndex = 0;
  int get sideBarIndex => _sideBarIndex;
  set sideBarIndex(int value) {
    _sideBarIndex = value;
    notifyListeners();
  }

  final List<Widget> _sideBarPages = [DashPages(), MedocPages(), MalPages(),Container(color: Colors.yellow,),Container(color: Colors.red,),];

  Widget get pageToShow => _sideBarPages[_sideBarIndex];
}
