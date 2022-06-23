import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Company.dart';

class CompanyCard extends StatelessWidget {
  Company company;
  CompanyCard({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kSpacingUnit * 1),
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 0.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(kSpacingUnit * 2),
      ),
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            company.avatarImage!,
            height: 50,
            width: 50,
          ),
          const Spacer(),
          Text(
            company.name!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            company.country! + ", " + company.region!,
            style: const TextStyle(fontSize: 12),
          ),
          const Spacer(),
          //button to view company profile

          // const Spacer(),
        ],
      ),
    );
  }
}
