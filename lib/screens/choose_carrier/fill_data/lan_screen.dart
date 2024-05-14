// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import '../../../../../../../utils/show.dart';
// import '../../../advertisement/constant.dart';
// import '../../../advertisement/google_ads.dart';
// import '../../../constant/list_const.dart';
// import '../../../custom_widget/custom_button.dart';
// import '../../../custom_widget/custom_scaffold.dart';
// import '../../../custom_widget/custom_text.dart';
// import '../../../models/preload_ad.dart';
// import '../../../routing/routes.dart';
// import 'mobile.dart';
//
// class FillDataScreen4 extends StatefulWidget {
//   const FillDataScreen4({super.key});
//
//   @override
//   State<FillDataScreen4> createState() => _FillDataScreen4State();
// }
//
// class _FillDataScreen4State extends State<FillDataScreen4> {
//   GlobalKey<FormState> formKey = GlobalKey();
//   TextEditingController pgCollagePerController = TextEditingController();
//   TextEditingController collagePerController = TextEditingController();
//   TextEditingController perOf12Controller = TextEditingController();
//   TextEditingController perOf10Controller = TextEditingController();
//   PreloadAd adsManager = Get.arguments;
//
//   @override
//   void initState() {
//     getPreLoadAds();
//     stopLoader();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return customScaffold(
//         context: context,
//         bannerFacebookAd: adsManager.facebookBanner,
//         bannerGoogleAd: adsManager.googleBanner,
//         nativeFacebookAd: adsManager.facebookNative,
//         nativeGoogleAd: adsManager.googleNative,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   const CustomText(text: "Please fill Information",size: 16),
//                   const SizedBox(height: 15,),
//                   getTextField("Enter your Post Graduation CGPA/SGPA", pgCollagePerController,
//                       TextInputType.number),
//                   getTextField("Enter your CGPA/SGPA", collagePerController,
//                       TextInputType.number),
//                   getTextField("Enter your 12th Percentage", perOf12Controller,
//                       TextInputType.number),
//                   getTextField("Enter your 10th Percentage", perOf10Controller,
//                       TextInputType.number),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, bottom: 20),
//                     child: CustomButton(
//                         onPressed: _createPDF,
//                         buttonText: "View Resume",
//                         weight: true),
//                   ),
//                   CustomButton(
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           ListConst.currentUserData.pgCgpaSgpa =
//                               pgCollagePerController.text;
//                           ListConst.currentUserData.cgpaSgpa =
//                               collagePerController.text;
//                           ListConst.currentUserData.the10ThPercentage =
//                               perOf10Controller.text;
//                           ListConst.currentUserData.the12ThPercentage =
//                               perOf12Controller.text;
//                           log("pgCollagePerController >>> ${pgCollagePerController}");
//                           show(
//                             Routes.lastScreen,
//                             argument: PreloadAd(
//                                 googleNative: googleNativeAd,
//                                 googleBanner: googleBannerAd,
//                                 facebookNative: facebookNativeAd,
//                                 facebookBanner: facebookBannerAd),
//                           );
//                         }
//                       },
//                       buttonText: "Submit",
//                       weight: true),
//                 ],
//               ),
//             ),
//           )
//         ]);
//   }
//
//   getTextField(String? labelText, TextEditingController? controller,
//       TextInputType? keyboardType) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         cursorColor: Colors.grey,
//         controller: controller,
//         keyboardType: keyboardType,
//         textInputAction: TextInputAction.next,
//         validator: (val) {
//           if (val!.isEmpty) {
//             return "Please fill input correctly";
//           } else {
//             null;
//           }
//         },
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color:
//                   Colors.grey, // Change the border color to your desired color
//             ),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color:
//                   Colors.grey, // Change the border color to your desired color
//             ),
//           ),
//           labelText: labelText,
//           labelStyle: const TextStyle(
//             color: Colors.grey,fontSize: 12 // Change the color to your desired color
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _createPDF() async {
//     print(
//         "============>${ListConst.currentUserData.name} ${ListConst.currentUserData.degree}");
//     ListConst.currentUserData.pgCgpaSgpa =
//         pgCollagePerController.text;
//     ListConst.currentUserData.cgpaSgpa =
//         collagePerController.text;
//     ListConst.currentUserData.the10ThPercentage =
//         perOf10Controller.text;
//     ListConst.currentUserData.the12ThPercentage =
//         perOf12Controller.text;
//     log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
//     log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
//     PdfDocument document = PdfDocument();
//     final page = document.pages.add();
//     // Calculate the center position on the page
//     double centerX = page.getClientSize().width / 2;
//
//     final File? imageFile = await pickImage();
//
//     if (imageFile != null) {
//       final PdfBitmap image = PdfBitmap(imageFile.readAsBytesSync());
//
//       // Add the image to the PDF
//       page.graphics.drawImage(
//         image,
//         Rect.fromLTWH(Get.width * 1, Get.height * 0.1, 100,
//             100), // Adjust the position and size as needed
//       );
//     }
//
//     // Create a table
//     final PdfGrid table = PdfGrid();
//     table.columns.add(count: 3); // Specify the number of columns
//
//     // Define the table headers
//     final PdfGridRow header = table.headers.add(1)[0];
//     header.cells[0].value = 'Courses';
//     header.cells[1].value = 'Uni./Board';
//     header.cells[2].value = 'Percentage';
//
// //     // Add rows to the table
// //     final PdfGridRow row4 = table.rows.add();
// //     row4.cells[0].value = "\t${ListConst.currentUserData.pgDegree}";
// //     row4.cells[1].value = "\t${ListConst.currentUserData.pgCollageName}";
// //     row4.cells[2].value = "\t${ListConst.currentUserData.pgCgpaSgpa}";
// //
// //     final PdfGridRow row3 = table.rows.add();
// //     row3.cells[0].value = "\t${ListConst.currentUserData.degree}";
// //     row3.cells[1].value = "\t${ListConst.currentUserData.collageName}";
// //     row3.cells[2].value = "\t${ListConst.currentUserData.cgpaSgpa}";
// //
// //     final PdfGridRow row2 = table.rows.add();
// //     row2.cells[0].value = "\t12th";
// //     row2.cells[1].value = "\t${ListConst.currentUserData.the12ThSchoolName}";
// //     row2.cells[2].value = "\t${ListConst.currentUserData.the12ThPercentage}";
// // //ListConst.currentUserData.the12ThPercentage
// //     final PdfGridRow row1 = table.rows.add();
// //     row1.cells[0].value = "\t10th";
// //     row1.cells[1].value = "\t${ListConst.currentUserData.the10ThSchoolName}";
// //     row1.cells[2].value = "\t${ListConst.currentUserData.the10ThPercentage}";
//
//
//     // Add rows to the table
//     final PdfGridRow row4 = table.rows.add();
//     row4.cells[0].value = "\t${ListConst.pgDegree.value}";
//     row4.cells[1].value = "\t${ListConst.pgUni.value}";
//     row4.cells[2].value = "\t${ListConst.pgDegreeCGPA.value}";
//
//     final PdfGridRow row3 = table.rows.add();
//     row3.cells[0].value = "\t${ListConst.degree.value}";
//     row3.cells[1].value = "\t${ListConst.uni.value}";
//     row3.cells[2].value = "\t${ListConst.degreeCGPA.value}";
//
//     final PdfGridRow row2 = table.rows.add();
//     row2.cells[0].value = "\t12th";
//     row2.cells[1].value = "\t${ListConst.class12School.value}";
//     row2.cells[2].value = "\t${ListConst.class12PG.value}";
// //ListConst.currentUserData.the12ThPercentage
//     final PdfGridRow row1 = table.rows.add();
//     row1.cells[0].value = "\t10th";
//     row1.cells[1].value = "\t${ListConst.class10School.value}";
//     row1.cells[2].value = "\t${ListConst.class10PG.value}";
//
//
//     // Position and draw the table on the page
//
//     table.draw(
//       page: page,
//       bounds: Rect.fromLTWH(5, Get.height * 0.78, Get.width - 10, 200),
//     );
//
//
//
//     page.graphics.drawString(
//         "Resume", PdfStandardFont(PdfFontFamily.helvetica, 50),
//         format: PdfStringFormat(alignment: PdfTextAlignment.center),
//         bounds: Rect.fromLTWH(centerX, 0, 0, 0));
//
//     page.graphics.drawString("${ListConst.currentUserData.name}",
//         // PdfStandardFont(PdfFontFamily.helvetica, 24),
//         PdfStandardFont(PdfFontFamily.helvetica, 22, style: PdfFontStyle.bold),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.24, 0, 0));
//
//
//     page.graphics.drawString("${ListConst.currentUserData.society},",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.28, 0, 0));
//     page.graphics.drawString("${ListConst.currentUserData.areaName},",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.32, 0, 0));
//     page.graphics.drawString(
//         "${ListConst.currentUserData.city} - ${ListConst.currentUserData.pincode}",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.36, 0, 0));
//     page.graphics.drawString("Email: ${ListConst.currentUserData.email}",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(Get.width * 0.7, Get.height * 0.32, 0, 0));
//     page.graphics.drawString("Contact No: ${ListConst.currentUserData.number}",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(Get.width * 0.7, Get.height * 0.36, 0, 0));
//     page.graphics.drawString(
//         "Objective: ", PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.44, 0, 0));
//     page.graphics.drawString("${ListConst.currentUserData.objective},",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.48, 0, 0));
//     // page.graphics.drawString(ListConst.currentUserData.objective!,
//     //     PdfStandardFont(PdfFontFamily.helvetica, 20),
//     //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
//     //     bounds: Rect.fromLTWH(5, Get.height * 0.48, 0, 0));
//     page.graphics.drawString(
//         "Technical Skills:", PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.56, 0, 0));
//     page.graphics.drawString("${ListConst.currentUserData.technicalSkills}",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.60, 0, 0));
//
//
//
//     // page.graphics.drawString(
//     //     "Hobbies:", PdfStandardFont(PdfFontFamily.helvetica, 20),
//     //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
//     //     bounds: Rect.fromLTWH(5, Get.height * 0.68, 0, 0));
//     // page.graphics.drawString("${ListConst.hobbies}",
//     //     PdfStandardFont(PdfFontFamily.helvetica, 20),
//     //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
//     //     bounds: Rect.fromLTWH(5, Get.height * 0.72, 0, 0));
//
//
//     if (ListConst.hobbies.isNotEmpty) {
//       page.graphics.drawString(
//           "Hobbies:", PdfStandardFont(PdfFontFamily.helvetica, 20),
//           format: PdfStringFormat(alignment: PdfTextAlignment.left),
//           bounds: Rect.fromLTWH(5, Get.height * 0.68, 0, 0));
//
//       final String hobbiesText = ListConst.hobbies.join(', ');
//
//       page.graphics.drawString(
//           hobbiesText,
//           PdfStandardFont(PdfFontFamily.helvetica, 20),
//           format: PdfStringFormat(alignment: PdfTextAlignment.left),
//           bounds: Rect.fromLTWH(5, Get.height * 0.72, 0, 0));
//     }
//
//
//
//     page.graphics.drawString(
//         "Experience:", PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.80, 0, 0));
//     page.graphics.drawString("${ListConst.currentUserData.experience}",
//         PdfStandardFont(PdfFontFamily.helvetica, 20),
//         format: PdfStringFormat(alignment: PdfTextAlignment.left),
//         bounds: Rect.fromLTWH(5, Get.height * 0.84, 0, 0));
//
//     List<int> bytes = await document.save();
//     document.dispose();
//     saveAndLaunchFile(bytes, 'Output.pdf');
//   }
//
//   Future<File?> pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       return File(image.path);
//     } else {
//       return null;
//     }
//   }
//
//   void stopLoader() async {
//     if (isAllScreenAppOpenOn == true) {
//       log("Loader =======");
//       await Future.delayed(const Duration(seconds: 3))
//           .then((value) => isOpenLoader.value = true);
//       setState(() {});
//     }
//   }
// }
//


import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../../../../../utils/show.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../constant/color_const.dart';
import '../../../constant/list_const.dart';
import '../../../constant/var_const.dart';
import '../../../custom_widget/custom_button.dart';
import '../../../custom_widget/custom_scaffold.dart';
import '../../../custom_widget/custom_size.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import '../../../models/language_model.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import 'mobile.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  PreloadAd adsManager = Get.arguments;

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();

    super.initState();
  }

  TextEditingController languageController = TextEditingController();
  RxList<LanguageModel> languages1 = <LanguageModel>[
    LanguageModel(language: "Hindi",isSelect: false),
    LanguageModel(language: "English",isSelect: false),
    LanguageModel(language: "Gujarati",isSelect: false),
    LanguageModel(language: "Korean",isSelect: false),
    LanguageModel(language: "Chinese",isSelect: false),
    LanguageModel(language: "Arabic",isSelect: false),
    LanguageModel(language: "Bengali",isSelect: false),
    LanguageModel(language: "Urdu",isSelect: false),
    LanguageModel(language: "Spanish",isSelect: false),
    LanguageModel(language: "French",isSelect: false),
    LanguageModel(language: "Russian",isSelect: false),
    LanguageModel(language: "German",isSelect: false),
    LanguageModel(language: "Greek",isSelect: false),
    LanguageModel(language: "Turkish",isSelect: false),
    LanguageModel(language: "Portuguese",isSelect: false),
  ].obs;
  // RxList<LanguageModel> selectedLanguage = <LanguageModel>[].obs;
  RxList<LanguageModel> selectedLanguage = <LanguageModel>[].obs;
  @override
  Widget build(BuildContext context) {
    return customScaffold(
        context: context,
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        children: [
          getList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
            child: CustomButton(onPressed: () {

              // for(int i =0 ; i< languages1.length ; i++){
              //   if(languages1[i].isSelect!){
              //     selectedLanguage.add(languages1[i]);
              //   }
              // }
              // if(selectedLanguage.isNotEmpty){
              //   for(int i = 0; i < selectedLanguage.length; i++){
              //     ListConst.languages1.add(selectedLanguage[i].language!);
              //   }
              //   log("languages1 ====== ==== ${ListConst.languages1}");
              //   show(Routes.educationScreen,
              //       argument: PreloadAd(
              //           facebookBanner: facebookBannerAd,
              //           facebookNative: facebookNativeAd,
              //           googleBanner: googleBannerAd,
              //           googleNative: googleNativeAd));
              // }else{
              //   Get.snackbar("Warning", "Please select language");
              // }



              for (int i = 0; i < languages1.length; i++) {
                if (languages1[i].isSelect!) {
                  selectedLanguage.add(languages1[i]);
                }
              }
              if (selectedLanguage.isNotEmpty) {
                for (int i = 0; i < selectedLanguage.length; i++) {
                  if (!ListConst.languages1.contains(selectedLanguage[i].language)) {
                    ListConst.languages1.add(selectedLanguage[i].language!);

                  }
                }
                log("languages1 ====== ==== ${ListConst.languages1}");
                show(Routes.educationScreen,
                    argument: PreloadAd(
                        facebookBanner: facebookBannerAd,
                        facebookNative: facebookNativeAd,
                        googleBanner: googleBannerAd,
                        googleNative: googleNativeAd));
              } else {
                Get.snackbar("Warning", "Please provide data correctly.");
              }

            }, buttonText: "Next"),
          ),

        ]);
  }


  Widget getList(){
    return Padding(
      padding: EdgeInsets.all(VarConst.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSize(
            height: 30,
          ),
          const CustomText(
            text: "Languages",
            size: 35,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Select your Languages",
            color: ColorConst.darkWhite,
            size: 16,
          ),
          const CustomSize(
            height: 30,
          ),
          InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: ColorConst.inBoxColor),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextFormField(
                                hintText: "language",
                                icon: Icons.sports_esports_outlined,
                                controller: languageController),
                            const CustomSize(height: 20,),
                            CustomButton(onPressed: (){
                              if(formKey.currentState!.validate()){
                                languages1.add(LanguageModel(isSelect: true,language: languageController.text));
                                Get.back();
                                languageController.clear();
                              }
                            }, buttonText: "Add")
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              },
              child:Chip(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                label: const CustomText(
                  text: "Add new language",
                  size: 16,
                  color: Colors.white,
                ),
                avatar: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                elevation: 10,
                backgroundColor: const Color(0xFF525252),
              )),
          const CustomSize(),
          Obx(
                () => Wrap(
              children: List.generate(
                  languages1.length,
                      (index) => Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: (){
                        languages1[index].isSelect = !languages1[index].isSelect!;
                        languages1.refresh();
                        log("current chip is ${languages1[index].isSelect}");
                      },
                      child: Chip(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: languages1[index].isSelect! ? ColorConst.buttonColor : ColorConst.inBoxColor,
                          avatar: Icon(languages1[index].isSelect! ? Icons.check : Icons.add,size: 20,color: languages1[index].isSelect! ? Colors.white : ColorConst.black,),
                          label: CustomText(
                            text: languages1[index].language!,
                            size: 14,
                            color: languages1[index].isSelect! ? Colors.white : ColorConst.black,
                          )),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
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

