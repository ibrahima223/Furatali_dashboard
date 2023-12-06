// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Admin {
  String nom;
  String prenom;
  Admin({
    required this.nom,
    required this.prenom,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> data) {
    return Admin(
      nom: data['nom'] as String,
      prenom: data['prenom'] as String,
    );
  }
}
