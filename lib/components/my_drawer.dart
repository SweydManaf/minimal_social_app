import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // header
        Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            )),

            const SizedBox(
              height: 25,
            ),

            // home
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text("H O M E"),
                onTap: () {
                  // this is already the home screen so just pop drawer
                  Navigator.pop(context);

                  // navigate
                  Navigator.pushNamed(context, '/home_page');
                },
              ),
            ),

            // profile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("P R O F I L E"),
                onTap: () {
                  // this is already the home screen so just pop drawer
                  Navigator.pop(context);

                  // navigate
                  Navigator.pushNamed(context, '/profile_page');
                },
              ),
            ),

            // users
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.group,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("U S E R S"),
                onTap: () {
                  // this is already the home screen so just pop drawer
                  Navigator.pop(context);

                  // navigate
                  Navigator.pushNamed(context, '/users_page');
                },
              ),
            ),
          ],
        ),

        // logout
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 25),
          child: ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("L O G O U T"),
            onTap: () {
              // this is already the home screen so just pop drawer
              Navigator.pop(context);

              // logout
              logout();
            },
          ),
        ),
      ]),
    );
  }
}
