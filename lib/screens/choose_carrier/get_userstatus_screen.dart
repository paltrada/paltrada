import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../advertisement/constant.dart';
import '../../advertisement/google_ads.dart';
import '../../constant/color_const.dart';
import '../../constant/img_const.dart';
import '../../constant/var_const.dart';
import '../../custom_widget/custom_size.dart';
import '../../custom_widget/custom_text.dart';
import '../../models/preload_ad.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class GetUserStatusScreen extends StatefulWidget {
  const GetUserStatusScreen({super.key});

  @override
  State<GetUserStatusScreen> createState() => _GetUserStatusScreenState();
}

class _GetUserStatusScreenState extends State<GetUserStatusScreen> {
  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  RxInt selectedIndex = 5.obs;

  List data = [
    {
      "title": "I am a student / have never worked",
      "info": "Eg: Fresh graduates, graduates having no work experience",
      "Img": ImgConst.schoolBag
    },
    {
      "title": "I am working / have worked before",
      "info": "Eg: working or worked in Company, agency, office, business....",
      "Img": ImgConst.bag
    },
  ];

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
          Padding(
            padding: EdgeInsets.all(VarConst.padding),
            child: Column(
              children: [
                CustomText(text: "Hello!",size: 20,),
                const CustomText(text: "Let's start building your profile!"),
                const CustomSize(),
                const CustomText(
                    text: "We will help you find the right job opportunities based on the details you enter here",
                    color: Colors.grey,
                    size: 14),
                getStatus(),
                SizedBox(height: Get.height * 0.03,),
                getButton(),
              ],
            ),
          ),

        ]);
  }

  getStatus() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () {
              selectedIndex.value = index;
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(3)),
                  border: Border.all(color: (selectedIndex.value == index)?ColorConst.buttonColor:Colors.black,width: 1.5),
                  color: (selectedIndex.value == index)?ColorConst.buttonColor:Colors.transparent),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: data[index]["title"],
                              ls: 1,
                              align: TextAlign.start,
                              color: (selectedIndex.value == index)?ColorConst.inBoxColor:Colors.redAccent,
                              weight: true,size: 16),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: data[index]["info"],
                            align: TextAlign.start,
                            size: 12,
                            ls: 0.5,
                            color: (selectedIndex.value == index)?ColorConst.inBoxColor:Colors.grey,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.07, right: Get.width * 0.05),
                    child: Image.asset(data[index]["Img"],
                      height: 35, width: 35,color: (selectedIndex.value == index)?ColorConst.inBoxColor:Colors.black,),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  getButton() {
    return CustomButton(onPressed: () {
      if(selectedIndex.value == 0 || selectedIndex.value == 1){
        // show(Routes.educationScreen);
        show(Routes.getEducationScreen,
            argument: PreloadAd(
                facebookBanner: facebookBannerAd,
                facebookNative: facebookNativeAd,
                googleBanner: googleBannerAd,
                googleNative: googleNativeAd));
      }else{
        Get.snackbar("Warning!!!", "Please select any one");
      }

    }, buttonText: "Next", weight: true);
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
