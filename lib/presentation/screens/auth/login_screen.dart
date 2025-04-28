import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellomate/presentation/widgets/auth_text_field.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 40),
                      AuthTextField(
                        controller: email,
                        hint: "Email",
                        icon: Icon(Icons.email_rounded),
                        obscure: false,
                      ),
                      SizedBox(height: 8),
                      AuthTextField(
                        controller: password,
                        hint: "Password",
                        icon: Icon(Icons.password_rounded),
                        obscure: true,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Forget Password"),
                          ),
                          FilledButton(
                            onPressed: () async{
                              await authViewModel.login(email.text, password.text);
                              final error = authViewModel.error;
                              if (error != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    showCloseIcon: true,
                                    backgroundColor: Theme.of(context).colorScheme.errorContainer,
                                      content: Text(
                                      error,
                                        style: Theme.of(context).textTheme.bodyMedium,

                                  )),
                                );
                              }},
                            child: Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You do not have an account?'),
                      TextButton(onPressed: () {
                        authViewModel.togg();
                      }, child: Text('Register')),
                    ],
                  ),
                ],
        ),
      ),
    );
  }
}
