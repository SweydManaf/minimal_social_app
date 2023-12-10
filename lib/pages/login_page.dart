import 'package:flutter/material.dart';
import 'package:minimalsocial_app/components/my_button.dart';
import 'package:minimalsocial_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  LoginPage({super.key});

  // login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),

            // app name
            Text(
              "M I N I M A L",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(
              height: 50,
            ),

            // email textfield
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(
              height: 10,
            ),

            // password textfied
            MyTextField(
                controller: passwordControler,
                hintText: "Password",
                obscureText: true),

            const SizedBox(
              height: 10,
            ),

            // forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Paasword?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),

            const SizedBox(
              height: 25,
            ),

            // sign in button
            MyButton(
              text: "Login",
              onTap: login,
            ),

            const SizedBox(
              height: 25,
            ),

            // dont't have an account? register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    " Register Here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
