import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/models/Company.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditCompanyDetailScreen extends StatefulWidget {
  const EditCompanyDetailScreen({Key? key}) : super(key: key);

  @override
  State<EditCompanyDetailScreen> createState() =>
      _EditCompanyDetailScreenState();
}

class _EditCompanyDetailScreenState extends State<EditCompanyDetailScreen> {
  bool isLoading = false;
  bool isUpdating = false;
  bool isImageLoading = false;
  String? companyType;
  late String _imageUrl;
  late SharedPreferences prefs;
  late User user;
  late UserRepository _userRepository;
  late TextEditingController companyAboutController;
  late TextEditingController companyDesController;

  String? genderType;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndSetDate();
  }

  void updateCompanyInfo(User user) async {
    setState(() {
      isUpdating = true;
    });
    var dbUser = await _userRepository.getCompanyDetails();
    await _userRepository.updateCompanyInfo({
      "cname": dbUser.cname,
      "country": dbUser.country,
      "region": dbUser.region,
      "csector": dbUser.csector,
      "phone": dbUser.phone,
      "cabout": dbUser.cabout,
      "desc": dbUser.cdesc
    });
    setState(() {
      isUpdating = false;
    });
    Get.back();
    MotionToast.success(
      description: const Text("Company Info Updated"),
    ).show(context);
  }

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    user = await _userRepository.getCompanyDetails();
    setState(() {
      isLoading = false;
      companyAboutController = TextEditingController(text: user.cabout);
      companyDesController = TextEditingController(text: user.cdesc);

      isLoading = false;
    });
  }

  final formKeys = GlobalKey<FormState>();

  File? img;

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
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : TextFormField(
                            minLines: 6,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: companyAboutController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "About your company",
                            ),
                          ),

                    const SizedBox(height: 15),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : TextFormField(
                            minLines: 6,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: companyDesController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Describe your company",
                            ),
                          ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                  label: "Update Info",
                  isUpdating: isUpdating,
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      Company company = Company(
                        name: user.cname,
                        country: user.country,
                        region: user.region,
                        sector: user.csector,
                        phone: user.phone,
                        about: companyAboutController.text,
                        desc: companyDesController.text,
                      );
                      _userRepository.storeCompanyDetails(company);
                      updateCompanyInfo(user);
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
