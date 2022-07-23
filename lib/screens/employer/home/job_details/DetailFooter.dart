import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/screens/employer/home/Applicants/ApplicantList.dart';

class DetailFooter extends StatefulWidget {
  final DashboardJob data;
  Function needRefresh;
  DetailFooter({Key? key, required this.data, required this.needRefresh})
      : super(key: key);

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
    return Container(
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
                Get.to(() => ApplicantListScreen(
                    data: widget.data, needRefresh: widget.needRefresh));
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
    );
  }
}
