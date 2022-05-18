import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hirehub/screens/BackgroundPainter.dart';
import 'package:hirehub/screens/auth/RegisterScreen.dart';

import 'SigninScreen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ValueNotifier<bool> showSignInPage = ValueNotifier(true);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(animation: _controller.view),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 800),
              child: ValueListenableBuilder<bool>(
                valueListenable: showSignInPage,
                builder: (context, value, child) {
                  return PageTransitionSwitcher(
                    reverse: !value,
                    duration: const Duration(milliseconds: 800),
                    transitionBuilder: (child, animation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        child: child,
                        fillColor: Colors.transparent,
                      );
                    },
                    child: value
                        ? SigninScreen(
                            onRegisterClicked: () {
                              showSignInPage.value = false;
                              _controller.forward();
                            },
                          )
                        : RegisterScreen(
                            onLoginClicked: () {
                              showSignInPage.value = true;
                              _controller.reverse();
                            },
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
