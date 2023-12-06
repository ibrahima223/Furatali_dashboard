import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_furatali/models/admin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Admin?> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Utiliser la méthode signInWithEmailAndPassword pour connecter l'utilisateur
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Obtenir l'utilisateur connecté
      User? user = result.user;
      return Admin(
        nom: "Nom de l'admin",
        prenom: "Prénom de l'admin",
      );
    } catch (error) {
      print(error.toString());
      return null; // La connexion a échoué
    }
  }

  Future<String> getAdmin() async {
    try {
      final User? user = _auth.currentUser;

      if (user != null) {
        final String uid = user.uid;
        final DocumentSnapshot document = await _firestore.collection('admin').doc(uid).get();
        if (document.exists) {
          final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          final String nom = data['nom'];

          return nom;
        } else {
          return 'Nom non trouvé';
        }
      } else {
        return 'Utilisateur non connecté';
      }
    } catch (e) {
      print('Erreur lors de la récupération du nom de l\'utilisateur : $e');
      return 'Erreur';
    }
  }
}
