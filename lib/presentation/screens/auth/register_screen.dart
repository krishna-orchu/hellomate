import 'package:flutter/material.dart';
import 'package:hellomate/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
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
            SizedBox(height: 0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 40,),
                AuthTextField(
                  controller: email,
                  hint: "Email",
                  icon: Icon(Icons.email_rounded),
                  obscure: false,
                ),
                SizedBox(height: 8,),
                AuthTextField(
                  controller: password,
                  hint: "Password",
                  icon: Icon(Icons.password_rounded),
                  obscure: true,
                ),
                SizedBox(height: 8,),
                AuthTextField(
                  controller: confirmPassword,
                  hint: "Confirm Password",
                  icon: Icon(Icons.password_rounded),
                  obscure: true,
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () async{

                        },
                        child: Text("Help?")
                    ),
                    FilledButton(
                        onPressed:() async{
                          await authViewModel.register(email.text, password.text);
                        },
                        child: Text('Register')
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Already have an account?'
                ),
                TextButton(onPressed: (){
                  authViewModel.togg();
                }, child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
