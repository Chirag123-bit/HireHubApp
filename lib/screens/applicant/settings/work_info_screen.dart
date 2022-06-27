import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirehub/models/Work.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';
import 'package:hirehub/screens/widgets/Button.dart';
import 'package:hirehub/theme/Theme.dart';

class EditWorkInfoScreen extends StatefulWidget {
  EditWorkInfoScreen({Key? key}) : super(key: key);
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

  @override
  State<EditWorkInfoScreen> createState() => _EditWorkInfoScreenState();
}

class _EditWorkInfoScreenState extends State<EditWorkInfoScreen> {
  List<Work> works = List<Work>.empty(growable: true);
  Work work1 = Work(
    wtitle: "",
    wcompany: "",
    wlocation: "",
    wtype: "Full Time",
    wstart: "",
    wend: "",
  );

  TextEditingController preferedTitleController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  String? jobType;

  @override
  void initState() {
    super.initState();
    works.add(work1);
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
              Form(
                child: _workSetContainer(),
                key: formKeys,
              ),
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

  Widget _workSetContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Work Experience(s)",
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
                addWorkControl();
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
          itemCount: works.length,
          itemBuilder: (context, index) {
            return Column(children: [
              workUi(index),
            ]);
          },
          separatorBuilder: (context, index) => const Divider(),
        )
      ],
    );
  }

  Widget workUi(int index) {
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
                          "Work ${index + 1}",
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
                              removeWorkControl(index);
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
                    Row(children: [
                      Flexible(
                        child: getTextField(
                          "Job Title",
                          works[index].wtitle!,
                          (value) {
                            setState(
                              () {
                                works[index].wtitle = value;
                              },
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: getTextField(
                          "Company Name",
                          works[index].wcompany!,
                          (value) {
                            setState(
                              () {
                                works[index].wcompany = value;
                              },
                            );
                          },
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "Work Location",
                      works[index].wlocation!,
                      (value) {
                        setState(
                          () {
                            works[index].wlocation = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownComponent(
                      items: widget.workOptions,
                      valueHolder: works[index].wtype,
                      onChanged: (value) {
                        setState(
                          () {
                            works[index].wtype = value;
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getDateField(
                          "Start Date",
                          works[index].wstart!,
                          (value) {
                            setState(
                              () {
                                works[index].wstart = value;
                              },
                            );
                          },
                        ),
                        getDateField("End Date", works[index].wend!, (value) {
                          setState(
                            () {
                              works[index].wend = value;
                            },
                          );
                        }, finalDate: works[index].wstart!),
                      ],
                    )
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

  void addWorkControl() {
    setState(() {
      works.add(Work(
          wtitle: "",
          wcompany: "",
          wlocation: "",
          wtype: "",
          wstart: "",
          wend: ""));
    });
  }

  void removeWorkControl(int index) {
    setState(() {
      if (works.length > 1) {
        works.removeAt(index);
      }
    });
  }
}
