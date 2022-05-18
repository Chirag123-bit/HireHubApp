import 'package:flutter/material.dart';
import 'package:hirehub/screens/auth/DecorationFunction.dart';
import 'package:hirehub/screens/auth/SigninUpBar.dart';

import '../../config/Palette.dart';
import 'Title.dart';

class SigninScreen extends StatelessWidget {
  final VoidCallback? onRegisterClicked;

  const SigninScreen({Key? key, required this.onRegisterClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LoginTitle(title: "Welcome"),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: signInInputDecoration(hintText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: signInInputDecoration(hintText: "Password"),
                  ),
                ),
                SignInBar(label: "Login", isLoading: false, onPressed: () {}),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      onRegisterClicked?.call();
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
