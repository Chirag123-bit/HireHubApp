import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/screens/employer/home/Applicants/ApplicantList.dart';

class DetailFooter extends StatefulWidget {
  final DashboardJob data;
  const DetailFooter({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailFooter> createState() => _DetailFooterState();
}

class _DetailFooterState extends State<DetailFooter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(kSpacingUnit * 2),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [kFooterShadow],
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ApplicantListScreen(data: widget.data));
                },
                child: Container(
                  height: kSpacingUnit * 5,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                  ),
                  child: Center(
                    child: Text(
                      'View Applicants',
                      style: kTitleTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
