import 'package:flutter/material.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/Work.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';

class ProfessionalInfo extends StatefulWidget {
  User user;
  List<GlobalKey<FormState>> formKeys;

  ProfessionalInfo({Key? key, required this.user, required this.formKeys})
      : super(key: key);

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
  State<ProfessionalInfo> createState() => _ProfessionalInfoState();
}

class _ProfessionalInfoState extends State<ProfessionalInfo> {
  @override
  void initState() {
    super.initState();
    widget.user.educationSet = List<Education>.empty(growable: true);
    widget.user.educationSet!
        .add(Education(degree: "", college: "", startDate: "", endDate: ""));
    widget.user.workSet = List<Work>.empty(growable: true);
    widget.user.workSet!.add(Work(
      job_title: "",
      company: "",
      work_location: "",
      work_type: "Full Time",
      startDate: "",
      endDate: "",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        _educationSetContainer(),
        const SizedBox(height: 15),
        _workSetContainer(),
      ],
    );
  }

  Widget _educationSetContainer() {
    return Form(
      key: widget.formKeys[3],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Skill(s)",
            textAlign: TextAlign.left,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.user.educationSet!.length,
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

  Widget _workSetContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Work Experience(s)",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: widget.user.workSet!.length,
          itemBuilder: (context, index) {
            return Column(children: [
              WorkUi(index),
            ]);
          },
          separatorBuilder: (context, index) => const Divider(),
        )
      ],
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
                    getTextField(
                      "Degree Title",
                      widget.user.educationSet![index].degree!,
                      (value) {
                        setState(
                          () {
                            widget.user.educationSet![index].degree = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "College/University",
                      widget.user.educationSet![index].college!,
                      (value) {
                        setState(
                          () {
                            widget.user.educationSet![index].college = value;
                          },
                        );
                      },
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getDateField(
                            "Start Date",
                            widget.user.educationSet![index].startDate!,
                            (value) {
                              setState(
                                () {
                                  widget.user.educationSet![index].endDate =
                                      value;
                                },
                              );
                            },
                          ),
                          getDateField("End Date",
                              widget.user.educationSet![index].endDate!,
                              (value) {
                            setState(
                              () {
                                widget.user.educationSet![index].endDate =
                                    value;
                              },
                            );
                          },
                              finalDate:
                                  widget.user.educationSet![index].endDate!),
                        ])
                  ],
                ),
              )),
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
              addEduControl();
            },
          ),
        ),
        visible: index == widget.user.skills!.length - 1,
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
              removeEduControl(index);
            },
          ),
        ),
        visible: index > 0,
      ),
    ]);
  }

  Widget WorkUi(int index) {
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
                    Row(children: [
                      Flexible(
                        child: getTextField(
                          "Job Title",
                          widget.user.workSet![index].job_title!,
                          (value) {
                            setState(
                              () {
                                widget.user.workSet![index].job_title = value;
                              },
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: getTextField(
                          "Company Name",
                          widget.user.workSet![index].company!,
                          (value) {
                            setState(
                              () {
                                widget.user.workSet![index].company = value;
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
                      widget.user.workSet![index].work_location!,
                      (value) {
                        setState(
                          () {
                            widget.user.workSet![index].work_location = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownComponent(
                      items: widget.workOptions,
                      valueHolder: widget.user.workSet![index].work_type,
                      onChanged: (value) {
                        setState(
                          () {
                            widget.user.workSet![index].work_type = value;
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getDateField(
                          "Start Date",
                          widget.user.workSet![index].startDate!,
                          (value) {
                            setState(
                              () {
                                widget.user.workSet![index].startDate = value;
                              },
                            );
                          },
                        ),
                        getDateField(
                            "End Date", widget.user.workSet![index].endDate!,
                            (value) {
                          setState(
                            () {
                              widget.user.workSet![index].endDate = value;
                            },
                          );
                        }, finalDate: widget.user.workSet![index].startDate!),
                      ],
                    )
                  ],
                ),
              )),
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
              addWorkControl();
            },
          ),
        ),
        visible: index == widget.user.skills!.length - 1,
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
              removeWorkControl(index);
            },
          ),
        ),
        visible: index > 0,
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
      widget.user.educationSet!
          .add(Education(degree: "", college: "", startDate: "", endDate: ""));
    });
  }

  void removeEduControl(int index) {
    setState(() {
      if (widget.user.educationSet!.length > 1) {
        widget.user.educationSet!.removeAt(index);
      }
    });
  }

  void addWorkControl() {
    setState(() {
      widget.user.workSet!.add(Work(
          job_title: "",
          company: "",
          work_location: "",
          work_type: "",
          startDate: "",
          endDate: ""));
    });
  }

  void removeWorkControl(int index) {
    setState(() {
      if (widget.user.workSet!.length > 1) {
        widget.user.workSet!.removeAt(index);
      }
    });
  }
}
