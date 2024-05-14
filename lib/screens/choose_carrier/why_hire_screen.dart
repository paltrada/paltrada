import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:resumebuilder1/constant/var_const.dart';
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

class WhyHireScreen extends StatefulWidget {
  const WhyHireScreen({super.key});

  @override
  State<WhyHireScreen> createState() => _WhyHireScreenState();
}

class _WhyHireScreenState extends State<WhyHireScreen> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        crossAxis: CrossAxisAlignment.center,
        context: context,
        children: [
          const CustomText(
              text: "Why companies hire from us?", size: 18, weight: true),
          const CustomSize(),
          getData(
              image: ImgConst.info1,
              title: "49 Lack",
              title2: "Accounting/ Auditing",
              views: "1023 Views",
              color: Colors.grey,
              star: "4.0"),
          const CustomSize(),
          getData(
              image: ImgConst.info2,
              title: "2.3 cr",
              title2: "Candidates in T1 Cities",
              views: "1602 Views",
              color: Colors.yellow,
              star: "5.0"),
          const CustomSize(),
          getData(
              image: ImgConst.info3,
              title: "1.3 cr",
              title2: "Graduates",
              views: "1823 Views",
              color: Colors.yellow,
              star: "5.0"),
          const CustomSize(),
          getButton(),


        ]);
  }

  Widget getButton(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: CustomButton(onPressed: () {
        show(Routes.getUserStatusScreen,
            argument: PreloadAd(
                facebookBanner: facebookBannerAd,
                facebookNative: facebookNativeAd,
                googleBanner: googleBannerAd,
                googleNative: googleNativeAd));
      }, buttonText: "Next"),
    );
  }

  Widget getData(
      {required String image,
        required String title,
        required String title2,
        required String views,
        required Color color,
        required String star}) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height * 0.31,
          // color: Colors.grey,
        ),
        Positioned(
          right: 30,
          child: Container(
            height: Get.height * 0.31,
            width: Get.width * 0.48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                color: Colors.blue),
          ),
        ),
        Positioned(
          left: 28,
          top: 16,
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent)),
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.25,
              width: Get.width * 0.40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorConst.inBoxColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    weight: true,
                  ),
                  CustomText(text: title2, align: TextAlign.start),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                      text: views, color: ColorConst.titleText, size: 12),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.star_rate,
                          color: Colors.yellow, size: 16),
                      const Icon(Icons.star_rate,
                          color: Colors.yellow, size: 16),
                      const Icon(Icons.star_rate,
                          color: Colors.yellow, size: 16),
                      const Icon(Icons.star_rate,
                          color: Colors.yellow, size: 16),
                      Icon(Icons.star_rate, color: color, size: 16),
                      const SizedBox(
                        width: 2,
                      ),
                      CustomText(
                          text: star, color: Colors.yellow, weight: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
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
