import 'package:flutter/material.dart';
import 'package:foodfiti/reusable_widgets/reusable_widgets.dart';
import 'package:foodfiti/screens/signup_screen.dart';
import 'package:foodfiti/utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //two text editing controllers

  //text editing controller to control when we enter data
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Food Fiti",
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
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              reusableTextField(
                "Enter Username",
                Icons.person_outline,
                false,
                username
              ),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                "Enter Password",
                Icons.lock_outline,
                true, 
                password
              ),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {}),
              signUpOption()
            ],
          ),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Don't have account?",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
        },
        child: const Text(
          " Register",
          style: TextStyle(color: Color.fromARGB(255, 0, 135, 244), fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
