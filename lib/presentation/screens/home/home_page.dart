import 'package:flutter/material.dart';
import 'package:hellomate/presentation/widgets/post_widget.dart';
import 'package:hellomate/presentation/widgets/search_field.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Find Your",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Accommodation.",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 8,),
                SearchField(),
                SizedBox(height: 16,),
                PostWidget(),
                SizedBox(height: 8,),
                PostWidget(),
                SizedBox(height: 8,),
                PostWidget(),
              ],
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Text(
                    "${auth.user!.email}"
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async{
                await auth.logout();
              }
        ),
      ]
      ),
        ),
      endDrawerEnableOpenDragGesture: true,
    );
  }
}
