// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_resume_template/flutter_resume_template.dart';
// import 'package:get/get.dart';
// import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';
//
// import '../../../advertisement/constant.dart';
// import '../../../advertisement/google_ads.dart';
// import '../../../constant/list_const.dart';
// import '../../../models/preload_ad.dart';
//
// class ResumeBuilderScreen extends StatefulWidget {
//   const ResumeBuilderScreen({super.key});
//
//   @override
//   State<ResumeBuilderScreen> createState() => _ResumeBuilderScreenState();
// }
//
// class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
//
//   @override
//   void initState() {
//     getPreLoadAds();
//     stopLoader();
//     log("ListConst.experiences ?????????? ${ListConst.experiences}");
//     super.initState();
//   }
//
//   PreloadAd adsManager = Get.arguments;
//
//   RxString imagePath = "".obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return customScaffold(
//         bannerFacebookAd: adsManager.facebookBanner,
//         bannerGoogleAd: adsManager.googleBanner,
//         nativeFacebookAd: adsManager.facebookNative,
//         nativeGoogleAd: adsManager.googleNative,
//         context: context,
//         children: [
//
//           FlutterResumeTemplate(
//
//            data: TemplateData(fullName: ListConst.fullName,
//
//                address: ListConst.address,
//                bio: ListConst.bio,
//                country: ListConst.country,
//                currentPosition: ListConst.currentPosition,
//                educationDetails: ListConst.educations,
//                email: ListConst.email,
//                experience: ListConst.experiences,
//                hobbies: ListConst.hobbies,
//                languages: ListConst.languages,
//
//                //image: imagePath.isNotEmpty ? File(imagePath.value).uri.toString() : "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
//                // image: imagePath.isNotEmpty
//                //     ? imagePath.value
//                //     : "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
//                //image:  imagePath.isNotEmpty ? File(ListConst.imagePath).uri.toString() : "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
//
//                // ... other properties ...
//                phoneNumber: ListConst.number,
//                street: ListConst.street),
//            templateTheme: ListConst.resumeType,
//            mode: TemplateMode.readOnlyMode,
//            imageBoxFit: BoxFit.cover,
//
//            height: 1500,
//            onSaveResume: (globalKey) async {
//
//              throw await PdfHandler().createResume(globalKey);
//
//              // await PdfHandler().createResume(globalKey);
//            }
//
//
//
//        ),
//
//
//
//         ]);
//   }
//   void stopLoader() async {
//     if (isAllScreenAppOpenOn == true) {
//       log("Loader =======");
//       await Future.delayed(const Duration(seconds: 3))
//           .then((value) => isOpenLoader.value = true);
//       setState(() {});
//     }
//   }
//
// }
//
//
//
//
//
//

//













import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';
import '../../../../../../../constant/list_const.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../custom_widget/custom_button.dart';
import '../../../custom_widget/custom_scaffold.dart';
import 'package:http/http.dart' as http;
import '../../../models/preload_ad.dart';
import 'dart:ui' as ui;
import '../../choose_carrier/fill_data/mobile.dart';

class ResumeBuilderScreen extends StatefulWidget {
  const ResumeBuilderScreen({super.key});

  @override
  State<ResumeBuilderScreen> createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {

    @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    log("ListConst.experiences ?????????? ${ListConst.experiences}");
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  RxString imagePath = "".obs;
  GlobalKey<FormState> formKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return customScaffold(
        context: context,
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        children: [
          Container(),

                  Container(
                    child: FlutterResumeTemplate(
                              data: TemplateData(
                                fullName: ListConst.fullName,
                                address: ListConst.address,
                                bio: ListConst.bio,
                                country: ListConst.country,
                                currentPosition: ListConst.currentPosition,
                                educationDetails: ListConst.educations,
                                email: ListConst.email,
                                experience: ListConst.experiences,
                                hobbies: ListConst.hobbies,
                                languages: ListConst.languages,
                                phoneNumber: ListConst.number,
                                street: ListConst.street,

                              ),
                              templateTheme: ListConst.resumeType,
                              mode: TemplateMode.readOnlyMode,
                              imageBoxFit: BoxFit.cover,
                              height: 1500,
                            ),
                  ),
        CustomButton(onPressed: () {
          _createPDF();
        }, buttonText: "PDF")

        ]);
  }


    Future<void> _createPDF() async {
      print("============>${ListConst.currentUserData.name} ${ListConst.currentUserData.degree}");

      log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
      log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");

      PdfDocument document = PdfDocument();
      final page = document.pages.add();

      // Calculate the center position on the page
      double centerX = page.getClientSize().width / 2;

      page.graphics.drawString(
        "Resume",
        PdfStandardFont(PdfFontFamily.helvetica, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
        bounds: Rect.fromLTWH(centerX, 0, 0, 0),
      );
      final GlobalKey globalKey = GlobalKey();



      // Save the PDF
      List<int> bytes = await document.save();
      document.dispose();
      saveAndLaunchFile(bytes, 'Output.pdf');
    }


  void stopLoader() async {
    if (isAllScreenAppOpenOn == true) {
      log("Loader =======");
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => isOpenLoader.value = true);
      setState(() {});
    }
  }

}



// Future<void> _createPDF() async {
//   print(
//       "============>${ListConst.currentUserData.name} ${ListConst.currentUserData.degree}");
//
//   log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
//   log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
//   PdfDocument document = PdfDocument();
//   final page = document.pages.add();
//   // Calculate the center position on the page
//   double centerX = page.getClientSize().width / 2;
//
//
//   page.graphics.drawString(
//       "Resume", PdfStandardFont(PdfFontFamily.helvetica, 50),
//       format: PdfStringFormat(alignment: PdfTextAlignment.center),
//       bounds: Rect.fromLTWH(centerX, 0, 0, 0));
//
//   page.graphics.drawString("${ListConst.currentUserData.name}",
//       // PdfStandardFont(PdfFontFamily.helvetica, 24),
//       PdfStandardFont(PdfFontFamily.helvetica, 22, style: PdfFontStyle.bold),
//       format: PdfStringFormat(alignment: PdfTextAlignment.left),
//       bounds: Rect.fromLTWH(5, Get.height * 0.24, 0, 0));
//
//
//   // Create a Container with FlutterResumeTemplate as child
//   Container resumeContainer = Container(
//     child: FlutterResumeTemplate(
//       data: TemplateData(
//         fullName: ListConst.fullName,
//         address: ListConst.address,
//         bio: ListConst.bio,
//         country: ListConst.country,
//         currentPosition: ListConst.currentPosition,
//         educationDetails: ListConst.educations,
//         email: ListConst.email,
//         experience: ListConst.experiences,
//         hobbies: ListConst.hobbies,
//         languages: ListConst.languages,
//         phoneNumber: ListConst.number,
//         street: ListConst.street,
//       ),
//       templateTheme: ListConst.resumeType,
//       mode: TemplateMode.readOnlyMode,
//       imageBoxFit: BoxFit.cover,
//       height: 1500,
//     ),
//   );
//
//   // Add the Container to the PDF page
//   resumeContainer.layout(BoxConstraints(
//     maxWidth: page.getClientSize().width,
//   ));
//   resumeContainer.paint(page.graphics, Offset(0, 0));
//
//   // Save the PDF
//   List<int> bytes = await document.save();
//   document.dispose();
//   saveAndLaunchFile(bytes, 'Output.pdf');
// }



