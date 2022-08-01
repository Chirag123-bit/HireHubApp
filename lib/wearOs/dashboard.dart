import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/APIs/WearOs_api.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/WearOs/GetAppliedJobs.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/response/WearOsResponse/getAppliedJobsResponse.dart';
import 'package:hirehub/wearOs/main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];

  static List<List<Color>> grads = [
    sky,
    sunset,
    sea,
    mango,
    fire,
    sky,
    sunset,
    sea,
    mango,
    fire
  ];

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late SharedPreferences prefs;
  late String token;
  late User user;
  late UserRepository repo;
  bool detailsLoading = false;
  Image? profilePic;
  WearOsApi api = WearOsApi();
  WearOsGetAppliedJobsResponse? resp;
  @override
  void initState() {
    getAndSetData();
  }

  void getAndSetData() async {
    setState(() {
      detailsLoading = true;
    });
    super.initState();
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    repo = UserRepository();
    user = await repo.getBasicUserDetails();
    String prof = await repo.getProfileFromPreferences();
    resp = await api.getAppliedJobs();

    setState(() {
      profilePic = repo.imageFromBase64String(prof);

      detailsLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: const Color(0xff2d2f41),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Logout',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                        value: 'Logout',
                        onTap: () {
                          prefs.clear();
                          Get.to(() => const WearOsApp());
                        },
                      ),
                    ],
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: profilePic != null
                                    ? profilePic!.image
                                    : Image.asset("assets/images/profile.jpg")
                                        .image,
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          detailsLoading
                              ? "Loading...."
                              : "${user.firstName} ${user.lastName}",
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const Text(
                "My Applied Jobs",
                style: TextStyle(
                  fontFamily: "avenir",
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                  child: FutureBuilder<WearOsGetAppliedJobsResponse?>(
                      future: WearOsApi().getAppliedJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done ||
                            snapshot.hasData) {
                          if (snapshot.hasData) {
                            List<AppliedJob> lstJobs = snapshot.data!.jobs!;
                            return ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                final appliedDate =
                                    DateTime.parse(lstJobs[index].appliedDate!);
                                final appliedDateString =
                                    DateFormat.yMMMM().format(appliedDate);
                                return Container(
                                  height: 45,
                                  margin: const EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: DashboardScreen.grads[index],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: DashboardScreen
                                              .grads[index].last
                                              .withOpacity(0.4),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          offset: const Offset(1, 1),
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 2),
                                    child: Column(
                                      children: [
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              lstJobs[index].job!.title!,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "avenir",
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  "Date: ",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                                Text(
                                                  appliedDateString,
                                                  style: const TextStyle(
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  "Status: ",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                                Text(
                                                  lstJobs[index].status!,
                                                  style: const TextStyle(
                                                      fontSize: 8),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: lstJobs.length,
                            );
                          }
                          return const Text("No Jobs Found");
                        } else if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.hasData == false) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const Text("Error retriving data");
                        }
                      }))

              // Card(
              //   // shape:
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
