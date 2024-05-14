import 'dart:developer';
import 'package:get/get.dart';
import '../../advertisement/facebook_ads.dart';
import '../../advertisement/google_ads.dart';
import '../../advertisement/google_native.dart';
import '../../constant/img_const.dart';
import '../../constant/var_const.dart';
import '/models/preload_ad.dart';
import '/constant/color_const.dart';
import '/custom_widget/custom_scaffold.dart';
import '/custom_widget/custom_text.dart';
import '/utils/show.dart';
import 'package:flutter/material.dart';
import '../../advertisement/constant.dart';
import '../../routing/routes.dart';

class StartPageRs26 extends StatefulWidget {
  const StartPageRs26({Key? key}) : super(key: key);

  @override
  State<StartPageRs26> createState() => _StartPageRs26State();
}

class _StartPageRs26State extends State<StartPageRs26> with WidgetsBindingObserver {
  RxBool clicked = false.obs;

  bool isPaused = false;
  @override
  void initState() {
    // stopLoader();

    WidgetsBinding.instance.addObserver(this);
    if (isIntro == false) {
      if (isClicked) {
        MyFacebookAdsManager.loadFacebookInterstitialAd();
        MyGoogleAdsManager.initGoogleLoad();
      }
      facebookNativeAd = facebookNativeAdWidget();
      facebookBannerAd = facebookNativeBannerAdWidget();
      googleNativeAd = const NativeContainer();
      googleBannerAd = const BannerContainer();
      stopLoader();
    } else {
      getPreLoadAds();

      stopLoader();
    }
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
    if(state == AppLifecycleState.paused){
      isPaused = true;
    }
    if(state == AppLifecycleState.resumed && isPaused){
      print("Resumed ====================================");
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
          Padding(
            padding: EdgeInsets.all(VarConst.padding),
            child: const CustomText(
              text: "Your search for\nthe next dream\njob is over",
              size: 34,
              weight: true,
              color: ColorConst.black,
            ),
          ),
          getButton(),
          SizedBox(
              width: double.infinity,
              child: Image.asset(ImgConst.start,fit: BoxFit.cover,)),

        ]);
  }


  Widget getButton(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: GestureDetector(
        onTap: () =>  show(Routes.optionScreen,
            argument: PreloadAd(
                facebookBanner: facebookBannerAd,
                facebookNative: facebookNativeAd,
                googleBanner: googleBannerAd,
                googleNative: googleNativeAd)),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          elevation: 10,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomText(
                text: "Start your Journey",
                size: 18,
                color: Colors.white,
              ),
            ),
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
