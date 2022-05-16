// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hirehub/GlassMorphism/Colors.dart';

import '../../GlassMorphism/GlassMorphismContainer.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [purpleBlack, blueBlack],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: size.height * 0.20,
                child: Container(
                  child: const Text(
                    "Hire Hub",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                bottom: -10,
                left: 0,
                right: 0,
                child: GlassMorphismContainer(
                  size: size,
                  height: size.height * 0.4,
                  width: size.width,
                  child: const Center(child: Text("Getting Started")),
                ),
              )
            ],
          )),
    );
  }
}
