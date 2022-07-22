import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/category/category_dropdown.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/screens/auth/TextComponent.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfessionalInfoScreen extends StatefulWidget {
  const EditProfessionalInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditProfessionalInfoScreen> createState() =>
      _EditProfessionalInfoScreenState();
}

class _EditProfessionalInfoScreenState
    extends State<EditProfessionalInfoScreen> {
  List<String> skills = [""];
  List<DropdownMenuItem<String>> workOptions = const [
    DropdownMenuItem(
      child: Text('Full Time'),
      value: "Full Time",
    ),
    DropdownMenuItem(
      child: Text('Part Time'),
      value: "Part Time",
    ),
  ];
  bool isLoading = false;
  bool isImageLoading = false;
  bool isUpdating = false;
  late String _imageUrl;
  late SharedPreferences prefs;
  late User user;
  late UserRepository _userRepository;
  late TextEditingController preferedTitleController;
  late TextEditingController aboutController;
  final formKeys = GlobalKey<FormState>();
  String? jobType;
  File? img;
  Image? profilePic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndSetDate();
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

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    user = await _userRepository.getProfessionalDetails();
    String prof = await _userRepository.getProfileFromPreferences();
    profilePic = _userRepository.imageFromBase64String(prof);
    setState(() {
      isLoading = false;
      preferedTitleController = TextEditingController(text: user.title);
      aboutController = TextEditingController();
      jobType = user.sector ?? "Education";
      skills = user.skills ?? [""];
      isLoading = false;
    });
  }

  void updateProfessionalInfo(User user) async {
    setState(() {
      isUpdating = true;
    });
    await _userRepository.updateInfo(
        {"title": user.title, "sector": user.sector, "skills": user.skills});
    setState(() {
      isUpdating = false;
    });
    Get.back();
    MotionToast.success(
      description: const Text("Professional Info Updated"),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Professional Details"),
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
                "Edit Professional Information",
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
              Form(
                key: formKeys,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    const SizedBox(height: 10),
                    TextFieldGenerator(
                      label: "Prefered Job Title",
                      controller: preferedTitleController,
                      keyboardType: TextInputType.text,
                      validatorText: "Job Title is required",
                    ),

                    FutureBuilder<List<DropdownCategory?>>(
                        future: CategoryRepository().getCategoriesDropdown(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done ||
                              snapshot.hasData) {
                            if (snapshot.hasData) {
                              return Theme(
                                data: ThemeData(
                                  canvasColor: const Color(0xfff3f3f4),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Preffered Job Sector",
                                      hintText: "Select Job Sector",
                                      border: OutlineInputBorder(),
                                    ),
                                    value: jobType,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        jobType = newValue;
                                      });
                                    },
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: snapshot.data!
                                        .map((DropdownCategory? sector) {
                                      return DropdownMenuItem(
                                        child: Text(sector!.title!),
                                        value: sector.id,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            }
                            return const Text("No Sectors Found");
                          } else if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              snapshot.hasData == false) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return const Text("Error retriving data");
                          }
                        }),

                    Container(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 120,
                        child: TextFormField(
                          initialValue: aboutController.text,
                          onChanged: (value) {
                            setState(() {
                              aboutController.text = value;
                            });
                          },
                          expands: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                              labelText: "About Yourself",
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    _skillsContainer(),
                  ],
                ),
              ),
              MyButton(
                  label: "Update Info",
                  isUpdating: isUpdating,
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      user.title = preferedTitleController.text;
                      user.sector = jobType;
                      // user. = phoneController.text;
                      user.skills = skills;
                      _userRepository.storeProfessionalDetails(user);
                      updateProfessionalInfo(user);
                    }
                  }),
              const SizedBox(height: 25),
            ],
          )),
    );
  }

  Widget _skillsContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Skill(s)",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return Column(children: [
                skillUi(index),
              ]);
            },
            separatorBuilder: (context, index) => const Divider(),
          )
        ],
      ),
    );
  }

  Widget skillUi(int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        isLoading
            ? const CircularProgressIndicator()
            : Flexible(
                child: TextFormField(
                  initialValue: skills[index],
                  onChanged: (value) {
                    setState(() {
                      skills[index] = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Skill ${index + 1} is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Skill ${index + 1}',
                      border: const OutlineInputBorder()),
                ),
              ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: const Icon(
                Icons.add_circle,
                color: Colors.orange,
              ),
              onPressed: () {
                addEmailControl();
              },
            ),
          ),
          visible: index == skills.length - 1,
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.black,
              ),
              onPressed: () {
                removeEmailControl(index);
              },
            ),
          ),
          visible: index > 0,
        ),
      ]),
    );
  }

  void addEmailControl() {
    setState(() {
      skills.add("");
    });
  }

  void removeEmailControl(int index) {
    setState(() {
      if (skills.length > 1) {
        skills.removeAt(index);
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
