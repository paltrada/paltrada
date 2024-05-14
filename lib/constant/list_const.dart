import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';

import '../models/ads_data.dart';
import '../models/user_data.dart';


class ListConst {
  static AdsData adsData = AdsData();
  static String fullName = "";
  static String currentPosition = "";
  static String email = "";
  static String number = "";
  static String address = "";
  static String street = "";
  static String country = "";
  static String bio = "";
  static List<ExperienceData> experiences = [];
  static List<Education> educations = [];
  static List<Language> languages = [];
  static List<String> languages1 = [];
  static List<String> hobbies = [];
  static TemplateTheme resumeType = TemplateTheme.classic;

  static String imagePath = "https://instacaptionsforall.in/wp-content/uploads/2023/11/wp6867733.jpg.webp"; // Add this line

  static UserData currentUserData = UserData();

  static RxString degree = "".obs;
  static RxString uni = "".obs;
  static RxString degreeCGPA = "".obs;
  static RxString pgDegree = "".obs;
  static RxString pgUni = "".obs;
  static RxString pgDegreeCGPA = "".obs;
  static RxString class12PG = "".obs;
  static RxString class12School = "".obs;
  static RxString class10PG = "".obs;
  static RxString class10School = "".obs;

}
