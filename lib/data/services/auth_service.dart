import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellomate/core/errors/auth_failure.dart';

class AuthService{
  final service = FirebaseAuth.instance;

  Future<UserCredential?> register(String email, String password) async{
    return await service.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future<UserCredential?> login(String email, String password) async{
    try {
      return await service.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw AuthFailure(e.code);
    }
  }
  Stream<User?> getChanges(){
    return service.authStateChanges();
  }

  Future<void> logout() async{
    return await service.signOut();
  }
}