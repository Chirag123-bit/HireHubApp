import 'package:flutter/material.dart';
import 'package:hirehub/GlassMorphism/Colors.dart';
import 'package:hirehub/GlassMorphism/GlassMorphismContainer.dart';
import 'package:hirehub/widgets/CustomInputWidget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const GlassMorphismContainer(
                            height: 60,
                            width: 60,
                            borderRadius: 10,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const GlassMorphismContainer(
                          height: 60,
                          width: 60,
                          borderRadius: 10,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                              "Register ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            Spacer(),
                            CustomTextField(
                              prefixIcon: Icons.email,
                              hintText: "Email",
                            ),
                            const SizedBox(height: 10),
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
                            CustomTextField(
                              prefixIcon: Icons.lock,
                              hintText: "Confirm Password",
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
                                    child: const Text("Sign Up",
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
                    const Text(
                        "By Signing up you agree to our Terms of Service",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        )),
                    const SizedBox(
                      height: 10,
                    )
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