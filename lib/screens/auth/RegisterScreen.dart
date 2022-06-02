import 'package:flutter/material.dart';
import 'package:hirehub/screens/auth/DecorationFunction.dart';
import 'package:hirehub/screens/auth/SigninUpBar.dart';

import '../../config/Palette.dart';
import 'Title.dart';

class RegisterScreen extends StatelessWidget {
  final VoidCallback? onLoginClicked;

  const RegisterScreen({Key? key, required this.onLoginClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LoginTitle(title: "Register to HireHub"),
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    style: const TextStyle(color: Colors.red),
                    decoration: registerInputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    style: const TextStyle(color: Colors.red),
                    decoration: registerInputDecoration(
                      hintText: "Username",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    style: const TextStyle(color: Colors.red),
                    decoration: registerInputDecoration(
                      hintText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration:
                        registerInputDecoration(hintText: "Confirm Password"),
                  ),
                ),
                SignUpBar(
                    label: "Register", isLoading: false, onPressed: () {}),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      onLoginClicked?.call();
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Palette.darkBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
