import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/APIs/UserAPI.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  //controllers for form
  late final TextEditingController _oldPasswordController =
      TextEditingController();
  late final TextEditingController _newPasswordController =
      TextEditingController();
  late final TextEditingController _confirmPasswordController =
      TextEditingController();

  //variables for snackbar
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //variables for shake

  @override
  Widget build(BuildContext context) {
    late UserAPI userApi;
    handlePasswordChange() async {
      String oldPassword = _oldPasswordController.text;
      String newPassword = _newPasswordController.text;

      userApi = UserAPI();
      bool success = await userApi.updatePassword(oldPassword, newPassword);
      if (success) {
        Get.snackbar("Success", "Password updated successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            borderColor: Colors.green,
            borderWidth: 2,
            duration: const Duration(seconds: 2),
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ));
      } else {
        Get.snackbar("Error", "Old password is incorrect",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            borderColor: Colors.red,
            borderWidth: 2,
            duration: const Duration(seconds: 2),
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Passowrd Change Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _oldPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Old Password',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your old password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your New Password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_newPasswordController.text ==
                            _confirmPasswordController.text) {
                          handlePasswordChange();
                        } else {
                          print("asdasdasd");
                          Get.snackbar(
                            'Wrong Password',
                            'New Password and Confirm Password do not match',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            borderRadius: 10,
                            margin: const EdgeInsets.all(10),
                            borderColor: Colors.red,
                            borderWidth: 2,
                            animationDuration:
                                const Duration(milliseconds: 500),
                            duration: const Duration(seconds: 2),
                          );
                        }
                      } else {
                        //show snack bar
                        Get.snackbar(
                          'Error',
                          'Please fill all the fields',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          borderRadius: 10,
                          margin: const EdgeInsets.all(10),
                          borderColor: Colors.red,
                          borderWidth: 2,
                          animationDuration: const Duration(milliseconds: 500),
                          duration: const Duration(seconds: 2),
                        );
                      }
                      // SharedPreferences pref = await SharedPreferences.getInstance();
                      // pref.clear();
                      // Get.offAll(const LoginScreen());
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2.2,
                        fontFamily: GoogleFonts.lato().fontFamily,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
