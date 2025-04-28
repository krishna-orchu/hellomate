import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellomate/demo/camera_screen.dart';
import 'package:hellomate/presentation/providers/auth_provider.dart';
import 'package:hellomate/presentation/screens/auth/add_user.dart';
import 'package:hellomate/presentation/screens/auth/login_screen.dart';
import 'package:hellomate/presentation/screens/auth/register_screen.dart';
import 'package:hellomate/presentation/screens/auth/start_route.dart';
import 'package:hellomate/presentation/screens/home/home_page.dart';
import 'package:hellomate/theme.dart';
import 'package:provider/provider.dart';

import 'core/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hellomate',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: MaterialTheme.lightScheme(),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: MaterialTheme.darkScheme(),
        ),
        home: StartRoute(),
      )
    );
  }
}

/// Handles auth routing based on login state.
class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    return auth.create ? RegisterScreen() : LoginScreen();
  }
}

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    if (auth.user!.displayName == "" || auth.user!.photoURL == null) {
      return AddUser();
    }else{
      return HomePage();
    }
  }
}
