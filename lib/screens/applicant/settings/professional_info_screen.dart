import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/category/category_dropdown.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/screens/auth/TextComponent.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';

class EditProfessionalInfoScreen extends StatefulWidget {
  const EditProfessionalInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditProfessionalInfoScreen> createState() =>
      _EditProfessionalInfoScreenState();
}

class _EditProfessionalInfoScreenState
    extends State<EditProfessionalInfoScreen> {
  User user = User();
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
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  String? jobType;

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
                            image:
                                Image.asset("assets/images/profile.jpg").image,
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
                          onPressed: () {},
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
                                      // prefixIcon: Icon(Icons.category),
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
                    const SizedBox(height: 15),
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
}
