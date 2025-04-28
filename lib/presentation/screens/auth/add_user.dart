import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellomate/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () async{
              await auth.logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surfaceContainer,
                            ),
                            child: Icon(
                                Icons.person_rounded,
                                size: 100,
                                color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                child: IconButton(onPressed: (){
                                }, icon: Icon(Icons.add_a_photo_rounded)),
                            )
                            )
                  ]
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "First Name",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: firstName,
                        decoration: InputDecoration(
                          hintText: "Enter Your First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Last Name",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: lastName,
                        decoration: InputDecoration(
                          hintText: "Enter Your Last Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Gender",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text("Male"),
                                value: 1,
                                groupValue: 1,
                                onChanged: (value) {},
                              ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text("Female"),
                                value: 2,
                                groupValue: 1,
                                onChanged: (value) {},
                              ),
                          ),

                        ],
                      ),
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: about,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Let Us Know More About Yourself...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 16,
                left: 16,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                  ),
                                )
                  ),
                ))
              ]
          ),
        ),
      ),
    );
  }
}
