import 'dart:developer';

import 'package:get/get.dart';

import '../../advertisement/google_ads.dart';
import '../../constant/color_const.dart';
import '../../custom_widget/custom_size.dart';
import '../../models/preload_ad.dart';
import '/advertisement/constant.dart';
import 'package:flutter/material.dart';

import '../../constant/img_const.dart';
import '../../constant/string_const.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_scaffold.dart';
import '../../custom_widget/custom_text.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class IntroPage2Rs26 extends StatefulWidget {
  const IntroPage2Rs26({Key? key}) : super(key: key);

  @override
  State<IntroPage2Rs26> createState() => _IntroPage2Rs26State();
}

class _IntroPage2Rs26State extends State<IntroPage2Rs26> {
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
        SizedBox(
            height: Get.height * 0.3,
            child: Image.asset(
              ImgConst.introTitle2,
              fit: BoxFit.fill,
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: CustomText(
            text: StringConst.intro2,
            color: ColorConst.grey,
            size: 14,
            align: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(children: [
            buildDivider(),
            buildDivider(isSelect: true),
            buildDivider(),
          ]),
        ),
        const CustomSize(height: 50),
        buildDownButton(),
      ],
    );
  }

  Widget buildDownButton() {
    return SizedBox(
      height: Get.height * 0.3,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgConst.intro2,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      show(Routes.intro3,
                          argument: PreloadAd(
                              facebookBanner: facebookBannerAd,
                              facebookNative: facebookNativeAd,
                              googleBanner: googleBannerAd,
                              googleNative: googleNativeAd));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorConst.buttonColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.1, vertical: 15),
                        child: const CustomText(
                          text: "Next",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildDivider({bool isSelect = false}) {
    return Expanded(
      child: Divider(
        thickness: isSelect ? 1.5 : 1,
        color: isSelect ? const Color(0xFFacafb1) : const Color(0xFFe7e8ea),
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
