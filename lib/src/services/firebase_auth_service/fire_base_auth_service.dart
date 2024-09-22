import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthService(this._firebaseAuth);

  Stream<User?> Function() get authStateChanges =>
      _firebaseAuth.authStateChanges;

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
