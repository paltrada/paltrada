import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../advertisement/constant.dart';
import '../../advertisement/google_ads.dart';
import '../../constant/color_const.dart';
import '../../constant/var_const.dart';
import '../../custom_widget/custom_text.dart';
import '../../models/preload_ad.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class GetEducationScreen extends StatefulWidget {
  const GetEducationScreen({super.key});

  @override
  State<GetEducationScreen> createState() => _GetEducationScreenState();
}

class _GetEducationScreenState extends State<GetEducationScreen> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;
  RxInt selectedIndex = 10.obs;

  List qualificationData = [
    {
      "title": "Doctorate",
      "data": ["Ph.D/Doctorate", "MPHIL", "Other"]
    },
    {"title": "Post Graduate"},
    {"title": "Graduate"},
    {"title": "Class XII"},
    {"title": "Class X"},
    {"title": "Below Class X"},
  ];


  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        crossAxis: CrossAxisAlignment.start,
        context: context,
        children: [
          Padding(
            padding: EdgeInsets.all(VarConst.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: "Education details",size: 20,),
                const CustomText(
                    text: "We will help you find the right job opportunities based on the details you enter here",
                    color: Colors.grey,
                    align: TextAlign.start,
                    size: 14),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomText(
                    text: "Highest qualification",
                    color: Colors.grey.shade700,
                    align: TextAlign.start,
                    weight: true,
                    size: 12),
                const SizedBox(height: 10),
                getQualification(),
                const SizedBox(height: 20),
                getButton(),

              ],
            ),
          )

        ]);
  }


  getButton() {
    return CustomButton(
        onPressed: () {
          if (selectedIndex < 6) {
            show(Routes.getCriteriaScreen,
                argument: PreloadAd(
                    facebookBanner: facebookBannerAd,
                    facebookNative: facebookNativeAd,
                    googleBanner: googleBannerAd,
                    googleNative: googleNativeAd));
            // show(Routes.countryScreen);
          } else {
            Get.snackbar("Warning!!!", "Please select any one");
          }
        },
        buttonText: "Next",
        weight: true);
  }

  getQualification() {
    return Obx(() => Wrap(
      spacing: 10,
      runSpacing: 10,
      direction: Axis.horizontal,
      children: List.generate(qualificationData.length, (index) {
        return GestureDetector(
          onTap: () {
            selectedIndex.value = index;
          },
          child: Column(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: (selectedIndex.value == index)
                        ? ColorConst.buttonColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: (selectedIndex.value == index)
                          ? ColorConst.buttonColor
                          : Colors.grey,
                    )),
                child: CustomText(text: qualificationData[index]["title"], color: (selectedIndex.value == index)
                    ? ColorConst.inBoxColor
                    : ColorConst.black,size: 14,),
              ),
            ],
          ),
        );
      }),
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
