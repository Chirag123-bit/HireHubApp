import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/screens/auth/TextComponent.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:image_picker/image_picker.dart';

class EditBasicInfoScreen extends StatefulWidget {
  const EditBasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditBasicInfoScreen> createState() => _EditBasicInfoScreenState();
}

class _EditBasicInfoScreenState extends State<EditBasicInfoScreen> {
  User user = User();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  String? genderType = "Male";
  File? img;

  List<DropdownMenuItem<String>> genderOptions = const [
    DropdownMenuItem(
      child: Text('Male'),
      value: "Male",
    ),
    DropdownMenuItem(
      child: Text('Female'),
      value: "Female",
    ),
    DropdownMenuItem(
      child: Text('Others'),
      value: "Others",
    ),
  ];

  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(
          () {
            img = File(image.path);
          },
        );
      } else {
        return;
      }
    } catch (e) {
      debugPrint("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10)),
                        ],
                        image: DecorationImage(
                            image: img != null
                                ? FileImage(img!)
                                : Image.asset("assets/images/profile.jpg")
                                    .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryClr,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _showBottomSheet(context);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                key: formKeys,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    const SizedBox(height: 15),
                    Row(children: [
                      Flexible(
                        child: TextFieldGenerator(
                          label: "First Name",
                          controller: firstnameController,
                          keyboardType: TextInputType.text,
                          validatorText: "First Name is required",
                        ),
                      ),
                      Flexible(
                        child: TextFieldGenerator(
                          label: "Last Name",
                          controller: lastnameController,
                          keyboardType: TextInputType.text,
                          validatorText: "Last Name is required",
                        ),
                      )
                    ]),
                    const SizedBox(height: 15),
                    DropdownComponent(
                      items: genderOptions,
                      valueHolder: user.gender,
                      onChanged: (value) {
                        setState(
                          () {
                            user.gender = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFieldGenerator(
                      label: "Phone Number",
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validatorText: "Phone Number is required",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                  label: "Update Info",
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      Get.back();
                    }
                  })
            ],
          )),
    );
  }

  _showBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
            ),
            const Spacer(),
            _bottomSheetButton(
                label: "Open Camera",
                context: context,
                onTap: () {
                  _loadImage(ImageSource.camera);
                  Get.back();
                },
                clr: primaryClr),
            _bottomSheetButton(
                label: "Open Gallery",
                context: context,
                onTap: () {
                  _loadImage(ImageSource.gallery);
                  Get.back();
                },
                clr: Colors.red[300]!),
            const SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
                label: "Close",
                context: context,
                isClose: true,
                onTap: () {
                  Get.back();
                },
                clr: Colors.transparent),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      required BuildContext context,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClose == true ? Colors.transparent : clr,
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[200]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.white
                      : Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
