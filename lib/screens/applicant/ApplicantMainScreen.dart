import 'package:flutter/material.dart';
import 'package:hirehub/config/constants.dart';
import 'package:hirehub/screens/applicant/home/HomeScreen.dart';

class ApplicantMainPage extends StatelessWidget {
  const ApplicantMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 8,
        onPressed: (() {}),
        child: const Icon(
          Icons.add,
          color: kBackgroundColor,
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cases_outlined,
                size: 20,
              ),
              label: "Case",
            ),
            BottomNavigationBarItem(
              icon: Text(""),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                size: 20,
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
                size: 20,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
