import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hellomate/domain/usecases/auth_usecase.dart';

import '../../core/errors/auth_failure.dart';

class AuthViewModel extends ChangeNotifier{
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final AuthChangeUseCases authChangeUseCases;
  final LogoutUseCase logoutUseCase;

  AuthViewModel({
    required this.authChangeUseCases,
    required this.registerUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
  });

  bool _create = false;
  bool get create => _create;

  String? _error;
  String? get error => _error;

  User? _user;
  User? get user => _user;

  void togg(){
    _create = !_create;
    print(create.toString());
    notifyListeners();
  }

  Future<UserCredential?> login(String email, String password) async{
    try {
      await loginUseCase.login(email, password);
      return null;
    }catch (e){
      if (e is AuthFailure) {
        _error = e.message;
      } else {
        _error = "Unexpected error occurred.";
      }
      notifyListeners();
      return null;
    }
  }

  Future<UserCredential?> register(String email, String password) async{
    await registerUseCase.register(email, password);
    return null;
  }

  void authChange(){
    authChangeUseCases.authChanges().listen((data){
      print(data);
      _user = data;
      notifyListeners();
    });
  }

  Future<void> logout() async{
    return await logoutUseCase.logout();
  }

}