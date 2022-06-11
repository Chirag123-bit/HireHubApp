import 'package:flutter/material.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/Work.dart';
import 'package:hirehub/screens/auth/registerComponents/DropdownComponent.dart';

class ProfessionalInfo extends StatefulWidget {
  User user;
  ProfessionalInfo({Key? key, required this.user}) : super(key: key);

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
        .add(Education(etitle: "", eschool: "", estart: "", eend: ""));
    widget.user.workSet = List<Work>.empty(growable: true);
    widget.user.workSet!.add(Work(
      wtitle: "",
      wcompany: "",
      wlocation: "",
      wtype: "Full Time",
      wstart: "",
      wend: "",
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
    return Column(
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
                      widget.user.educationSet![index].etitle!,
                      (value) {
                        setState(
                          () {
                            widget.user.educationSet![index].etitle = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "College/University",
                      widget.user.educationSet![index].eschool!,
                      (value) {
                        setState(
                          () {
                            widget.user.educationSet![index].eschool = value;
                          },
                        );
                      },
                    ),
                    getDateField(
                      "Start Date",
                      widget.user.educationSet![index].estart!,
                      (value) {
                        setState(
                          () {
                            widget.user.educationSet![index].estart = value;
                          },
                        );
                      },
                    ),
                    getDateField(
                        "End Date", widget.user.educationSet![index].eend!,
                        (value) {
                      setState(
                        () {
                          widget.user.educationSet![index].eend = value;
                        },
                      );
                    }, finalDate: widget.user.educationSet![index].estart!),
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
                    getTextField(
                      "Job Title",
                      widget.user.workSet![index].wtitle!,
                      (value) {
                        setState(
                          () {
                            widget.user.workSet![index].wtitle = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "Company Name",
                      widget.user.workSet![index].wcompany!,
                      (value) {
                        setState(
                          () {
                            widget.user.workSet![index].wcompany = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "Work Location",
                      widget.user.workSet![index].wlocation!,
                      (value) {
                        setState(
                          () {
                            widget.user.workSet![index].wlocation = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownComponent(
                      items: widget.workOptions,
                      valueHolder: widget.user.workSet![index].wtype,
                      onChanged: (value) {
                        setState(
                          () {
                            widget.user.workSet![index].wtype = value;
                          },
                        );
                      },
                    ),
                    getDateField(
                      "Work Start Date",
                      widget.user.workSet![index].wstart!,
                      (value) {
                        setState(
                          () {
                            widget.user.workSet![index].wstart = value;
                          },
                        );
                      },
                    ),
                    getDateField("End Date", widget.user.workSet![index].wend!,
                        (value) {
                      setState(
                        () {
                          widget.user.workSet![index].wend = value;
                        },
                      );
                    }, finalDate: widget.user.workSet![index].wstart!),
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
    return TextFormField(
      initialValue: initialValue,
      onChanged: (value) {
        onChanged(value.toString());
      },
      decoration: InputDecoration(
          labelText: label,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          border: const OutlineInputBorder()),
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
          .add(Education(etitle: "", eschool: "", estart: "", eend: ""));
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
      if (widget.user.workSet!.length > 1) {
        widget.user.workSet!.removeAt(index);
      }
    });
  }
}
