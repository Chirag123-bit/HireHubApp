import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/category/category_dropdown.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/screens/auth/TextComponent.dart';

class AdditionalInfo extends StatefulWidget {
  User user;
  TextEditingController jobTitleController;
  List<GlobalKey<FormState>> formKeys;

  AdditionalInfo(
      {Key? key,
      required this.user,
      required this.jobTitleController,
      required this.formKeys})
      : super(key: key);

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  String? jobType;

  @override
  void initState() {
    super.initState();
    widget.user.skills = List<String>.empty(growable: true);
    widget.user.skills!.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeys[2],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          TextFieldGenerator(
            label: "Preffered Job Title",
            controller: widget.jobTitleController,
            keyboardType: TextInputType.text,
            validatorText: "Preferred Title is required",
          ),
          const SizedBox(height: 15),
          FutureBuilder<List<DropdownCategory?>>(
              future: CategoryRepository().getCategoriesDropdown(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done ||
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
                          items: snapshot.data!.map((DropdownCategory? sector) {
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
          Container(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 100,
              child: TextFormField(
                initialValue: widget.user.summary ?? "",
                onChanged: (value) {
                  setState(() {
                    widget.user.summary = value;
                  });
                },
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                    labelText: "About Yourself", border: OutlineInputBorder()),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _skillsContainer(),
        ],
      ),
    );
  }

  Widget skillUi(int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        Flexible(
          child: TextFormField(
            // initialValue: widget.user.skills[index] ?? "",
            onChanged: (value) {
              setState(() {
                widget.user.skills![index] = value;
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
                removeEmailControl(index);
              },
            ),
          ),
          visible: index > 0,
        ),
      ]),
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
            itemCount: widget.user.skills!.length,
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

  void addEmailControl() {
    setState(() {
      widget.user.skills!.add("");
    });
  }

  void removeEmailControl(int index) {
    setState(() {
      if (widget.user.skills!.length > 1) {
        widget.user.skills!.removeAt(index);
      }
    });
  }
}
