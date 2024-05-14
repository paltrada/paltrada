import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
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
import '../../../custom_widget/custom_toast.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import 'mobile.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController gDegreeController = TextEditingController();
  TextEditingController gCollageController = TextEditingController();
  TextEditingController gCGPAController = TextEditingController();
  TextEditingController pgDegreeController = TextEditingController();
  TextEditingController pgCollageController = TextEditingController();
  TextEditingController pgCGPAController = TextEditingController();
  TextEditingController school12thController = TextEditingController();
  TextEditingController school12thPGController = TextEditingController();
  TextEditingController school10thController = TextEditingController();
  TextEditingController school10thPGController = TextEditingController();
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
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: CustomText(
              text: "Education",
              size: 35,
              weight: true,
              color: ColorConst.titleText,
              align: TextAlign.start,
            ),
          ),
          const CustomSize(),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: CustomText(
              text: "Give your Education details",
              color: ColorConst.darkWhite,
              size: 16,
            ),
          ),
          const CustomSize(),
          getPGDegree1(),
          getPGraduationButton(),
          getDegree(),
          getGraduationButton(),
          getClass12(),
          getClass12thButton(),
          getClass10(),
          getClass10thButton(),
          // CustomButton(
          //     onPressed: () {
          //
          //
          //         show(
          //           Routes.fillData4,
          //           argument: PreloadAd(
          //               googleNative: googleNativeAd,
          //               googleBanner: googleBannerAd,
          //               facebookNative: facebookNativeAd,
          //               facebookBanner: facebookBannerAd),
          //         );
          //
          //     },
          //     buttonText: "Experience",
          //     weight: true),
          CustomSize(),
          getButton(),
          // CustomSize(),
          // getSubmitButton(),


        ]);
  }

  Widget getPGraduationButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: ColorConst.bgColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConst.grey),
                      ),
                      const CustomSize(
                        height: 20,
                      ),
                      CustomTextFormField(
                          hintText: "Post Graduation Degree",
                          icon: Icons.ad_units,
                          controller: pgDegreeController),
                      const CustomSize(),
                      const CustomSize(),
                      CustomTextFormField(
                          hintText: "Post Graduation University",
                          icon: Icons.account_balance,
                          controller: pgCollageController),
                      const CustomSize(),
                      const CustomSize(),
                      CustomTextFormField(
                          hintText: "Post Graduation CGPA",
                          icon: Icons.account_balance,
                          controller: pgCGPAController,
                          keyboardType: TextInputType.number),
                      const CustomSize(
                        height: 30,
                      ),
                      CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ListConst.pgDegree.value =
                                  pgDegreeController.text;
                              ListConst.pgUni.value = pgCollageController.text;
                              ListConst.pgDegreeCGPA.value =
                                  pgCGPAController.text;
                              Get.back();
                            }
                          },
                          buttonText: "Add Education"),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: ColorConst.grey)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: VarConst.padding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Add Post Graduation"),
                Icon(
                  Icons.add,
                  color: ColorConst.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDegree() {
    return Obx(
      () => (ListConst.degree.value.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: ColorConst.shadowColor,
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  tileColor: ColorConst.inBoxColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: CustomText(
                    text: "Degree : ${ListConst.degree.value}",
                    size: 14,
                    color: ColorConst.darkWhite,
                    align: TextAlign.start,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "University : ${ListConst.uni.value}",
                          size: 14,
                          color: ColorConst.darkWhite,
                          align: TextAlign.start),
                      CustomText(
                          text: "CGPA : ${ListConst.degreeCGPA.value}",
                          size: 14,
                          color: ColorConst.darkWhite,
                          align: TextAlign.start),
                    ],
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }

  Widget getPGDegree1() {
    return Obx(
      () => (ListConst.pgDegree.value.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: ColorConst.shadowColor,
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  tileColor: ColorConst.inBoxColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: CustomText(
                    text: "PG Degree : ${ListConst.pgDegree.value}",
                    size: 14,
                    color: ColorConst.darkWhite,
                    align: TextAlign.start,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "PG University : ${ListConst.pgUni.value}",
                          size: 14,
                          color: ColorConst.darkWhite,
                          align: TextAlign.start),
                      CustomText(
                          text: "PG CGPA : ${ListConst.pgDegreeCGPA.value}",
                          size: 14,
                          color: ColorConst.darkWhite,
                          align: TextAlign.start),
                    ],
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }

  Widget getClass12() {
    return Obx(
      () => (ListConst.class12PG.value.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: ColorConst.shadowColor,
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  tileColor: ColorConst.inBoxColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: CustomText(
                    text: "12th School Name: ${ListConst.class12School.value}",
                    size: 14,
                    color: ColorConst.darkWhite,
                    align: TextAlign.start,
                  ),
                  subtitle: CustomText(
                      text: "12th School PG: ${ListConst.class12PG.value}",
                      size: 14,
                      color: ColorConst.darkWhite,
                      align: TextAlign.start),
                ),
              ),
            )
          : SizedBox(),
    );
  }

  Widget getClass12thButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: ColorConst.bgColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConst.grey),
                      ),
                      const CustomSize(
                        height: 20,
                      ),
                      CustomTextFormField(
                          hintText: "School Name",
                          icon: Icons.ad_units,
                          controller: school12thController),
                      const CustomSize(),
                      const CustomSize(),
                      CustomTextFormField(
                          hintText: "12th Percentage",
                          icon: Icons.account_balance,
                          controller: school12thPGController,
                          keyboardType: TextInputType.number),
                      const CustomSize(
                        height: 30,
                      ),
                      CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ListConst.class12School.value =
                                  school12thController.text;
                              ListConst.class12PG.value =
                                  school12thPGController.text;
                              Get.back();
                            }
                          },
                          buttonText: "Add Education"),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: ColorConst.grey)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: VarConst.padding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Add Class 12th"),
                Icon(
                  Icons.add,
                  color: ColorConst.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getClass10() {
    return Obx(
      () => (ListConst.class10PG.value.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: ColorConst.shadowColor,
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  tileColor: ColorConst.inBoxColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: CustomText(
                    text: "10th School Name: ${ListConst.class10School.value}",
                    size: 14,
                    color: ColorConst.darkWhite,
                    align: TextAlign.start,
                  ),
                  subtitle: CustomText(
                      text: "10th School PG: ${ListConst.class10PG.value}",
                      size: 14,
                      color: ColorConst.darkWhite,
                      align: TextAlign.start),
                ),
              ),
            )
          : SizedBox(),
    );
  }

  Widget getClass10thButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: ColorConst.bgColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConst.grey),
                      ),
                      const CustomSize(
                        height: 20,
                      ),
                      CustomTextFormField(
                          hintText: "School Name",
                          icon: Icons.ad_units,
                          controller: school10thController),
                      const CustomSize(),
                      const CustomSize(),
                      CustomTextFormField(
                          hintText: "10th Percentage",
                          icon: Icons.account_balance,
                          controller: school10thPGController,
                          keyboardType: TextInputType.number),
                      const CustomSize(
                        height: 30,
                      ),
                      CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ListConst.class10School.value =
                                  school10thController.text;
                              ListConst.class10PG.value =
                                  school10thPGController.text;
                              Get.back();
                            }
                          },
                          buttonText: "Add Education"),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: ColorConst.grey)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: VarConst.padding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Add Class 10th"),
                Icon(
                  Icons.add,
                  color: ColorConst.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getGraduationButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: ColorConst.bgColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: Get.width / 3.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConst.grey),
                      ),
                      const CustomSize(
                        height: 20,
                      ),
                      CustomTextFormField(
                          hintText: "Graduation Degree",
                          icon: Icons.ad_units,
                          controller: gDegreeController),
                      const CustomSize(),
                      const CustomSize(),
                      CustomTextFormField(
                          hintText: "Graduation University",
                          icon: Icons.account_balance,
                          controller: gCollageController),
                      const CustomSize(),
                      const CustomSize(),
                      CustomTextFormField(
                          hintText: "Graduation CGPA",
                          icon: Icons.account_balance,
                          controller: gCGPAController,
                          keyboardType: TextInputType.number),
                      const CustomSize(
                        height: 30,
                      ),
                      CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ListConst.degree.value = gDegreeController.text;
                              ListConst.uni.value = gCollageController.text;
                              ListConst.degreeCGPA.value = gCGPAController.text;
                              Get.back();
                            }
                          },
                          buttonText: "Add Education"),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: ColorConst.grey)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: VarConst.padding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Add Graduation"),
                Icon(
                  Icons.add,
                  color: ColorConst.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEducationBox(Education education) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: ColorConst.shadowColor, blurRadius: 5, spreadRadius: 2)
      ], color: ColorConst.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        tileColor: ColorConst.inBoxColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: CustomText(
          text: "Degree : ${education.schoolLevel}",
          size: 14,
          color: ColorConst.darkWhite,
          align: TextAlign.start,
        ),
        subtitle: CustomText(
            text: "University : ${education.schoolName}",
            size: 14,
            color: ColorConst.darkWhite,
            align: TextAlign.start),
      ),
    );
  }

  Widget getButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: CustomButton(
          onPressed: () {
            if (ListConst.degree.isNotEmpty &&
                ListConst.uni.isNotEmpty &&
                ListConst.degreeCGPA.isNotEmpty &&
                ListConst.pgDegree.isNotEmpty &&
                ListConst.pgUni.isNotEmpty &&
                ListConst.pgDegreeCGPA.isNotEmpty &&
                ListConst.class12PG.isNotEmpty &&
                ListConst.class12School.isNotEmpty &&
                ListConst.class10PG.isNotEmpty &&
                ListConst.class10School.isNotEmpty) {
              // show(
              //   Routes.lastScreen,
              //   argument: PreloadAd(
              //       googleNative: googleNativeAd,
              //       googleBanner: googleBannerAd,
              //       facebookNative: facebookNativeAd,
              //       facebookBanner: facebookBannerAd),
              // );
              // _createPDF();
              show(
                Routes.hobbyScreen,
                argument: PreloadAd(
                    googleNative: googleNativeAd,
                    googleBanner: googleBannerAd,
                    facebookNative: facebookNativeAd,
                    facebookBanner: facebookBannerAd),
              );
            } else {
              Get.snackbar("Warning", "Please provide data correctly.");
            }
          },
          buttonText: "Next"),
    );
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
    header.cells[0].value = 'Courses';
    header.cells[1].value = 'Uni./Board';
    header.cells[2].value = 'Percentage';

    // Add rows to the table
    final PdfGridRow row4 = table.rows.add();
    row4.cells[0].value = "\t${ListConst.pgDegree.value}";
    row4.cells[1].value = "\t${ListConst.pgUni.value}";
    log("ListConst.pgUni.value <<<< <<<< ${ListConst.pgUni.value}");
    row4.cells[2].value = "\t${ListConst.pgDegreeCGPA.value}";
    log("ListConst.pgDegreeCGPA.value <<<< <<<< ${ListConst.pgDegreeCGPA.value}");

    final PdfGridRow row3 = table.rows.add();
    row3.cells[0].value = "\t${ListConst.degree.value}";
    row3.cells[1].value = "\t${ListConst.uni.value}";
    row3.cells[2].value = "\t${ListConst.degreeCGPA.value}";

    final PdfGridRow row2 = table.rows.add();
    row2.cells[0].value = "\t12th";
    row2.cells[1].value = "\t${ListConst.class12School.value}";
    row2.cells[2].value = "\t${ListConst.class12PG.value}";
//ListConst.currentUserData.the12ThPercentage
    final PdfGridRow row1 = table.rows.add();
    row1.cells[0].value = "\t10th";
    row1.cells[1].value = "\t${ListConst.class10School.value}";
    row1.cells[2].value = "\t${ListConst.class10PG.value}";

    // Position and draw the table on the page

    table.draw(
      page: page,
      bounds: Rect.fromLTWH(5, Get.height * 0.78, Get.width - 10, 200),
    );

    page.graphics.drawString(
        "Resume", PdfStandardFont(PdfFontFamily.helvetica, 50),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
        bounds: Rect.fromLTWH(centerX, 0, 0, 0));

    page.graphics.drawString(
        "${ListConst.currentUserData.name}",
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
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.48, 0, 0));

    page.graphics.drawString(
        "Technical Skills:", PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.56, 0, 0));
    page.graphics.drawString("${ListConst.currentUserData.technicalSkills}",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.60, 0, 0));

    if (ListConst.hobbies.isNotEmpty) {
      page.graphics.drawString(
          "Hobbies:", PdfStandardFont(PdfFontFamily.helvetica, 20),
          format: PdfStringFormat(alignment: PdfTextAlignment.left),
          bounds: Rect.fromLTWH(5, Get.height * 0.68, 0, 0));

      final String hobbiesText = ListConst.hobbies.join(', ');

      page.graphics.drawString(
          hobbiesText, PdfStandardFont(PdfFontFamily.helvetica, 20),
          format: PdfStringFormat(alignment: PdfTextAlignment.left),
          bounds: Rect.fromLTWH(5, Get.height * 0.72, 0, 0));
    }

    page.graphics.drawString(
        "Experience:", PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left),
        bounds: Rect.fromLTWH(5, Get.height * 0.80, 0, 0));
    // page.graphics.drawString("${ListConst.currentUserData.experience}",
    //     PdfStandardFont(PdfFontFamily.helvetica, 20),
    //     format: PdfStringFormat(alignment: PdfTextAlignment.left),
    //     bounds: Rect.fromLTWH(5, Get.height * 0.84, 0, 0));
    page.graphics.drawString("${ListConst.experiences}",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
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
          PdfStandardFont(PdfFontFamily.helvetica, 20),
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

  Widget getSubmitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: CustomButton(
          onPressed: () {
            if (ListConst.degree.isNotEmpty &&
                ListConst.uni.isNotEmpty &&
                ListConst.degreeCGPA.isNotEmpty &&
                ListConst.pgDegree.isNotEmpty &&
                ListConst.pgUni.isNotEmpty &&
                ListConst.pgDegreeCGPA.isNotEmpty &&
                ListConst.class12PG.isNotEmpty &&
                ListConst.class12School.isNotEmpty &&
                ListConst.class10PG.isNotEmpty &&
                ListConst.class10School.isNotEmpty) {
              show(
                Routes.lastScreen,
                argument: PreloadAd(
                    googleNative: googleNativeAd,
                    googleBanner: googleBannerAd,
                    facebookNative: facebookNativeAd,
                    facebookBanner: facebookBannerAd),
              );
            } else {
              Get.snackbar("Warning", "Please provide data correctly.");
            }
          },
          buttonText: "Submit"),
    );
  }

  getTextField(String? labelText, TextEditingController? controller,
      TextInputType? keyboardType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: Colors.grey,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill input correctly";
          } else {
            null;
          }
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Colors.grey, // Change the border color to your desired color
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Colors.grey, // Change the border color to your desired color
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12 // Change the color to your desired color
              ),
        ),
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
