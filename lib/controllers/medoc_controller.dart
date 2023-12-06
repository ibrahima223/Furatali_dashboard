import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_furatali/Pages/dashboard/AddDirectory/addmedicament.dart';
import 'package:dashboard_furatali/Pages/dashboard/ListeDirectory/listmedicament.dart';
import 'package:dashboard_furatali/Pages/dashboard/UpdateDirectory/updatemedicament.dart';
import 'package:flutter/material.dart';

import '../models/medicament.dart';

class MedocController extends ChangeNotifier {
  int _pageIndex = 0;
  set pageIndex(int val) {
    _pageIndex = val;
    notifyListeners();
  }

  //  StreamController<List<Medicament>> _medocStreamController =
  //     StreamController<List<Medicament>>.broadcast();
  // Stream<List<Medicament>> get medocStream => _medocStreamController.stream;

  List<Medicament> _medoc = [];
  List<Medicament> get allMedoc {
    return _medoc;
  }
 StreamSubscription<List<Medicament>>? _medocSubscription;

Stream<List<Medicament>> getAdminListMedicaments(String adminId) {
  return FirebaseFirestore.instance
      .collection('medicaments')
      .where('idAdmin', isEqualTo: adminId)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Medicament(
        idAdmin: data['idAdmin'],
        nom: data['nom'] ?? '',
        description: data['description'] ?? '',
        categorie: data['categorie'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
        title: data['title'] ?? '',
        dosage: data['dosage'] ?? '',
        frequence: data['frequence'] ?? '',
        stock_depart: data['stock_depart'] ?? 0,
        stock_restant: data['stock_restant'] ?? 0,
      );
    }).toList();
  });
}


   void initMedocSubscription(String adminId) {
    _medocSubscription?.cancel();
    _medocSubscription = getAdminListMedicaments(adminId).listen((medocList) {
      _medoc = medocList;
      notifyListeners();
    });
  }

  int get pageIndex => _pageIndex;

  final List<Widget> _medocPages = [
    const ListeMedicament(),
    const AjouterMedicament(),
    const ModifierMedicament()
  ];

  Widget get pageToShow => _medocPages[_pageIndex];

  List<Medicament> medocDash = [
    Medicament(
      title: "Paracetamol",
      dosage: "500 mg",
      frequence: "3 fois/jour",
      imageUrl: "assets/images/1.png",
      stock_depart: Random().nextInt(10) + 8,
      stock_restant: Random().nextInt(8),
      nom: "Paracetamol",
      description: "Bon pour les maux de tête",
      categorie: "Non_traditionnel",
    ),
    Medicament(
      title: "Moringa",
      dosage: "100 mg",
      frequence: "2 fois/jour",
      imageUrl: "assets/images/2.png",
      stock_depart: Random().nextInt(10) + 8,
      stock_restant: Random().nextInt(8),
      nom: "Moringa",
      description: "Médicament qui soulage les maux de ventre",
      categorie: "Traditionnel",
    ),
    Medicament(
      title: "Amoxicilline",
      dosage: "100 mg",
      frequence: "3 fois/jour",
      imageUrl: "assets/images/3.png",
      stock_depart: Random().nextInt(10) + 8,
      stock_restant: Random().nextInt(8),
      nom: "Amoxicilline",
      description: "Médicament qui soulage les maux de ventre",
      categorie: "Non_traditionnel",
    ),
    Medicament(
      title: "Ségou fali",
      dosage: "500 ml",
      frequence: "2 fois/jour",
      imageUrl: "assets/images/4.png",
      stock_depart: Random().nextInt(10) + 8,
      stock_restant: Random().nextInt(8),
      nom: "Ségou fali",
      description: "Médicament qui soulage les maux de ventre",
      categorie: "Traditionnel",
    ),
  ];

}
