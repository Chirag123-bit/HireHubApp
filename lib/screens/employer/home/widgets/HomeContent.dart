import 'dart:math';

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/config/Constants.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/repository/job_repository.dart';
import 'package:hirehub/response/jobResponse/dashboard_jobs_response.dart';
import 'package:hirehub/screens/employer/home/widgets/JobCard.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isLoading = true;
  bool isUpdating = false;
  bool isImageLoading = false;
  late SharedPreferences prefs;
  late User user;
  late Image profilePic;
  late Image logo;
  late UserRepository _userRepository;

  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];

  static List<List<Color>> grads = [sky, sunset, sea, mango, fire];

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userRepository = UserRepository();
    user = await _userRepository.getBasicUserDetails();
    String log = await _userRepository.getLogoFromPreferences();
    logo = _userRepository.imageFromBase64String(log);
    setState(() {
      isLoading = false;
    });
  }

  final _random = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndSetDate();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[900] : kSilver,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Jobs',
                      style: kSubTitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => {}),
                      child: Text(
                        'View All',
                        style: kCardTitleTextStyle.copyWith(
                          color:
                              Get.isDarkMode ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 2),
              getDashboardJobsFromDb(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<DashboardJobsResponse?> getDashboardJobsFromDb() {
    return FutureBuilder<DashboardJobsResponse?>(
        future: JobsRepository().getDashboardJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<DashboardJob> lstJobs = snapshot.data!.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: lstJobs.asMap().entries.map((item) {
                  final closeDate = DateTime.parse(item.value.closeDate!);
                  final closeDateString = DateFormat.yMMMd().format(closeDate);

                  return EmployerJobCard(
                      closeDateString: closeDateString,
                      isLoading: isLoading,
                      logo: logo,
                      item: item.value,
                      color: grads[_random.nextInt(grads.length)],
                      needRefresh: getDashboardJobsFromDb);
                }).toList(),
              );
            } else {
              return const Text("No Jobs Found");
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: const [
                CardLoading(
                  height: 100,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                CardLoading(
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                CardLoading(
                  height: 100,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  margin: EdgeInsets.only(bottom: 10),
                ),
              ],
            );
          } else {
            return const Text("Error retriving data");
          }
        });
  }
}
