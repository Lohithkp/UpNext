import '../model/user_model.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService _firestoreService = UserService();

  Future<bool> addUser(Users user, String uid) async {
    return await _firestoreService.createUser(user, uid);
  }

  Future<void> updateUser(Users user) async {
    return await _firestoreService.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    return await _firestoreService.deleteUser(id);
  }

  Future<Users?> getUser(String id) async {
    return await _firestoreService.getUser(id);
  }
}
