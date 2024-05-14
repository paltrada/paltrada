import 'package:get/get.dart';
import 'package:resumebuilder1/screens/choose_carrier/get_typesofjob_screen.dart';
import 'package:resumebuilder1/screens/choose_carrier/why_hire_screen.dart';
import '../screens/choose_carrier/fill_data/filldata1_screen.dart';
import '../screens/choose_carrier/fill_data/filldata2_screen.dart';
import '../screens/choose_carrier/fill_data/educa_screen.dart';
import '../screens/choose_carrier/fill_data/lan_screen.dart';
import '../screens/choose_carrier/fill_data/hobby_screen.dart';
import '../screens/choose_carrier/get_criteria_screen.dart';
import '../screens/choose_carrier/get_education_screen.dart';
import '../screens/choose_carrier/get_userstatus_screen.dart';
import '../screens/choose_carrier/last_screen/last_screen.dart';
import '../screens/choose_carrier/upload_resume/uploadresume_screen.dart';
import '../screens/choose_carrier/uploadorcreate_screen.dart';
import '../screens/create_resume/get_info/adress_screen.dart';
import '../screens/create_resume/get_info/education_screen.dart';
import '../screens/create_resume/get_info/experience_screen.dart';
import '../screens/create_resume/get_info/hobbies_screen.dart';
import '../screens/create_resume/get_info/language_screen.dart';
import '../screens/create_resume/get_info/personaldetail_screen.dart';
import '../screens/create_resume/get_info/resumebuilder_screen.dart';
import '../screens/create_resume/get_info/resumetype_screen.dart';
import '../screens/option/option_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/webview/webview_screen.dart';
import '/screens/coming_soon/coming_soon.dart';
import '/screens/intro/intro1.dart';
import '/screens/intro/intro2.dart';
import '/screens/intro/intro3.dart';
import '/screens/start/start.dart';
import 'routes.dart';

class PageRouting{
  List<GetPage> pageRouting = [
    GetPage(name: Routes.splash, page: () => const SplashRs26()),
    GetPage(name: Routes.intro1, page: () => const IntroPage1Rs26()),
    GetPage(name: Routes.intro2, page: () => const IntroPage2Rs26()),
    GetPage(name: Routes.intro3, page: () => const IntroPage3Rs26()),
    GetPage(name: Routes.start, page: () => const StartPageRs26()),
    GetPage(name: Routes.optionScreen, page: () => const OptionScreen()),
    GetPage(name: Routes.getPersonalDetail, page: () => const GetPersonalDetail()),
    GetPage(name: Routes.getAddress, page: () => const GetAddress()),
    GetPage(name: Routes.getEducation, page: () => const GetEducation()),
    GetPage(name: Routes.getExperience, page: () => const GetExperience()),
    GetPage(name: Routes.getLanguage, page: () => const GetLanguage()),
    GetPage(name: Routes.getHobbies, page: () => const  GetHobbies()),
    GetPage(name: Routes.getResumeType, page: () => const GetResumeType()),
    GetPage(name: Routes.resumeBuilder, page: () => const ResumeBuilderScreen()),
    GetPage(name: Routes.whyHireScreen, page: () => const WhyHireScreen()),
    GetPage(name: Routes.getUserStatusScreen, page: () => const GetUserStatusScreen()),
    GetPage(name: Routes.getEducationScreen, page: () => const GetEducationScreen()),
    GetPage(name: Routes.getCriteriaScreen, page: () => const GetCriteriaScreen()),
    GetPage(name: Routes.getTypesOfJobs, page: () => const GetTypeOfJobScreen()),
    GetPage(name: Routes.uploadOrCreateScreen, page: () => const UploadOrCreateScreen()),
    GetPage(name: Routes.fillData1, page: () => const FillDataScreen1(),),
    GetPage(name: Routes.fillData2, page: () => const FillDataScreen2(),),
    GetPage(name: Routes.educationScreen, page: () => const EducationScreen(),),
    GetPage(name: Routes.languageScreen, page: () => const LanguageScreen(),),
    GetPage(name: Routes.hobbyScreen, page: () => const HobbyScreen(),),
    GetPage(name: Routes.lastScreen, page: () => const LastScreen(),),
    GetPage(name: Routes.uploadResume, page: () => const UploadResumeScreen(),),








    GetPage(name: Routes.comingSoon, page: () => const ComingSoonPageRs26()),
    GetPage(name: Routes.webView, page: () => const WebViewScreenRs26(),),

  ];
}