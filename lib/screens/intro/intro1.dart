import 'dart:developer';

import 'package:get/get.dart';
import 'package:resumebuilder1/custom_widget/custom_size.dart';
import '../../constant/color_const.dart';
import '/advertisement/constant.dart';
import '/advertisement/facebook_ads.dart';
import '../../advertisement/google_ads.dart';
import '../../advertisement/google_native.dart';
import '../../models/preload_ad.dart';
import '/custom_widget/custom_button.dart';
import '/custom_widget/custom_scaffold.dart';
import '/custom_widget/custom_text.dart';
import '/utils/show.dart';
import 'package:flutter/material.dart';
import '../../constant/img_const.dart';
import '../../constant/string_const.dart';
import '../../routing/routes.dart';

class IntroPage1Rs26 extends StatefulWidget {
  const IntroPage1Rs26({Key? key}) : super(key: key);

  @override
  State<IntroPage1Rs26> createState() => _IntroPage1Rs26State();
}

class _IntroPage1Rs26State extends State<IntroPage1Rs26>
    with WidgetsBindingObserver {
  bool isPaused = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    if (isClicked) {
      MyFacebookAdsManager.loadFacebookInterstitialAd();
      MyGoogleAdsManager.initGoogleLoad();
    }
    facebookNativeAd = facebookNativeAdWidget();
    facebookBannerAd = facebookNativeBannerAdWidget();
    googleNativeAd = const NativeContainer();
    googleBannerAd = const BannerContainer();
    stopLoader();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed && isPaused) {
      log("Resumed ====================================");
      googleAppOpenLoadAd();
      isPaused = false;
    }
  }

  PreloadAd adsManager = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      bannerFacebookAd: adsManager.facebookBanner,
      bannerGoogleAd: adsManager.googleBanner,
      nativeFacebookAd: adsManager.facebookNative,
      nativeGoogleAd: adsManager.googleNative,
      context: context,
      crossAxis: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: Get.height * 0.3,
            child: Image.asset(
              ImgConst.introTitle1,
              fit: BoxFit.fill,
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0,),
          child: CustomText(
            text: StringConst.intro1,
            color: ColorConst.grey,
            size: 14,
            align: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(children: [
            buildDivider(isSelect: true),
            buildDivider(),
            buildDivider(),
          ]),
        ),
        const CustomSize(height: 50),
        buildDownButton()
        // Expanded(child: buildTopImage()),
        // buildDownButton(),
        // SizedBox(height: Get.height * 0.04,)
      ],
    );
    // return Scaffold(
    //   body:  Column(
    //     children: [
    //       Expanded(child: buildTopImage()),
    //       buildDownButton(),
    //       SizedBox(height: Get.height * 0.04,)
    //     ],
    //   ),
    // );
  }

  Widget buildTopImage() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SizedBox(
        height: Get.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: Get.height * 0.3,
                child: Image.asset(
                  ImgConst.introTitle1,
                  fit: BoxFit.fill,
                )),
            const CustomText(
              text: StringConst.intro1,
              color: ColorConst.grey,
              size: 14,
              align: TextAlign.start,
            ),
            Row(children: [
              buildDivider(isSelect: true),
              buildDivider(),
              buildDivider(),
            ])
          ],
        ),
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

  Widget buildDownButton() {
    return SizedBox(
      height: Get.height * 0.3,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              ImgConst.intro1,
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
                      show(Routes.intro2,
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

  void stopLoader() async {
    if (isAllScreenAppOpenOn == true) {
      log("Loader =======");
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => isOpenLoader.value = true);
      setState(() {});
    }
  }
}
