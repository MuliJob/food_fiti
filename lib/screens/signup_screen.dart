
import 'package:flutter/material.dart';
import 'package:foodfiti/reusable_widgets/reusable_widgets.dart';
import 'package:foodfiti/screens/home_screen.dart';
import 'package:foodfiti/screens/signin_screen.dart';
import 'package:foodfiti/utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Register",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("568203"),
            hexStringToColor("4CAF50"),
            hexStringToColor("8EE53F")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, username
                    ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.lock_outline, true, email),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, password),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                }),
                signInOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signInOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Already have an account?",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignInScreen()));
        },
        child: const Text(
          " Login",
          style: TextStyle(color: Color.fromARGB(255, 1, 137, 248), fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
