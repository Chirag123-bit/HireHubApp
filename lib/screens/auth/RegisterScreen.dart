import 'package:flutter/material.dart';
import 'package:hirehub/screens/auth/registerComponents/AccountComponents.dart';
import 'package:hirehub/screens/auth/registerComponents/BasicComponents.dart';

import '../../config/Palette.dart';
import 'SigninUpBar.dart';
import 'Title.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback? onLoginClicked;

  const RegisterScreen({Key? key, required this.onLoginClicked})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ignore: prefer_final_fields
  int _currentStep = 0;
  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
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
            flex: 8,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      widget.onLoginClicked?.call();
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
                Form(
                  key: _globalkey,
                  child: Stepper(
                    currentStep: _currentStep,
                    steps: getSteps(),
                    physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    onStepContinue: () {
                      final isLastStep = _currentStep == getSteps().length - 1;
                      if (isLastStep) {
                        // ignore: avoid_print
                        print("Last Step");
                      } else {
                        setState(() {
                          _currentStep = _currentStep + 1;
                        });
                      }
                    },
                    onStepCancel: () {
                      final isFirstStep = _currentStep == 0;
                      if (isFirstStep) {
                        print("First Step");
                      } else {
                        setState(() {
                          _currentStep = _currentStep - 1;
                        });
                      }
                    },
                  ),
                ),
                SignUpBar(
                    label: "Register", isLoading: false, onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: const Text('Personal Info'),
          content: BasicComponents(),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: const Text('Account Info'),
          content: AccountComponents(),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: const Text('Additional Info'),
          content: const Text('Confirm your information'),
          isActive: _currentStep >= 2,
        ),
        Step(
          title: const Text('Professional Info'),
          content: BasicComponents(),
          isActive: _currentStep >= 3,
        ),
      ];
}
