import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../constant/color_const.dart';
import '../../../constant/list_const.dart';
import '../../../constant/var_const.dart';
import '../../../custom_widget/custom_size.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';

class GetEducation extends StatefulWidget {
  const GetEducation({super.key});

  @override
  State<GetEducation> createState() => _GetEducationState();
}

class _GetEducationState extends State<GetEducation> {
  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  RxList<Education> educations = <Education>[].obs;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController degreeController = TextEditingController();
  TextEditingController universityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        context: context,
        children: [
          getField(),
          getButton(),

        ]);
  }

  Widget getButton(){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: CustomButton(
          onPressed: () {
            if (educations.isNotEmpty) {
              for (int i = 0; i < educations.length; i++) {
                ListConst.educations.add(Education(
                    educations[i].schoolLevel, educations[i].schoolName));
              }
              show(Routes.getExperience,
                  argument: PreloadAd(
                      facebookBanner: facebookBannerAd,
                      facebookNative: facebookNativeAd,
                      googleBanner: googleBannerAd,
                      googleNative: googleNativeAd));
            } else {
              Get.snackbar("Warning", "Please provide data correctly.");
            }

          },
          buttonText: "Save & Continue"),
    );
  }

  Widget getField() {
    return Padding(
      padding: EdgeInsets.all(VarConst.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSize(
            height: 30,
          ),
          const CustomText(
            text: "Education",
            size: 35,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Give your Education details",
            color: ColorConst.darkWhite,
            size: 16,
          ),
          const CustomSize(
            height: 30,
          ),
          Obx(
            () => ListView.separated(
                separatorBuilder: (BuildContext context, index) {
                  return const CustomSize();
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: educations.length,
                itemBuilder: (BuildContext context, index) {
                  return buildEducationBox(educations[index]);
                }),
          ),
          const CustomSize(),
          buildAddButton(),
          const SizedBox(
            height: 10,
          ),
        ],
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

  Widget buildAddButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          onAddEducation();
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
                CustomText(text: "Add Education"),
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

  void onAddEducation() {
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
                    hintText: "Degree",
                    icon: Icons.ad_units,
                    controller: degreeController),
                const CustomSize(),
                const CustomSize(),
                CustomTextFormField(
                    hintText: "University",
                    icon: Icons.account_balance,
                    controller: universityController),
                const CustomSize(
                  height: 30,
                ),
                CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        log("formKey >>> ${formKey.currentState!.validate()}");
                        educations.add(Education(
                            degreeController.text, universityController.text));
                        Get.back();
                      }
                      degreeController.clear();
                      universityController.clear();
                    },
                    buttonText: "Add Education"),
              ],
            ),
          ),
        ),
      ),
    ));
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
