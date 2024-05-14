import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/custom_widget/custom_scaffold.dart';
import '/custom_widget/custom_text.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../advertisement/facebook_ads.dart';
import '../../advertisement/google_ads.dart';
import '../../advertisement/google_native.dart';
import '../../constant/color_const.dart';
import '../../models/preload_ad.dart';
import '../../repository/get_ads_data_repository.dart';
import '/advertisement/constant.dart';
import '../../constant/img_const.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class SplashRs26 extends StatefulWidget {
  const SplashRs26({Key? key}) : super(key: key);

  @override
  State<SplashRs26> createState() => _SplashRs26State();
}

class _SplashRs26State extends State<SplashRs26> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    internetChecker();
    super.initState();
  }

  RxBool isInternet = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() => isInternet.value
            ?      Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: ColorConst.white,
                        child: Image.asset(
              ImgConst.splash,
              fit: BoxFit.contain,
                        ),
                      ),
            )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Check Your Internet Connection",
                    color: Colors.black,
                  ),
                  buildSize(height: 25),
                  const CircularProgressIndicator(),
                  buildSize(height: 25),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConst.buttonColor),
                      onPressed: () {
                        internetChecker();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "Retry",
                          color: Colors.white,
                          size: 18,
                          ls: 1.5,
                        ),
                      ))
                ],
              )),
      ),
    );
  }

  void getAppData() async {
    log("bnchjfdijsnvd");
    await GetAdsDataRepository.fetchAdsData();
    googleAppOpenLoadAd();
    await Future.delayed(const Duration(seconds: 4));
    facebookNativeAd = facebookNativeAdWidget();
    facebookBannerAd = facebookNativeBannerAdWidget();
    googleNativeAd = const NativeContainer();
    googleBannerAd = const BannerContainer();
    isComingSoon
        ? showOffAll(Routes.comingSoon,
            argument: PreloadAd(
                googleNative: googleNativeAd,
                googleBanner: googleBannerAd,
                facebookNative: facebookNativeAd,
                facebookBanner: facebookBannerAd))
        : isIntro
            ? showOffAll(Routes.intro1,
                argument: PreloadAd(
                    googleNative: googleNativeAd,
                    googleBanner: googleBannerAd,
                    facebookNative: facebookNativeAd,
                    facebookBanner: facebookBannerAd))
            : showOffAll(Routes.start,
                argument: PreloadAd(
                    googleNative: googleNativeAd,
                    googleBanner: googleBannerAd,
                    facebookNative: facebookNativeAd,
                    facebookBanner: facebookBannerAd));
  }

  Future<void> internetChecker() async {
    isInternet.value = await InternetConnectionChecker().hasConnection;
    if (isInternet.value) {
      getAppData();
    }
  }
}
