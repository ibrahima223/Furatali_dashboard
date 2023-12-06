// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Maladie {
  final String? nom;
  final String? symptomes;
  final String? traitements;
  Maladie({
    this.nom,
    this.symptomes,
    this.traitements,
  });
 

  Maladie copyWith({
    String? nom,
    String? symptomes,
    String? traitements,
  }) {
    return Maladie(
      nom: nom ?? this.nom,
      symptomes: symptomes ?? this.symptomes,
      traitements: traitements ?? this.traitements,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'symptomes': symptomes,
      'traitements': traitements,
    };
  }

  factory Maladie.fromMap(Map<String, dynamic> map) {
    return Maladie(
      nom: map['nom'] != null ? map['nom'] as String : null,
      symptomes: map['symptomes'] != null ? map['symptomes'] as String : null,
      traitements: map['traitements'] != null ? map['traitements'] as String : null,
    );
  }


}
