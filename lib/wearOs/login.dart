import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirehub/models/Company.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:hirehub/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WearOsHome extends StatefulWidget {
  const WearOsHome({Key? key}) : super(key: key);

  @override
  State<WearOsHome> createState() => _WearOsHomeState();
}

class _WearOsHomeState extends State<WearOsHome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  _loginUser(User user) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    LoginResponse? login = await UserRepository().loginUser(user);
    try {
      if (login == null) {
        MotionToast.error(
          description: const Text("Incorrect Username or Password"),
        ).show(context);
        return;
      }
      if (login.success!) {
        User loggedUser = login.user!;
        UserRepository userRepository = UserRepository();
        GetStorage().write("userId", loggedUser.id);

        var profile = loggedUser.avatarImage;

        if (profile != null) {
          if (profile.contains("uploads\\")) {
            profile = baseImgUrl + profile;
            profile = profile.replaceAll("\\", "/");
          }
          http.Response response = await http.get(Uri.parse(profile));
          await userRepository.saveProfileToPreferences(
              userRepository.base64String(response.bodyBytes));
        }

        if (loggedUser.type == "Applicant") {
          Uint8List imageBytes;

          await userRepository.storeBasicUserDetails(loggedUser);
          await userRepository.storeProfessionalDetails(loggedUser);
          await userRepository.storeEducationDetails(loggedUser.educationSet!);
          await userRepository.storeWorkDetails(loggedUser.workSet!);

          prefs.setString("token", login.token!);

          Navigator.popAndPushNamed(context, "/wearDashboard");
        } else if (loggedUser.type == "Company") {
          Company company = login.company!;
          await userRepository.storeBasicUserDetails(loggedUser);
          await userRepository.storeCompanyDetails(login.company!);

          var profile = company.avatarImage;
          if (profile!.contains("uploads\\")) {
            profile = baseImgUrl + profile;
            profile = profile.replaceAll("\\", "/");
          }
          http.Response response = await http.get(Uri.parse(profile));
          await userRepository.saveLogoToPreferences(
              userRepository.base64String(response.bodyBytes));

          prefs.setString("token", login.token!);
          Navigator.popAndPushNamed(context, "/wearDashboardEmployer");
        } else {
          MotionToast.error(
            description: const Text("Some Unknown error occured"),
          ).show(context);
        }
      } else {
        MotionToast.error(
          description: const Text("Incorrect Username or Password"),
        ).show(context);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                      User user = User(
                        username: username.text,
                        password: password.text,
                      );
                      _loginUser(user);
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Login",
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
