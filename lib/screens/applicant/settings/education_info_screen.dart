import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';

class EditEducationalInfoScreen extends StatefulWidget {
  const EditEducationalInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditEducationalInfoScreen> createState() =>
      _EditEducationalInfoScreenState();
}

class _EditEducationalInfoScreenState extends State<EditEducationalInfoScreen> {
  List<Education> educations = List<Education>.empty(growable: true);
  Education edu1 = Education(etitle: "", eschool: "", estart: "", eend: "");

  TextEditingController preferedTitleController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  String? jobType;

  @override
  void initState() {
    super.initState();
    educations.add(edu1);
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
              _educationSetContainer(),
              MyButton(
                  label: "Update Info",
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      Get.back();
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
                      educations[index].etitle!,
                      (value) {
                        setState(
                          () {
                            educations[index].etitle = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "College/University",
                      educations[index].eschool!,
                      (value) {
                        setState(
                          () {
                            educations[index].eschool = value;
                          },
                        );
                      },
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getDateField(
                            "Start Date",
                            educations[index].estart!,
                            (value) {
                              setState(
                                () {
                                  educations[index].estart = value;
                                },
                              );
                            },
                          ),
                          getDateField("End Date", educations[index].eend!,
                              (value) {
                            setState(
                              () {
                                educations[index].eend = value;
                              },
                            );
                          }, finalDate: educations[index].estart!),
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
      educations.add(Education(etitle: "", eschool: "", estart: "", eend: ""));
    });
  }

  void removeEduControl(int index) {
    setState(() {
      if (educations.length > 1) {
        educations.removeAt(index);
      }
    });
  }
}
