import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../advertisement/constant.dart';
import '../../advertisement/google_ads.dart';
import '../../constant/color_const.dart';
import '../../constant/img_const.dart';
import '../../custom_widget/custom_size.dart';
import '../../custom_widget/custom_text.dart';
import '../../models/preload_ad.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  RxBool isAnimate = false.obs;

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        context: context,
        children: [
          Stack(
            children: [

              backGroundColor(),
              buildMainDesign(),
            ],
          ),
        ]);
  }

  Widget backGroundColor() {
    return Row(
      children: [
        Container(
          height: Get.height * 0.5,
          color: ColorConst.inBoxColor,
        ),
        Container(
          height: Get.height * 0.5,
          color: ColorConst.black,
        ),
      ],
    );
  }

  Widget buildMainDesign() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: ColorConst.inBoxColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(70))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: Get.height * 0.35,
                    child: Image.asset(
                      ImgConst.option1,
                      fit: BoxFit.fill,
                    )),

                buildCreateButton(),
                const CustomSize(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: ColorConst.black,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomSize(
                  height: 20,
                ),

                buildCarrierButton(),
                SizedBox(
                    height: Get.height * 0.35,
                    child: Image.asset(
                      ImgConst.option2,
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildCarrierButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              show(Routes.whyHireScreen,
                  argument: PreloadAd(
                      facebookBanner: facebookBannerAd,
                      facebookNative: facebookNativeAd,
                      googleBanner: googleBannerAd,
                      googleNative: googleNativeAd));
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(100)),
                color: ColorConst.inBoxColor,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: CustomText(
                  text: "Choose Carrier",
                  color: ColorConst.black,
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(
                milliseconds: 500,

              ),
              height: 1,
              width: isAnimate.value ? Get.width * 0.35 : 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCreateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Obx(
            () => AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(
                milliseconds: 500,
              ),
              height: 1,
              width: isAnimate.value ? Get.width * 0.35 : 0,
            ),
          ),
          GestureDetector(
            onTap: () {
              show(Routes.getPersonalDetail,
                  argument: PreloadAd(
                      facebookBanner: facebookBannerAd,
                      facebookNative: facebookNativeAd,
                      googleBanner: googleBannerAd,
                      googleNative: googleNativeAd));
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                color: ColorConst.black,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: CustomText(
                  text: "Create Resume",
                  color: ColorConst.inBoxColor,
                ),
              ),
            ),
          )
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
