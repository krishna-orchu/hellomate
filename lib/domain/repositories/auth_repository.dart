import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  Future<UserCredential?> registerUser(String email, String password);
  Future<UserCredential?> login(String email, String password);
  Stream<User?> authChanges();
  Future<void> logout();
}