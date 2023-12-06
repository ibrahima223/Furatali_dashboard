import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addMaladie.dart';
import 'package:dashboard_furatali/Pages/dashboard/UpdateDirectory/updatemaladie.dart';
import 'package:dashboard_furatali/Pages/dashboard/composants/listMal.dart';
import 'package:dashboard_furatali/models/listMaladie.dart';
import 'package:flutter/material.dart';

class MalController extends ChangeNotifier {
  int _pageIndex = 0;
  set pageIndex(int val) {
    _pageIndex = val;
    notifyListeners();
  }

  int get pageIndex => _pageIndex;

  final List<Widget> _malpages = [
    const ListMal(),
    const AjouterMaladie(),
    const ModifierMaladie()
  ];
  Widget get pageToShow => _malpages[_pageIndex];


  List<Maladie> malDash=[
    Maladie(
      nom: "Diabète de type 2",
      symptomes: "Vision floue\n"
      "Augmentation de la faim\n"
      "Fatigue constante",
      traitements: "Thérapie Physique\n"
      "Alimentation équilibrée",
      ),
      Maladie(
        nom: "Diabète de type 2",
        symptomes: "Vision floue\n"
        "Augmentation de la faim\n"
        "Fatigue constante",
        traitements: "Thérapie Physique\n"
        "Alimentation équilibrée",
        )
  ];
}
