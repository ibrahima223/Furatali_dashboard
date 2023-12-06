// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoggedUser {
  String? uid;
  String? nom;
  String? prenom;
  String? username;
  String? email;
  LoggedUser({
    this.uid,
    this.nom,
    this.prenom,
    this.username,
    this.email,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'nom': nom,
      'prenom': prenom,
      'username': username
    };
  }

  factory LoggedUser.fromMap(Map<String, dynamic> map) {
    return LoggedUser(
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      nom: map['nom'] != null ? map['nom'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }
}
