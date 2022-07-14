// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({Key? key}) : super(key: key);

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
  LocalAuthentication auth = LocalAuthentication();
  bool canCheckBiometrics = false;
  List<BiometricType> availableBiometrics = [];
  String authorized = 'Not Authorized';

  Future<void> _canCheckBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      this.canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      this.availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      authorized = authenticated ? 'Authorized' : 'Not Authorized';
      print(authorized);
    });
  }

  @override
  void initState() {
    super.initState();
    _canCheckBiometrics();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          backgroundColor: const Color(0xff3c3e52),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Fingerprint Validation',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(children: [
                      SvgPicture.asset(
                        "assets/icons/fingerprint.svg",
                        color: Colors.white,
                        width: 120,
                      ),
                      const Text(
                        "Fingerprint Authentication",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: 250,
                        child: const Text(
                          'Please scan your finger to validate your identity',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: const Color(0xff04a5ed),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                          onPressed: _authenticate,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 24),
                            child: Text(
                              'Authenticate',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
