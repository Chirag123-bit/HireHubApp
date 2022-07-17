import 'package:flutter/material.dart';
import 'package:hirehub/config/bezierContainer.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/screens/auth/registerComponents/AccountComponents.dart';
import 'package:hirehub/screens/auth/registerComponents/BasicComponents.dart';
import 'package:hirehub/screens/auth/registerComponents/candidateComponents/AdditionalInfo.dart';
import 'package:hirehub/screens/auth/registerComponents/candidateComponents/ProfessionalInfo.dart';
import 'package:hirehub/screens/auth/registerComponents/employerComponents/AdditionalInfo.dart';
import 'package:hirehub/screens/auth/registerComponents/employerComponents/ProfessionalInfo.dart';
import 'package:motion_toast/motion_toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _currentStep = 0;
  final _globalkey = GlobalKey<FormState>();
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final jobTitleController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final companyNameController = TextEditingController();
  final companyAboutController = TextEditingController();
  final companyDescController = TextEditingController();
  User user = User();

  _registerUser() async {
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      MotionToast.success(
        description: const Text("Register Success"),
      ).show(context);
    } else {
      MotionToast.error(
        description: const Text("Register Failed"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
      ),
      body: Center(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                  top: -height * .07,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: const BezierContainer()),
              Form(
                key: _globalkey,
                child: Theme(
                  data: ThemeData(canvasColor: Colors.transparent),
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _currentStep,
                    steps: getSteps(),
                    physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    onStepContinue: () {
                      final isLastStep = _currentStep == getSteps().length - 1;
                      if (isLastStep) {
                        if (_globalkey.currentState!.validate()) {
                          user.firstName = firstnameController.text;
                          user.lastName = lastnameController.text;
                          user.phone = phoneController.text;
                          user.username = usernameController.text;
                          user.password = passwordController.text;
                          user.email = emailController.text;
                          user.title = jobTitleController.text;
                          user.country = countryController.text;
                          user.region = stateController.text;
                          user.cabout = companyAboutController.text;
                          user.cdesc = companyDescController.text;
                          user.cname = companyNameController.text;
                          _registerUser();
                        } else {
                          MotionToast.error(
                            description:
                                const Text("Please fill the missing fields"),
                          ).show(context);
                        }
                      } else {
                        if (formKeys[_currentStep].currentState!.validate()) {
                          setState(() {
                            _currentStep += 1;
                          });
                        } else {
                          MotionToast.error(
                            description:
                                const Text("Please fill the missing fields"),
                          ).show(context);
                        }
                      }
                    },
                    onStepCancel: () {
                      final isFirstStep = _currentStep == 0;
                      if (isFirstStep) {
                        return;
                      } else {
                        setState(() {
                          _currentStep = _currentStep - 1;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: const Text(''),
          content: BasicComponents(
            user: user,
            firstnameController: firstnameController,
            lastnameController: lastnameController,
            phoneController: phoneController,
            formKeys: formKeys,
          ),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: const Text(''),
          content: AccountComponents(
            user: user,
            usernameController: usernameController,
            passwordController: passwordController,
            emailController: emailController,
            formKeys: formKeys,
          ),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: const Text(''),
          content: user.type == "Applicant"
              ? AdditionalInfo(
                  formKeys: formKeys,
                  user: user,
                  jobTitleController: jobTitleController,
                )
              : AdditionalInfoEmployer(
                  formKeys: formKeys,
                  user: user,
                  country: countryController,
                  state: stateController,
                  city: cityController,
                  jobTitleController: jobTitleController,
                  companyNameController: companyNameController,
                ),
          isActive: _currentStep >= 2,
        ),
        Step(
          title: const Text(''),
          content: user.type == "Applicant"
              ? ProfessionalInfo(
                  formKeys: formKeys,
                  user: user,
                )
              : ProfessionalInfoEmployer(
                  formKeys: formKeys,
                  user: user,
                  companyAboutController: companyAboutController,
                  companyDescController: companyDescController,
                ),
          isActive: _currentStep >= 3,
        ),
      ];
}
