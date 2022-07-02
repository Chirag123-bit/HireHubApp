import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/Work.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<LoginResponse?> loginUser(User user) async {
    return await UserAPI().loginUser(user);
  }

  static String fnameKey = "fname";
  static String lnameKey = "lname";
  static String emailKey = "email";
  static String usernameKey = "username";
  static String phoneKey = "phone";
  static String typeKey = "type";
  static String genderKey = "gender";
  static String idKey = "id";

  static String companyNameKey = "cname";
  static String countryKey = "country";
  static String regionKey = "region";
  static String companyAboutKey = "cabout";
  static String companyDescKey = "cdesc";
  static String companySectorKey = "csector";

  static String titleKey = "title";
  static String sectorKey = "sector";
  static String summaryKey = "summary";
  static String skillsKey = "skills";

  static String workSetKey = "workSet";
  static String educationSetKey = "educationSet";

  //function to store basic user details in shared preferences
  Future<void> storeBasicUserDetails(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(fnameKey, user.firstName!);
    prefs.setString(lnameKey, user.lastName!);
    prefs.setString(emailKey, user.email!);
    prefs.setString(usernameKey, user.username!);
    prefs.setString(phoneKey, user.phone!);
    prefs.setString(typeKey, user.type!);
    prefs.setString(idKey, user.id!);
    prefs.setString(genderKey, user.gender!);
  }

  //function to store company details in shared preferences
  Future<void> storeCompanyDetails(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(companyNameKey, user.cname!);
    prefs.setString(countryKey, user.country!);
    prefs.setString(regionKey, user.region!);
    prefs.setString(companyAboutKey, user.cabout!);
    prefs.setString(companyDescKey, user.cdesc!);
    prefs.setString(companySectorKey, user.csector!);
  }

  //function to store job details in shared preferences
  Future<void> storeProfessionalDetails(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(titleKey, user.title!);
    prefs.setString(sectorKey, user.sector!);
    prefs.setString(summaryKey, user.summary!);
    prefs.setStringList(skillsKey, user.skills!);
  }

  //function to store work experience in shared preferences
  Future<void> storeWorkExperience(List<Work> work) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(workSetKey, Work.encode(work));
  }

  //function to store education details in shared preferences
  Future<void> storeEducationDetails(List<Education> education) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(educationSetKey, Education.encode(education));
  }

  //function to get basic user details from shared preferences
  Future<User> getBasicUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User(
      firstName: prefs.getString(fnameKey),
      lastName: prefs.getString(lnameKey),
      email: prefs.getString(emailKey),
      username: prefs.getString(usernameKey),
      phone: prefs.getString(phoneKey),
      type: prefs.getString(typeKey),
      id: prefs.getString(idKey),
    );
  }

  //function to get company details from shared preferences
  Future<User> getCompanyDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User(
      cname: prefs.getString(companyNameKey),
      country: prefs.getString(countryKey),
      region: prefs.getString(regionKey),
      cabout: prefs.getString(companyAboutKey),
      cdesc: prefs.getString(companyDescKey),
      csector: prefs.getString(companySectorKey),
    );
  }

  //function to get job details from shared preferences
  Future<User> getProfessionalDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User(
      title: prefs.getString(titleKey),
      sector: prefs.getString(sectorKey),
      summary: prefs.getString(summaryKey),
      skills: prefs.getStringList(skillsKey),
    );
  }

  //function to get work experience from shared preferences
  Future<List<Work>> getWorkExperience() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Work.decode(prefs.getString(workSetKey) ?? "[]");
  }

  //function to get education details from shared preferences
  Future<List<Education>> getEducationDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Education.decode(prefs.getString(educationSetKey) ?? "[]");
  }
}
