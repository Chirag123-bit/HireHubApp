import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Company.dart';
import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/models/Work.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> updateInfo(Map<String, dynamic> user) async {
    return await UserAPI().updateInfo(user);
  }

  Future<bool> updateCompanyInfo(Map<String, dynamic> user) async {
    return await UserAPI().updateCompanyInfo(user);
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
  static String imageKey = "profile";

  static String companyNameKey = "cname";
  static String countryKey = "country";
  static String regionKey = "region";
  static String companyAboutKey = "cabout";
  static String companyDescKey = "cdesc";
  static String companySectorKey = "csector";
  static String logoKey = "logo";

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

  Future<bool> saveProfileToPreferences(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(imageKey, value);
  }

  Future<String> getProfileFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(imageKey)!;
  }

  Future<bool> saveLogoToPreferences(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(logoKey, value);
  }

  Future<String> getLogoFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(logoKey)!;
  }

  //function to store company details in shared preferences
  Future<void> storeCompanyDetails(Company company) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(countryKey, company.country!);

    prefs.setString(companyNameKey, company.name!);

    prefs.setString(regionKey, company.region!);
    prefs.setString(companySectorKey, company.sector!);
    prefs.setString(phoneKey, company.phone!);

    prefs.setString(companyAboutKey, company.about!);

    prefs.setString(companyDescKey, company.desc!);

    // prefs.setString(idKey, company.id!);
  }

  //function to store job details in shared preferences
  Future<void> storeProfessionalDetails(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(titleKey, user.title ?? "Tiltle");
    prefs.setString(sectorKey, user.sector ?? "Information Technology");
    // prefs.setString(summaryKey, user.summary!);
    prefs.setStringList(skillsKey, user.skills!);
    prefs.setString(idKey, user.id!);
  }

  //function to store work experience in shared preferences
  Future<void> storeWorkDetails(List<Work> works) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> worksEncoded =
        works.map((work) => jsonEncode(work.toJson())).toList();
    prefs.setStringList(workSetKey, worksEncoded);
    // print(education[0].etitle);
  }

  //function to store education details in shared preferences
  Future<void> storeEducationDetails(List<Education> educations) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> educationEncoded =
        educations.map((education) => jsonEncode(education.toJson())).toList();
    prefs.setStringList(educationSetKey, educationEncoded);
    // print(education[0].etitle);
  }

  Future<List<Education>> getEducationDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? educationEncoded = prefs.getStringList(educationSetKey);

    if (educationEncoded == null) {
      List<Education> empty = [];
      return empty;
    }

    List<Education> educations = educationEncoded
        .map((education) => Education.fromJson(jsonDecode(education)))
        .toList();
    return educations;
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
      gender: prefs.getString(genderKey),
    );
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
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
      phone: prefs.getString(phoneKey),
      id: prefs.getString(idKey),
    );
  }

  //function to get job details from shared preferences
  Future<User> getProfessionalDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User(
      title: prefs.getString(titleKey),
      sector: prefs.getString(sectorKey),
      // summary: prefs.getString(summaryKey),
      skills: prefs.getStringList(skillsKey),
      id: prefs.getString(idKey),
    );
  }

  //function to get work experience from shared preferences
  Future<List<Work>> getWorkDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? workEncoded = prefs.getStringList(workSetKey);

    if (workEncoded == null) {
      List<Work> empty = [];
      return empty;
    }

    List<Work> educations =
        workEncoded.map((work) => Work.fromJson(jsonDecode(work))).toList();
    return educations;
  }
}
