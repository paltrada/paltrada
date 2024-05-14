import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/constant/var_const.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../advertisement/constant.dart';
import '../../advertisement/google_ads.dart';
import '../../constant/color_const.dart';
import '../../constant/img_const.dart';
import '../../custom_widget/custom_text.dart';
import '../../models/preload_ad.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class GetCriteriaScreen extends StatefulWidget {
  const GetCriteriaScreen({super.key});

  @override
  State<GetCriteriaScreen> createState() => _GetCriteriaScreenState();
}

class _GetCriteriaScreenState extends State<GetCriteriaScreen> {
  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  List data = [
    {"title": "Part Time", "Img": ImgConst.job1},
    {"title": "Full Time", "Img": ImgConst.job2}
  ];
  List<String> listOfIncome = [
    "-Select Salary Criteria-",
    'Less than 10,000',
    '10,000 - 20,000',
    '20,000 - 30,000',
    '30,000 - 40,000',
    '40,000 - 50,000',
    'More than 50,000',
  ];
  RxString selectedIncome = "-Select Salary Criteria-".obs;
  RxInt selectedIndex = 5.obs;

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
                const Center(
                  child: CustomText(
                    text: "Hello!",
                    size: 20,
                  ),
                ),
                const CustomText(
                    text:
                        "Believe in yourself, stay persistent, and keep applying. The right job is out there waiting for you, and your determination will lead you to it.",
                    align: TextAlign.start),
                getOptions(),
                getSalary(),
                getButton(),

              ],
            ),
          )
        ]);
  }

  getOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GridView.builder(
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
      },),
    );
  }

  getSalary() {
    return DropdownButtonHideUnderline(
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Obx(
              () => Padding(
            padding: EdgeInsets.only(right: Get.width * 0.03),
            child: DropdownButton(
              isExpanded: true,
              value: selectedIncome.value,
              onChanged: (value) {
                selectedIncome.value = value.toString();
              },
              items: listOfIncome.map((itemOne) {
                return DropdownMenuItem(
                    value: itemOne,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(itemOne),
                    ));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  getButton() {
    return CustomButton(onPressed: () {
      if(selectedIndex < 2 &&  selectedIncome.value != "-Select Salary Criteria-"){
        // show(Routes.typesOfJobs);
        show(Routes.getTypesOfJobs,
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
