import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../../../../../constant/list_const.dart';
import '../../../../../../../utils/show.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../constant/color_const.dart';
import '../../../constant/var_const.dart';
import '../../../custom_widget/custom_button.dart';
import '../../../custom_widget/custom_scaffold.dart';
import '../../../custom_widget/custom_size.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import '../../../models/interest_model.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import 'mobile.dart';

class HobbyScreen extends StatefulWidget {
  const HobbyScreen({super.key});

  @override
  State<HobbyScreen> createState() => _HobbyScreenState();
}

class _HobbyScreenState extends State<HobbyScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController interestController = TextEditingController();
  RxList<InterestModel> interests = <InterestModel>[
    InterestModel(interest: "Art",isSelect: false),
    InterestModel(interest: "Architecture",isSelect: false),
    InterestModel(interest: "Cinema",isSelect: false),
    InterestModel(interest: "Dance",isSelect: false),
    InterestModel(interest: "Illustration",isSelect: false),
    InterestModel(interest: "Fashion",isSelect: false),
    InterestModel(interest: "Graphic Design",isSelect: false),
    InterestModel(interest: "Game",isSelect: false),
    InterestModel(interest: "Travelling",isSelect: false),
    InterestModel(interest: "Photography",isSelect: false),
    InterestModel(interest: "Reading",isSelect: false),
    InterestModel(interest: "Eating",isSelect: false),
    InterestModel(interest: "Driving",isSelect: false),
  ].obs;
  RxList<InterestModel> selectedInterest = <InterestModel>[].obs;

  PreloadAd adsManager = Get.arguments;

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();

    super.initState();
  }

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

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
                onPressed: () {

                  log("Hobbies ====== ==== ${ListConst.hobbies}");
                  for (int i = 0; i < interests.length; i++) {
                    if (interests[i].isSelect!) {
                      selectedInterest.add(interests[i]);
                    }
                  }
                  if (selectedInterest.isNotEmpty) {
                    for (int i = 0; i < selectedInterest.length; i++) {
                      if (!ListConst.hobbies.contains(selectedInterest[i].interest)) {
                        ListConst.hobbies.add(selectedInterest[i].interest!);

                      }
                    }
                    log("Hobbies ====== ==== ${ListConst.hobbies}");
                    _createPDF();
                  } else {
                    Get.snackbar("Warning", "Please provide data correctly.");
                  }

                },
                buttonText: "View Resume",
                weight: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    show(
                      Routes.lastScreen,
                      argument: PreloadAd(
                          googleNative: googleNativeAd,
                          googleBanner: googleBannerAd,
                          facebookNative: facebookNativeAd,
                          facebookBanner: facebookBannerAd),
                    );
                  }
                },
                buttonText: "Submit",
                weight: true),
          )
        ]);
  }


  Future<void> _createPDF() async {
    print(
        "============>${ListConst.currentUserData.name} ${ListConst.currentUserData.degree}");

    log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
    log("new >>>>>>>>>>>>>>>>>>>> ${ListConst.currentUserData.the10ThPercentage}");
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    // Calculate the center position on the page
    double centerX = page.getClientSize().width / 2;

    final File? imageFile = await pickImage();

    if (imageFile != null) {
      final PdfBitmap image = PdfBitmap(imageFile.readAsBytesSync());

      // Add the image to the PDF
      page.graphics.drawImage(
        image,
        Rect.fromLTWH(Get.width * 1, Get.height * 0.1, 100,
            100), // Adjust the position and size as needed
      );
    }

    // Create a table
    final PdfGrid table = PdfGrid();
    table.columns.add(count: 3); // Specify the number of columns

    // Define the table headers
    final PdfGridRow header = table.headers.add(1)[0];
    header.cells[0].value = ' Courses';
    header.cells[1].value = ' Uni./Board';
    header.cells[2].value = ' Percentage';


    // Add rows to the table
    final PdfGridRow row4 = table.rows.add();
    row4.cells[0].value = " ${ListConst.pgDegree.value}";
    row4.cells[1].value = " ${ListConst.pgUni.value}";
    row4.cells[2].value = " ${ListConst.pgDegreeCGPA.value}";

    final PdfGridRow row3 = table.rows.add();
    row3.cells[0].value = " ${ListConst.degree.value}";
    row3.cells[1].value = " ${ListConst.uni.value}";
    row3.cells[2].value = " ${ListConst.degreeCGPA.value}";

    final PdfGridRow row2 = table.rows.add();
    row2.cells[0].value = " 12th";
    row2.cells[1].value = " ${ListConst.class12School.value}";
    row2.cells[2].value = " ${ListConst.class12PG.value}";
//ListConst.currentUserData.the12ThPercentage
    final PdfGridRow row1 = table.rows.add();
    row1.cells[0].value = " 10th";
    row1.cells[1].value = " ${ListConst.class10School.value}";
    row1.cells[2].value = " ${ListConst.class10PG.value}";


    // Position and draw the table on the page

    table.draw(
      page: page,
      bounds: Rect.fromLTWH(5, Get.height * 0.78, Get.width - 10, 200),
    );



    page.graphics.drawString(
        "Resume", PdfStandardFont(PdfFontFamily.helvetica, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
        bounds: Rect.fromLTWH(centerX, 0, 0, 0));

    page.graphics.drawString("${ListConst.currentUserData.name}",
        // PdfStandardFont(PdfFontFamily.helvetica, 24),
        PdfStandardFont(PdfFontFamily.helvetica, 22, style: PdfFontStyle.bold),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.24, 0, 0));


    page.graphics.drawString("${ListConst.currentUserData.society},",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.28, 0, 0));
    page.graphics.drawString("${ListConst.currentUserData.areaName},",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.32, 0, 0));
    page.graphics.drawString(
        "${ListConst.currentUserData.city} - ${ListConst.currentUserData.pincode}",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.36, 0, 0));
    page.graphics.drawString("Email: ${ListConst.currentUserData.email}",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(Get.width * 0.7, Get.height * 0.32, 0, 0));
    page.graphics.drawString("Contact No: ${ListConst.currentUserData.number}",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(Get.width * 0.7, Get.height * 0.36, 0, 0));
    page.graphics.drawString(
        "Objective: ", PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.44, 0, 0));
    page.graphics.drawString("${ListConst.currentUserData.objective},",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.48, 0, 0));
    // page.graphics.drawString(ListConst.currentUserData.objective!,
    //     PdfStandardFont(PdfFontFamily.helvetica, 20),
    //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
    //     bounds: Rect.fromLTWH(5, Get.height * 0.48, 0, 0));
    page.graphics.drawString(
        "Technical Skills:", PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.56, 0, 0));
    page.graphics.drawString("${ListConst.currentUserData.technicalSkills}",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.60, 0, 0));



    // page.graphics.drawString(
    //     "Hobbies:", PdfStandardFont(PdfFontFamily.helvetica, 20),
    //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
    //     bounds: Rect.fromLTWH(5, Get.height * 0.68, 0, 0));
    // page.graphics.drawString("${ListConst.hobbies}",
    //     PdfStandardFont(PdfFontFamily.helvetica, 20),
    //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
    //     bounds: Rect.fromLTWH(5, Get.height * 0.72, 0, 0));


    if (ListConst.hobbies.isNotEmpty) {
      page.graphics.drawString(
          "Hobbies:", PdfStandardFont(PdfFontFamily.helvetica, 20),
          format: PdfStringFormat(alignment: PdfTextAlignment.left),
          bounds: Rect.fromLTWH(5, Get.height * 0.68, 0, 0));

      final String hobbiesText = ListConst.hobbies.join(', ');

      page.graphics.drawString(
          hobbiesText,
          PdfStandardFont(PdfFontFamily.helvetica, 16),
          format: PdfStringFormat(alignment: PdfTextAlignment.left),
          bounds: Rect.fromLTWH(5, Get.height * 0.72, 0, 0));
    }



    page.graphics.drawString(
        "Experience:", PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.80, 0, 0));
    page.graphics.drawString("${ListConst.currentUserData.experience}",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.84, 0, 0));

    if (ListConst.languages1.isNotEmpty) {
      page.graphics.drawString(
          "Languages:", PdfStandardFont(PdfFontFamily.helvetica, 20),
          format: PdfStringFormat(alignment: PdfTextAlignment.left),
          bounds: Rect.fromLTWH(5, Get.height * 0.92, 0, 0));

      final String hobbiesText = ListConst.languages1.join(', ');

      page.graphics.drawString(
          hobbiesText,
          PdfStandardFont(PdfFontFamily.helvetica, 16),
          format: PdfStringFormat(alignment: PdfTextAlignment.left),
          bounds: Rect.fromLTWH(5, Get.height * 0.96, 0, 0));
    }

    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<File?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
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
            text: "Interests",
            size: 35,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Select your hobbies",
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
                                hintText: "interest",
                                icon: Icons.sports_esports_outlined,
                                controller: interestController),
                            const CustomSize(height: 20,),
                            CustomButton(onPressed: (){
                              if(formKey.currentState!.validate()){
                                interests.add(InterestModel(isSelect: true,interest: interestController.text));
                                Get.back();
                                interestController.clear();
                                log("interests.length >>>>> ${interests.length}");
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
                  text: "Add new interest",
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
                  interests.length,
                      (index) => Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: (){
                        interests[index].isSelect = !interests[index].isSelect!;
                        interests.refresh();
                        log("current chip is ${interests[index].isSelect}");
                      },
                      child: Chip(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: interests[index].isSelect! ? ColorConst.buttonColor : ColorConst.inBoxColor,
                          avatar: Icon(interests[index].isSelect! ? Icons.check : Icons.add,size: 20,color: interests[index].isSelect! ? Colors.white : ColorConst.black,),
                          label: CustomText(
                            text: interests[index].interest!,
                            size: 14,
                            color: interests[index].isSelect! ? Colors.white : ColorConst.black,
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



