import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> createUser(Users user, String uId) async {
    try {
      await _db.collection('users').doc(uId).set(user.toJson());
      return true;
    } catch (e) {
      print("Error adding user: $e");
      return false;
    }
  }

  Future<void> updateUser(Users user) async {
    try {
      await _db.collection('Users').doc(user.id).update(user.toJson());
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  // Delete a user from Firestore
  Future<void> deleteUser(String id) async {
    try {
      await _db.collection('Users').doc(id).delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  Future<Users?> getUser(String id) async {
    try {
      DocumentSnapshot doc = await _db.collection('Users').doc(id).get();
      if (doc.exists) {
        return Users.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }
}
