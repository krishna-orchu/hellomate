import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../providers/auth_provider.dart';
import '../home/home_page.dart';
import 'login_screen.dart';

class StartRoute extends StatelessWidget {
  const StartRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    print(auth.user);
    return auth.user == null ? AuthRouter() : CheckUser();
  }
}
