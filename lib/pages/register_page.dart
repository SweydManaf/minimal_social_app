import 'package:flutter/material.dart';
import 'package:minimalsocial_app/components/my_button.dart';
import 'package:minimalsocial_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  // text controllers
  final TextEditingController usernameControler = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController confirmPwControler = TextEditingController();

  // register method
  void register() {}

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

            // username textfield
            MyTextField(
                controller: usernameControler,
                hintText: "Username",
                obscureText: false),

            const SizedBox(
              height: 10,
            ),

// email textfield
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(
              height: 10,
            ),

// password textfield
            MyTextField(
                controller: passwordControler,
                hintText: "Password",
                obscureText: true),

            const SizedBox(
              height: 10,
            ),

            // password textfied
            MyTextField(
                controller: confirmPwControler,
                hintText: "Confirm Password",
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

            // register in button
            MyButton(
              text: "Register",
              onTap: register,
            ),

            const SizedBox(
              height: 25,
            ),

            // dont't have an account? register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login Here",
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
