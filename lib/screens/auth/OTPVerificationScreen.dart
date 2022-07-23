import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/screens/auth/Login.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late UserRepository userRepository;
  late String email;
  late String id;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get user from shared prefs
    setState(() {
      isLoading = true;
    });
    String isVerif = GetStorage().read("isVerified");
    if (isVerif == "true") {
      Get.offAllNamed("/home");
    }
    userRepository = UserRepository();
    getAndSetData();
  }

  getAndSetData() async {
    User user = await userRepository.getBasicUserDetails();
    setState(() {
      email = user.email!;
      id = user.id!;
      isLoading = false;
    });
    handleCodeSend();
  }

  handleCodeSend() async {
    UserAPI api = UserAPI();
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> resp = await api.sendOTP(id, email);
    if (resp["status"] == "success") {
      Get.snackbar(
        "Success",
        resp["message"],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      setState(() {
        isLoading = false;
      });
      Get.offNamed("/otpverification");
    } else {
      setState(() {
        isLoading = false;
      });
      Get.snackbar(
        "Info",
        resp["message"],
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
      );
    }
  }

  handleCodeSubmit(String code) async {
    if (code.length != 6) {
      Get.snackbar(
        "Error",
        "Invalid OTP",
        backgroundColor: Colors.yellow,
        colorText: Colors.black,
      );
      return;
    }
    UserAPI api = UserAPI();
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> resp = await api.verifyOTP(id, code);
    try {
      if (resp["success"] == true) {
        Get.snackbar(
          "Success",
          resp["message"] + "! \n Please wait while we are redirecting you...",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        setState(() {
          isLoading = false;
        });
        Get.to(const LoginScreen());
        return;
      } else {
        setState(() {
          isLoading = false;
        });
        Get.snackbar(
          "Error",
          resp["message"],
          backgroundColor: Colors.red,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      // Get.snackbar(
      //   "Error",
      //   e.toString(),
      //   backgroundColor: Colors.red,
      //   colorText: Colors.black,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          SvgPicture.asset(
            "assets/icons/email.svg",
            width: 300,
            height: 300,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text("Enter the OTP sent to your email address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ),
          Text(
            isLoading ? "Loading...." : email,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
                colorBuilder: FixedColorBuilder(
                  Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              // onCodeChanged: (code) {
              //   print(code);
              // },
              onCodeSubmitted: (code) {
                handleCodeSubmit(code);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Verify OTP", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Didn't receive OTP?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Center(
            child: Text(
              "Resend OTP",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          //button to verify OTP
        ],
      ),
    ));
  }
}
