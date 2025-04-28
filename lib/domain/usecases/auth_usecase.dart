import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellomate/domain/repositories/auth_repository.dart';

class LoginUseCase{
  final AuthRepository authRepository;
  LoginUseCase(
    this.authRepository
);
  Future<UserCredential?> login(String email, String password) async{
    return await authRepository.login(email, password);
  }
}

class RegisterUseCase{
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);
  Future<UserCredential?> register(String email, String password) async{
    return await authRepository.registerUser(email, password);
  }

}

class AuthChangeUseCases{
  final AuthRepository authRepository;
  AuthChangeUseCases(this.authRepository);
  Stream<User?> authChanges() {
    return authRepository.authChanges();
  }
}

class LogoutUseCase{
  final AuthRepository authRepository;
  LogoutUseCase(this.authRepository);
  Future<void> logout() async{
    return await authRepository.logout();
  }
}
