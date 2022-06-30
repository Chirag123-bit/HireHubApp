// import 'package:flutter_test/flutter_test.dart';
// import 'package:hirehub/models/Education.dart';
// import 'package:hirehub/models/Users.dart';
// import 'package:hirehub/models/Work.dart';
// import 'package:hirehub/repository/UserRepository.dart';

// void main() {
//   late User user;

//   setUp(() {
//     user = User();
//   });

//   group("Login Test", () {
//     test("Login Test Pass", () async {
//       user.username = "Chirag";
//       user.password = "Abcd";

//       bool actualResult = await UserRepository().loginUser(user);
//       bool expectedResult = true;

//       expect(actualResult, expectedResult);
//     });
//     test("Login Test Fail", () async {
//       user.username = "Chirag";
//       user.password = "Abcde";

//       bool actualResult = await UserRepository().loginUser(user);
//       bool expectedResult = true;

//       expect(actualResult, expectedResult);
//     });
//   });

//   group("Register Test", () {
//     test("Register Test Pass", () async {
//       user.firstName = "Chirag";
//       user.lastName = "Simkhada";
//       user.username = "TestAccount1";
//       user.password = "Abcd";
//       user.email = "sadasdamsdasidm@gmail.com";
//       user.phone = "123456789";
//       user.type = "Applicant";
//       user.gender = "Male";

//       user.title = "Backend Developer";
//       user.skills = ["Dart", "Flutter", "Backend"];
//       user.summary = "I am a backend developer";
//       user.educationSet = [
//         Education(
//           etitle: "Test Tes",
//           eschool: "Softwarica",
//           estart: "2020",
//           eend: "2021",
//         )
//       ];

//       user.workSet = [
//         Work(
//             wtitle: "Test",
//             wcompany: "Softwarica",
//             wstart: "2020",
//             wend: "2021",
//             wlocation: "Nepal",
//             wtype: "Full Time")
//       ];

//       bool actualResult = await UserRepository().registerUser(user);
//       bool expectedResult = true;

//       expect(actualResult, expectedResult);
//     });
//     test("Register Test Fail", () async {
//       user.firstName = "Chirag";
//       user.lastName = "Simkhada";
//       user.username = "TestAccount";
//       user.password = "Abcd";
//       user.email = "sadamsdasidm@gmail.com";
//       user.phone = "123456789";
//       user.type = "Applicant";
//       user.gender = "Male";

//       user.title = "Backend Developer";
//       user.skills = ["Dart", "Flutter", "Backend"];
//       user.summary = "I am a backend developer";
//       user.educationSet = [
//         Education(
//           etitle: "Test Tes",
//           eschool: "Softwarica",
//           estart: "2020",
//           eend: "2021",
//         )
//       ];

//       user.workSet = [
//         Work(
//             wtitle: "Test",
//             wcompany: "Softwarica",
//             wstart: "2020",
//             wend: "2021",
//             wlocation: "Nepal",
//             wtype: "Full Time")
//       ];

//       bool actualResult = await UserRepository().registerUser(user);
//       bool expectedResult = true;

//       expect(actualResult, expectedResult);
//     });
//   });

  
// }
