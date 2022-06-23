import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hirehub/wearOs/dashboard.dart';

class WearOsHome extends StatefulWidget {
  const WearOsHome({Key? key}) : super(key: key);

  @override
  State<WearOsHome> createState() => _WearOsHomeState();
}

class _WearOsHomeState extends State<WearOsHome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: username,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Enter your username',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bool result;
                      if (username.text == 'admin' &&
                          password.text == 'admin') {
                        result = true;
                      } else {
                        result = false;
                      }
                      if (result) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(),
                            ));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Invalid username or password");
                      }
                    }
                  },
                  child: const Text("Add"),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
