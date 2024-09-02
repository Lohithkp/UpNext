import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuthService _auth = FirebaseAuthService();

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
