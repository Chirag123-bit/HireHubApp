import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hirehub/wearOs/EmployerDashboard.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          // padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                "HireHub",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
                            controller: username,
                            style: const TextStyle(fontSize: 13),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 13),
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
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
                height: 25,
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
                              builder: (context) =>
                                  const EmployerDashboardScreen(),
                            ));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Invalid username or password");
                      }
                    }
                  },
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
