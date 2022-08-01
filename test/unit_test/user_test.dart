import 'package:flutter_test/flutter_test.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/Work.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/response/LoginResponse.dart';

void main() {
  late User user;

  setUp(() {
    user = User();
  });

  group("Login Test", () {
    test("Login Test Pass", () async {
      user.username = "Chirag";
      user.password = "Abcd";

      LoginResponse? actualResult = await UserRepository().loginUser(user);

      bool expectedResult = true;

      expect(actualResult!.success, expectedResult);
    });
    test("Login Test Fail", () async {
      user.username = "Chirag";
      user.password = "Abcde";

      LoginResponse? actualResult = await UserRepository().loginUser(user);
      bool expectedResult = true;

      expect(actualResult!.success, expectedResult);
    });
  });

  group("Register Test", () {
    test("Register Test Pass", () async {
      user.firstName = "Chirag";
      user.lastName = "Simkhada";
      user.username = "TestAccount1111";
      user.password = "Abcd";
      user.email = "sadasdamsdadsddwwdwdsidm@gmail.com";
      user.phone = "123456789";
      user.type = "Applicant";
      user.gender = "Male";

      user.title = "Backend Developer";
      user.skills = ["Dart", "Flutter", "Backend"];
      user.summary = "I am a backend developer";
      user.educationSet = [
        Education(
          degree: "Test Tes",
          college: "Softwarica",
          startDate: "2020",
          endDate: "2021",
        )
      ];

      user.workSet = [
        Work(
            job_title: "Test",
            company: "Softwarica",
            startDate: "2020",
            endDate: "2021",
            company_location: "Nepal",
            work_type: "Full Time")
      ];

      bool actualResult = await UserRepository().registerUser(user);
      bool expectedResult = true;

      expect(actualResult, expectedResult);
    });
    test("Register Test Fail", () async {
      user.firstName = "Chirag";
      user.lastName = "Simkhada";
      user.username = "TestAccount";
      user.password = "Abcd";
      user.email = "sadamsdasidm@gmail.com";
      user.phone = "123456789";
      user.type = "Applicant";
      user.gender = "Male";

      user.title = "Backend Developer";
      user.skills = ["Dart", "Flutter", "Backend"];
      user.summary = "I am a backend developer";
      user.educationSet = [
        Education(
          degree: "Test Tes",
          college: "Softwarica",
          startDate: "2020",
          endDate: "2021",
        )
      ];

      user.workSet = [
        Work(
            job_title: "Test",
            company: "Softwarica",
            startDate: "2020",
            endDate: "2021",
            company_location: "Nepal",
            work_type: "Full Time")
      ];

      bool actualResult = await UserRepository().registerUser(user);
      bool expectedResult = true;

      expect(actualResult, expectedResult);
    });
  });
}
