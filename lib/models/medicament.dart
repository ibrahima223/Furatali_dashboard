import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicament{
  final String imageUrl, title, dosage, frequence;
  final int pourcentage;
  final Color color;

  Medicament( {required this.frequence,required this.title, required this.dosage, required this.pourcentage, required this.color, required this.imageUrl, });
}

List medicaments =[
  Medicament(
      title: "Paracetamol",
      dosage: "500 mg",
      frequence: "3 fois/jour",
      pourcentage: 35,
      color: Colors.blue,
      imageUrl: 'assets/images/4.png'
  ),
  Medicament(
      title: "Aspirine",
      dosage: "200 mg",
      frequence: "2 fois/jour",
      pourcentage: 25,
      color: Colors.red,
      imageUrl: 'assets/images/3.png'
  ),
  Medicament(
      title: "Moringa",
      dosage: "50 mg",
      frequence: "3 tasses/jour",
      pourcentage: 50,
      color: Colors.green,
      imageUrl: 'assets/images/moringa.png'
  ),
  Medicament(
      title: "Ibuprofène",
      dosage: "100 mg",
      frequence: "1 fois/jour",
      pourcentage: 30,
      color: Colors.amber,
      imageUrl: 'assets/images/1.png'
  )
];