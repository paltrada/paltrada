import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/color_const.dart';
import '../../../../utils/show.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../constant/img_const.dart';
import '../../../custom_widget/custom_scaffold.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }
  PreloadAd adsManager = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return customScaffold(context: context,
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        children: [
          Center(
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),

                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorConst.white
                ),
                child: Column(
                  children: [
                    Image.asset(ImgConst.true1,height: 70,width: 70,),
                    const CustomText(text: "Thanks for submitting!",size: 22,color: ColorConst.black,weight: true),
                    const SizedBox(height: 10,),
                    const CustomText(text: "We appreciate your interest and will be in touch with you soon. Thank you for reaching out.",color:  ColorConst.black),
                    const SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          )
        ]);
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
