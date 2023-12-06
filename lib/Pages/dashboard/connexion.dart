import 'dart:html';

import 'package:dashboard_furatali/Constantes/constantes.dart';
import 'package:dashboard_furatali/Constantes/controllers.dart';
import 'package:dashboard_furatali/Constantes/style.dart';
import 'package:dashboard_furatali/Pages/dashboard/dashboardscreen.dart';
import 'package:dashboard_furatali/controllers/auth_controller.dart';
import 'package:dashboard_furatali/controllers/dashboard_controller.dart';
import 'package:dashboard_furatali/controllers/user_controller.dart';
import 'package:dashboard_furatali/helpers/authentification.dart';
import 'package:dashboard_furatali/helpers/route.dart';
import 'package:dashboard_furatali/incrisption.dart';
import 'package:dashboard_furatali/models/admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final TextEditingController email_controller = TextEditingController();
  final motpasse_controller = TextEditingController();
  bool _obscureText = true;
  bool _emailVide = false;
  bool _emailInvalide = false;

  Future<void> ConnectAdmin() async {
    setState(() {
      _emailVide = email_controller.text.isEmpty;
      _motpasseVide = motpasse_controller.text.isEmpty;
      _emailInvalide = !isEmailValid(email_controller.text);
    });

    if (!_emailVide && !_motpasseVide && !_emailInvalide) {
      try {
        // Essayez de connecter l'utilisateur avec les identifiants fournis
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email_controller.text,
          password: motpasse_controller.text,
        );
        Admin admin = Admin(
          nom: "Nom de l'admin",
          prenom: "Prénom de l'admin",
        );
      } catch (e) {
        // Si l'utilisateur n'existe pas, essayez de le créer
        if (e is FirebaseAuthException && e.code == 'user-not-found') {
          try {
            // Créez le compte administrateur
            final credential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email_controller.text,
              password: motpasse_controller.text,
            );

            // Envoyer un e-mail de vérification
            await credential.user?.sendEmailVerification();

            // Utilisez les informations d'administrateur pour personnaliser l'objet Admin
            Admin admin = Admin(
              nom: "Nom de l'admin",
              prenom: "Prénom de l'admin",
            );
          } catch (e) {
            // Gestion des erreurs de création de compte
            print('Erreur lors de la création du compte : $e');
          }
        } else {
          // Gestion des autres erreurs d'authentification
          print('Erreur d\'authentification : $e');
        }
      }
    }
  }

  bool _motpasseVide = false;
  bool erreurMotDePasse = false;
  void _toogleObscured() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9d9d9),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/Logo.png',
            width: 300,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height/6,
              ),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius:4,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      offset: Offset(0, 0)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("Connectez-vous ici",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextField(
                              controller: email_controller,
                              decoration: InputDecoration(
                                errorText: _emailVide
                                    ? 'Veuillez remplir le champ vide'
                                    : _emailInvalide
                                        ? 'E-mail non valide'
                                        : null,
                                focusColor: Colors.red,
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Adresse-email",
                                hintStyle: TextStyle(
                                  color: Color(0xff34A853),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: 'Entrer votre email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 15,
                                  color: Color(0xff34A853),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.green,
                                  width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green
                                  )
                                )
                              ),
                     
                            ),
                     ),
      
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: motpasse_controller,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                errorText: _motpasseVide
                                    ? 'Veuillez remplir le champ vide'
                                    : erreurMotDePasse
                                        ? 'Mot de passe incorrect'
                                        : null,
                                focusColor: Colors.red,
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Mot de passe",
                                hintStyle: TextStyle(
                                  color: Color(0xff34A853),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: 'Entrer votre mot de passe',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 15,
                                  color: Color(0xff34A853),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  child: GestureDetector(
                                    onTap: _toogleObscured,
                                    child: Icon(
                                      color: Color(0xff34A853),
                                      _obscureText
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green,
                                  width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // fixedSize: Size(100, 50),
                              backgroundColor: Color(0xff34A853),
                              shadowColor: Color.fromRGBO(0, 0, 0, 0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              await ConnectAdmin();
                              context
                                  .read<DashboardController>()
                                  .indiceDashPages = 0;
                            },
                            child: Text(
                              'Connexion',
                              style: TextStyle(
                                fontSize:20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
