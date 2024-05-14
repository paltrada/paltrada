import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/constant/var_const.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';
import 'package:resumebuilder1/custom_widget/custom_size.dart';

import '../../advertisement/constant.dart';
import '../../advertisement/google_ads.dart';
import '../../constant/color_const.dart';
import '../../constant/img_const.dart';
import '../../custom_widget/custom_text.dart';
import '../../models/preload_ad.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class UploadOrCreateScreen extends StatefulWidget {
  const UploadOrCreateScreen({super.key});

  @override
  State<UploadOrCreateScreen> createState() => _UploadOrCreateScreenState();
}

class _UploadOrCreateScreenState extends State<UploadOrCreateScreen> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  List data = [
    {"title": "Upload Resume", "Img": ImgConst.uploadResume},
    {"title": "Create Resume", "Img": ImgConst.createResume}
  ];

  RxInt selectedIndex = 5.obs;

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        context: context,
        children: [

          Padding(
            padding: EdgeInsets.all(VarConst.padding),
            child: Column(
              children: [
                const CustomText(text: "Take the next step in your career journey – create or upload your resume now and open doors to exciting opportunities!",align: TextAlign.start),
                const CustomSize(height: 20),
                getOptions(),
                const CustomSize(height: 20),
                // uploadResumeButton(),
                // createResumeButton(),
                CustomButton(onPressed: () {

                  if(selectedIndex < 2 ){
                    // show(Routes.typesOfJobs);
                    (selectedIndex.value == 0)?  show(Routes.uploadResume,
                        argument: PreloadAd(
                            googleNative: googleNativeAd,
                            googleBanner: googleBannerAd,
                            facebookNative: facebookNativeAd,
                            facebookBanner: facebookBannerAd)):show(Routes.fillData1,
                        argument: PreloadAd(
                            googleNative: googleNativeAd,
                            googleBanner: googleBannerAd,
                            facebookNative: facebookNativeAd,
                            facebookBanner: facebookBannerAd));
                  }else{
                    Get.snackbar("Warning!!!", "Please select any one");
                  }

                }, buttonText: "Next"),
              ],
            ),
          )

        ]);
  }

  getOptions() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 1.2
      ), itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          selectedIndex.value = index;
        },
        child: Obx(() => Container(
          alignment: Alignment.center,

          decoration: BoxDecoration(
              color: (selectedIndex.value == index)?ColorConst.buttonColor:Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: (selectedIndex.value == index)?ColorConst.buttonColor:Colors.grey)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(data[index]["Img"],height: 60,width: 60),
              CustomText(text: data[index]["title"],color: (selectedIndex.value == index)?ColorConst.inBoxColor:ColorConst.buttonColor,),
            ],
          ),
        ),),
      );
    },);
  }

  void stopLoader() async {
    if (isAllScreenAppOpenOn == true) {
      log("Loader =======");
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => isOpenLoader.value = true);
      setState(() {});
    }
  }

  createResumeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: CustomButton(
          onPressed: () {
            show(Routes.fillData1,
                argument: PreloadAd(
                    googleNative: googleNativeAd,
                    googleBanner: googleBannerAd,
                    facebookNative: facebookNativeAd,
                    facebookBanner: facebookBannerAd));
          },
          buttonText: "Create Resume",
          weight: true),
    );
  }

  uploadResumeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: CustomButton(
          onPressed: () {
            show(Routes.uploadResume,
                argument: PreloadAd(
                    googleNative: googleNativeAd,
                    googleBanner: googleBannerAd,
                    facebookNative: facebookNativeAd,
                    facebookBanner: facebookBannerAd));
          },
          buttonText: "Upload Resume",
          weight: true),
    );
  }

}
