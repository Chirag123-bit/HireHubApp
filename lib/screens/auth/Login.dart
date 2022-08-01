import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirehub/config/Palette.dart';
import 'package:hirehub/config/SizeConfig.dart';
import 'package:hirehub/controller/AppliedJobController.dart';
import 'package:hirehub/models/Company.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:hirehub/screens/auth/OTPVerificationScreen.dart';
import 'package:hirehub/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

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
        GetStorage().write("isVerified", loggedUser.isVerified);

        String isVerif = GetStorage().read("isVerified");

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
          getAppliedJobs();
          print("Is Verified: $isVerif");
          if (isVerif == "false") {
            Get.to(const OTPScreen());
            return;
          }
          Navigator.popAndPushNamed(context, "/home");
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
          print("Is Verified: $isVerif");
          if (isVerif == "false") {
            Get.to(const OTPScreen());
            return;
          }
          Navigator.popAndPushNamed(context, "/homeEmployer");
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

  getAppliedJobs() async {
    final JobsRepository _jobRepository = JobsRepository();
    final appldJobs = await _jobRepository.getAppliedJobs();
    final appliedJobs = appldJobs?.data;

    //store appliedJobs in sqlite db
    if (appliedJobs != null) {
      JobController _jobHelper = JobController();
      _jobHelper.deleteAll();
      for (var data in appliedJobs) {
        _jobHelper.addAppliedJob(appliedJob: data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 80,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 1),

                          blurRadius: 20,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100]!,
                              ),
                            )),
                            child: TextFormField(
                              key: const ValueKey("txtUsername"),
                              controller: _usernameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              key: const ValueKey("txtPassword"),
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     gradient: const LinearGradient(colors: [
                    //       Color.fromRGBO(143, 148, 251, 1),
                    //       Color.fromRGBO(143, 148, 251, .6),
                    //     ])),
                    child: Center(
                      child: Container(
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(color: Colors.blue),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "Verifying...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              )
                            : FlatButton(
                                key: const ValueKey("btnLogin"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    User user = User(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    );
                                    _loginUser(user);
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    color: Colors.white,
                                  ),
                                ),
                                color: Palette.primaryColor,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?   ',
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



//  if (_formKey.currentState!.validate()) {
//                               User user = User(
//                                 username: _usernameController.text,
//                                 password: _passwordController.text,
//                               );
//                               _loginUser(user);
//                             }