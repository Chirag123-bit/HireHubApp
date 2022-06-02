import 'package:flutter/material.dart';
import 'package:hirehub/screens/splash/container/SplashContent.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Find peaks of your career at HireHub",
      // "image": "assets/images/Sally.png",
      "image": "assets/images/flag.svg",
    },
    {
      "text": "Find the job that suits your personality",
      "image": "assets/images/offer.svg",
    },
    {
      "text": "Hire the right person for your project",
      "image": "assets/images/interview.svg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
              flex: 9,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]["text"]!,
                ),
              )),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
