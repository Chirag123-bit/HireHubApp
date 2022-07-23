import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/category/category_dropdown.dart';
import 'package:hirehub/repository/category_repository.dart';
import 'package:hirehub/screens/auth/TextComponent.dart';

class AdditionalInfoEmployer extends StatefulWidget {
  User user;
  TextEditingController jobTitleController;
  TextEditingController country;
  TextEditingController state;
  TextEditingController city;
  TextEditingController companyNameController;
  List<GlobalKey<FormState>> formKeys;

  AdditionalInfoEmployer(
      {Key? key,
      required this.user,
      required this.jobTitleController,
      required this.country,
      required this.state,
      required this.city,
      required this.companyNameController,
      required this.formKeys})
      : super(key: key);

  @override
  State<AdditionalInfoEmployer> createState() => _AdditionalInfoEmployerState();
}

class _AdditionalInfoEmployerState extends State<AdditionalInfoEmployer> {
  String? companyType;
  String selectedCountry = "";
  String selectedState = "";

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
            label: "Company Name",
            controller: widget.companyNameController,
            keyboardType: TextInputType.text,
            validatorText: "Company Name is required",
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
                            labelText: "Preffered Company Sector",
                            hintText: "Select Company Sector",
                            border: OutlineInputBorder(),
                          ),
                          value: companyType,
                          onChanged: (String? newValue) {
                            setState(() {
                              companyType = newValue;
                              widget.user.csector = newValue;
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
          CountryStateCityPicker(
            country: widget.country,
            state: widget.state,
            city: widget.city,
            textFieldInputBorder: const UnderlineInputBorder(),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
