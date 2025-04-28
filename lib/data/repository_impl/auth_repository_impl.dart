import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellomate/core/errors/auth_failure.dart';
import 'package:hellomate/data/services/auth_service.dart';
import 'package:hellomate/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Stream<User?> authChanges() {
    try{
      return authService.getChanges();
    } catch(e){
      throw AuthFailure(_mapError(e.toString()));
    }
    //throw UnimplementedError();
  }

  @override
  Future<UserCredential?> login(String email, String password) {
    try{
     return authService.login(email, password);
    }on FirebaseAuthException catch(e){
      print(e.code);
      print(e);
      throw AuthFailure(e.code);
    }
    //throw UnimplementedError();
  }

  @override
  Future<UserCredential?> registerUser(String email, String password) {
    try{
     return authService.register(email, password);
    } on FirebaseAuthException catch(e){
      throw AuthFailure(e.code);
    }
    //throw UnimplementedError();
  }

  @override
  Future<void> logout(){
    return authService.logout();
  }

  String _mapError(String code) {
    switch (code) {
      case 'The supplied auth credential is incorrect':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }

}