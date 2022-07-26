import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];

  static List<List<Color>> grads = [sky, sunset, sea, mango, fire];

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
                      const PopupMenuItem(
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Logout',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                        value: 'Logout',
                      ),
                    ],
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Chirag Simkhada",
                          style: TextStyle(
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
                child: ListView(
                  children: [
                    Container(
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: grads[0],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: grads[0].last.withOpacity(0.4),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/google_logo.png",
                                  width: 13,
                                  height: 13,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Backend Developer",
                                  style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Date: ",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "2020-01-05",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Status: ",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "Selected",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: grads[3],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: grads[3].last.withOpacity(0.4),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/google_logo.png",
                                  width: 13,
                                  height: 13,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Backend Developer",
                                  style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Date: ",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "2020-01-05",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Status: ",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "Selected",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: grads[1],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: grads[1].last.withOpacity(0.4),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/google_logo.png",
                                  width: 13,
                                  height: 13,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Backend Developer",
                                  style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Date: ",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "2020-01-05",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Status: ",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "Selected",
                                      style: TextStyle(fontSize: 8),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )

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
