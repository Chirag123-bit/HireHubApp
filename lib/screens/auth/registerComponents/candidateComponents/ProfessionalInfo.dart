import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      company_location: "",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Education(s)",
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
          itemCount: widget.user.workSet!.length,
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
                          "Education ${index + 1}",
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
                            widget.user.educationSet![index].startDate!
                                .split("T")[0],
                            (value) {
                              setState(
                                () {
                                  widget.user.educationSet![index].startDate =
                                      value;
                                },
                              );
                            },
                          ),
                          getDateField(
                              "End Date",
                              widget.user.educationSet![index].endDate!
                                  .split("T")[0], (value) {
                            setState(
                              () {
                                widget.user.educationSet![index].endDate =
                                    value;
                              },
                            );
                          },
                              finalDate:
                                  widget.user.educationSet![index].startDate!),
                        ])
                  ],
                ),
              )),
        ),
      ),
    ]);
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
                      widget.user.workSet![index].company_location ?? "",
                      (value) {
                        setState(
                          () {
                            widget.user.workSet![index].company_location =
                                value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownComponent(
                      items: widget.workOptions,
                      valueHolder:
                          widget.user.workSet![index].work_type ?? "Part Time",
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
                          widget.user.workSet![index].startDate!.split("T")[0],
                          (value) {
                            setState(
                              () {
                                widget.user.workSet![index].startDate = value;
                              },
                            );
                          },
                        ),
                        getDateField("End Date",
                            widget.user.workSet![index].endDate!.split("T")[0],
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
          company_location: "",
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
