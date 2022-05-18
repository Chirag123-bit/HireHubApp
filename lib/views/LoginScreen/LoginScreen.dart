import 'package:flutter/material.dart';

import '../../GlassMorphism/Colors.dart';
import '../../GlassMorphism/GlassMorphismContainer.dart';
import '../../widgets/CustomInputWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [purpleBlack, blueBlack],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  left: -20,
                  top: size.height * 0.075,
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [circlePurpleLight, circlePurpleDark],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      )),
                ),
                Positioned(
                  right: -50,
                  bottom: size.height * 0.075,
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [circlePurpleLight, circlePurpleDark],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      )),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: const GlassMorphismContainer(
                          height: 60,
                          width: 60,
                          borderRadius: 10,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )),
                    ),
                    Spacer(),
                    GlassMorphismContainer(
                      height: size.height * 0.65,
                      width: size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        child: Column(
                          children: [
                            Spacer(),
                            const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            Spacer(),
                            CustomTextField(
                              prefixIcon: Icons.person,
                              hintText: "Username",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              prefixIcon: Icons.lock,
                              hintText: "Password",
                              isObscure: true,
                              suffixIcon: Icons.remove_red_eye,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    height: 50,
                                    width: 175,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: const Text("Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: GlassMorphismContainer(
                        height: 50,
                        borderRadius: 10,
                        width: size.width * 0.8,
                        child: const Center(
                          child: Text("Don't have an account? Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}