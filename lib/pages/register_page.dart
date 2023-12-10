import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimalsocial_app/components/my_button.dart';
import 'package:minimalsocial_app/components/my_textfield.dart';
import 'package:minimalsocial_app/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final TextEditingController usernameControler = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  final TextEditingController confirmPwControler = TextEditingController();

  // register method
  void registerUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // make sure passwords match
    if (passwordControler.text != confirmPwControler.text) {
      // pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageToUser("Passwords dont't match!", context);
    }
    // if do passwords do match
    else {
      // try creating the user
      try {
        // create the user
        UserCredential? userCrendential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordControler.text);
        // pop loading circle
        Navigator.pop(context);
      } on FirebaseException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        // display error message to user
        displayMessageToUser(e.code, context);
      }
    }
  }

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
              height: 30,
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
              onTap: registerUser,
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
                  onTap: widget.onTap,
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
