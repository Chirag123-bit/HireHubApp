import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditEducationalInfoScreen extends StatefulWidget {
  const EditEducationalInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditEducationalInfoScreen> createState() =>
      _EditEducationalInfoScreenState();
}

class _EditEducationalInfoScreenState extends State<EditEducationalInfoScreen> {
  Education edu1 =
      Education(degree: "", college: "", startDate: "", endDate: "");

  final formKeys = GlobalKey<FormState>();
  String? jobType;
  File? img;
  bool isLoading = false;
  bool isUpdating = false;
  bool isImageLoading = false;
  late SharedPreferences prefs;
  late List<Education> educations;
  late UserRepository _userRepository;
  Image? profilePic;
  late User user;

  @override
  void initState() {
    super.initState();
    getAndSetData();
  }

  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        File uploadImage = File(image.path);
        bool? success = await UserAPI().updateProfilePic(uploadImage);

        if (success == true) {
          img = File(image.path);
          final bytes = img!.readAsBytesSync();
          user = await _userRepository.getBasicUserDetails();
          await _userRepository
              .saveProfileToPreferences(_userRepository.base64String(bytes));
          setState(
            () {
              img = File(image.path);
              profilePic = Image.file(img!);
            },
          );
          Get.back();
          MotionToast.success(
            description: const Text("Profile Picture Updated"),
          ).show(context);
        } else {
          MotionToast.error(
            description: const Text("Profile Picture Update Failed"),
          ).show(context);
        }
      } else {
        print("No image selected");
        return;
      }
    } catch (e) {
      print(e);
      debugPrint("Failed to pick image $e");
    }
  }

  void getAndSetData() async {
    setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    List<Education> educationSaved =
        await _userRepository.getEducationDetails();
    String prof = await _userRepository.getProfileFromPreferences();
    profilePic = _userRepository.imageFromBase64String(prof);
    setState(() {
      isLoading = false;
      educations = educationSaved;
      isLoading = false;
    });
  }

  void updateEducationalInfo() async {
    setState(() {
      isUpdating = true;
    });
    await _userRepository.updateInfo({"education": educations});
    setState(() {
      isUpdating = false;
    });
    Get.back();
    MotionToast.success(
      description: const Text("Education Records Updated"),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Educational Records"),
        centerTitle: true,
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
                "Edit Education Records",
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
                            image: profilePic != null
                                ? profilePic!.image
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
              isLoading
                  ? const CircularProgressIndicator()
                  : _educationSetContainer(),
              MyButton(
                  label: "Update Info",
                  isUpdating: isUpdating,
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      updateEducationalInfo();
                      // Get.back();
                    }
                  }),
              const SizedBox(height: 25),
            ],
          )),
    );
  }

  Widget _educationSetContainer() {
    return Form(
      key: formKeys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Skill(s)",
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  addEduControl();
                },
                color: Theme.of(context).colorScheme.secondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: educations.length,
            itemBuilder: (context, index) {
              return Column(children: [
                educationUi(index),
              ]);
            },
            separatorBuilder: (context, index) => const Divider(),
          )
        ],
      ),
    );
  }

  Widget educationUi(int index) {
    return Row(children: [
      Flexible(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skill ${index + 1}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: index > 0,
                          child: RaisedButton(
                            onPressed: () {
                              removeEduControl(index);
                            },
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                Text(
                                  'Remove',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    getTextField(
                      "Degree Title",
                      educations[index].degree ?? "Bs. in Computer Science",
                      (value) {
                        setState(
                          () {
                            educations[index].degree = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "College/University",
                      educations[index].college ?? "Coventry University",
                      (value) {
                        setState(
                          () {
                            educations[index].college = value;
                          },
                        );
                      },
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getDateField(
                            "Start Date",
                            educations[index].startDate!.split("T")[0],
                            (value) {
                              setState(
                                () {
                                  educations[index].startDate = value;
                                },
                              );
                            },
                          ),
                          getDateField("End Date",
                              educations[index].endDate!.split("T")[0],
                              (value) {
                            setState(
                              () {
                                educations[index].endDate = value;
                              },
                            );
                          }, finalDate: educations[index].startDate!),
                        ])
                  ],
                ),
              )),
        ),
      ),
    ]);
  }

  Widget getTextField(String label, String initialValue, Function onChanged) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: (value) {
          onChanged(value.toString());
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }

  getDateField(String label, String initialValue, Function onChanged,
      {String finalDate = ""}) {
    List<String> finalDateArr = [];
    bool isFinalDate = false;
    if (finalDate != "") {
      finalDateArr = finalDate.split("-");
      isFinalDate = true;
    }
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: isFinalDate
                  ? DateTime(int.parse(finalDateArr[0]),
                      int.parse(finalDateArr[1]), int.parse(finalDateArr[2]))
                  : DateTime(1900),
              lastDate: DateTime(2050),
            ).then((value) {
              if (value != null) {
                onChanged(value.toString().split(" ")[0]);
              }
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label), // <-- Text
              const SizedBox(
                width: 2,
              ),
              const Icon(
                // <-- Icon
                Icons.calendar_month,
                size: 15.0,
              ),
            ],
          ),
        ),
        Text(initialValue),
      ],
    );
  }

  void addEduControl() {
    setState(() {
      educations
          .add(Education(degree: "", college: "", startDate: "", endDate: ""));
    });
  }

  void removeEduControl(int index) {
    setState(() {
      if (educations.length > 1) {
        educations.removeAt(index);
      }
    });
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
