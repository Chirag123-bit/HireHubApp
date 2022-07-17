import 'package:flutter/material.dart';
import 'package:hirehub/models/Users.dart';

class ProfessionalInfoEmployer extends StatefulWidget {
  User user;
  List<GlobalKey<FormState>> formKeys;
  TextEditingController companyAboutController;
  TextEditingController companyDescController;

  ProfessionalInfoEmployer(
      {Key? key,
      required this.user,
      required this.formKeys,
      required this.companyAboutController,
      required this.companyDescController})
      : super(key: key);

  @override
  State<ProfessionalInfoEmployer> createState() =>
      _ProfessionalInfoEmployerState();
}

class _ProfessionalInfoEmployerState extends State<ProfessionalInfoEmployer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        _educationSetContainer(),
        const SizedBox(height: 15),
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
            "Additional Information",
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 15),
          TextFormField(
            minLines: 6,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: widget.companyAboutController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "About your company",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            minLines: 6,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: widget.companyDescController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Describe your company",
            ),
          ),
        ],
      ),
    );
  }
}
