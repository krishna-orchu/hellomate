import 'package:hellomate/data/repository_impl/auth_repository_impl.dart';
import 'package:hellomate/data/services/auth_service.dart';
import 'package:hellomate/domain/repositories/auth_repository.dart';
import 'package:hellomate/domain/usecases/auth_usecase.dart';
import 'package:hellomate/presentation/providers/auth_provider.dart';
import 'package:hellomate/presentation/providers/camera_provider.dart';
import 'package:provider/provider.dart';

import '../data/repository_impl/camera_repository_impl.dart';

List<ChangeNotifierProvider> getProviders(){
  final authService = AuthService();
  final authRepository = AuthRepositoryImpl(authService);

  return [
    ChangeNotifierProvider<AuthViewModel>(
      create: (_) => AuthViewModel(
          authChangeUseCases: AuthChangeUseCases(authRepository),
          registerUseCase: RegisterUseCase(authRepository),
          loginUseCase: LoginUseCase(authRepository),
          logoutUseCase: LogoutUseCase(authRepository)
      )..authChange(),
    ),
    ChangeNotifierProvider<CameraViewModel>(
      create: (_) => CameraViewModel(cameraRepository: CameraRepositoryImpl()),
    )
  ];

}