import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signIn/view/sign_in_view.dart';
import 'package:flutter_recipe_shot/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInView(
        toggleView: toggleView,
      );
    } else {
      return SignUp(
        toggleView: toggleView,
      );
    }
  }
}
