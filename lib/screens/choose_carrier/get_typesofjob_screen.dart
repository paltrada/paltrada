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
import '../../constant/string_const.dart';
import '../../custom_widget/custom_text.dart';
import '../../models/preload_ad.dart';
import '../../routing/routes.dart';
import '../../utils/show.dart';

class GetTypeOfJobScreen extends StatefulWidget {
  const GetTypeOfJobScreen({super.key});

  @override
  State<GetTypeOfJobScreen> createState() => _GetTypeOfJobScreenState();
}

class _GetTypeOfJobScreenState extends State<GetTypeOfJobScreen> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  RxBool t1 = false.obs;
  RxBool t2 = false.obs;
  List typeOfJobs = [
    {"Img":ImgConst.teLeCalling,"title":"Telecalling","t1":"Telecalling","in1": StringConst.i11,"t2":"Counsellor","in2": StringConst.i12},
    {"Img":ImgConst.backOffice,"title":"Back Office/ Admin","t1":"Back Office","in1": StringConst.i21,"t2":"Human Resource","in2": StringConst.i22},
    {"Img":ImgConst.recepTiOnIst,"title":"Receptionist","t1":"Receptionist","in1": StringConst.i31,"t2":"Receptionist","in2": StringConst.i32},
    {"Img":ImgConst.sales,"title":"Sales and Marketing","t1":"Qualifications","in1": StringConst.i41,"t2":"Responsibilities","in2": StringConst.i42},
    {"Img":ImgConst.teacher,"title":"Teacher/ Trainer","t1":"Counsellor","in1": StringConst.i51,"t2":"Teacher","in2": StringConst.i52},
    {"Img":ImgConst.account,"title":"Account","t1":"Responsibilities:","in1": StringConst.i61,"t2":"Accounts","in2": StringConst.i62},
    {"Img":ImgConst.officeBoy,"title":"Office Boy","t1":"Office Boy/ Peon","in1": StringConst.i71,"t2":"Typist","in2": StringConst.i72},
    {"Img":ImgConst.media,"title":"Media and Design","t1":"Qualifications","in1": StringConst.i81,"t2":"Responsibilities","in2": StringConst.i81},
    {"Img":ImgConst.hotel,"title":"Hotel","t1":"Cook","in1": StringConst.i91,"t2":"","in2": StringConst.i92},
    {"Img":ImgConst.computers,"title":"Computers","t1":"Software/ Web Developer","in1": StringConst.i101,"t2":"Network Engineer","in2": StringConst.i102},
    {"Img":ImgConst.houseHelp,"title":"House Help","t1":"Housekeeping","in1": StringConst.i111,"t2":"Cook","in2": StringConst.i112},
    {"Img":ImgConst.medical,"title":"Medical","t1":"Medical (Doctor/ Dentist/ Physician)","in1": StringConst.i121,"t2":"Nurse/ Caretaker","in2": StringConst.i122},
    {"Img":ImgConst.security,"title":"Security/ Labour","t1":"Ward Boy","in1": StringConst.i131,"t2":"Security Guard","in2": StringConst.i132},
    {"Img":ImgConst.delivery,"title":"Delivery/ Driver","t1":"Delivery","in1": StringConst.i141,"t2":"Driver","in2": StringConst.i142},
    {"Img":ImgConst.beautician,"title":"Beautician","t1":"Beautician","in1": StringConst.i151,"t2":"Spa","in2": StringConst.i152},
    {"Img":ImgConst.tailor,"title":"Tailor/ Fashion","t1":"Fashion Designer","in1": StringConst.i161,"t2":"Tailor","in2": StringConst.i162},
    {"Img":ImgConst.manufacturing,"title":"Manufacturing/ ITI","t1":"Machine Operator","in1": StringConst.i171,"t2":"Technician","in2": StringConst.i172},
    {"Img":ImgConst.legal,"title":"Legal","t1":"Ligal","in1": StringConst.i181,"t2":"Responsibilities","in2": StringConst.i182},
    {"Img":ImgConst.photography,"title":"Photography","t1":"Photographer","in1": StringConst.i191,"t2":"Responsibilities","in2": StringConst.i192},
    {"Img":ImgConst.other,"title":"Other","t1":"Telecalling","in1": StringConst.i201,"t2":"Receptionist","in2": StringConst.i202},

  ];

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
                const Center(
                    child: CustomText(text: "Hello!",size: 20,)),
                const CustomText(text: "What types of job are you looking for?",align: TextAlign.start,weight: true,color: ColorConst.titleText,ls: 0.5),
                getTypesOfJob(),

              ],
            ),
          )

        ]);
  }

  getTypesOfJob() {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: typeOfJobs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15,childAspectRatio: 1,),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // selectedIndex.value = index;
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 15),
                        child: CustomText(text: typeOfJobs[index]["title"],weight: true,size: 22,color: ColorConst.titleText),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0,left: 15),
                        child: CustomText(text: "What Job Roles are you interested in",color: ColorConst.titleText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18,bottom: 5,left: 15),
                        child: CustomText(text: typeOfJobs[index]["t1"],size: 20,color: ColorConst.titleText,align: TextAlign.start),
                      ),
                      // CustomText(text: language[index]["in1"],size: 14,color: ColorConst.titleText,align: TextAlign.start),
                      Obx(
                            () => CheckboxListTile(
                              activeColor: ColorConst.buttonColor,
                          title: CustomText(text: typeOfJobs[index]["in1"],size: 14,color: ColorConst.titleText,align: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 3),
                          value: t1.value,
                          onChanged: (value) {
                            t1.value = value!;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 18,bottom: 5,left: 15),
                        child: CustomText(text: typeOfJobs[index]["t2"],size: 20,color: ColorConst.titleText,align: TextAlign.start),
                      ),
                      // CustomText(text: language[index]["in2"],size: 14,color: ColorConst.titleText,align: TextAlign.start),
                      Obx(
                            () => CheckboxListTile(
                              activeColor: ColorConst.buttonColor,
                          title: CustomText(text: typeOfJobs[index]["in2"],size: 14,color: ColorConst.titleText,align: TextAlign.start,maxLines: 3,overflow: TextOverflow.ellipsis),
                          value: t2.value,
                          onChanged: (value) {
                            t2.value = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //minimumSize: const Size.fromHeight(50),
                            // elevation: 10,
                              elevation: 1,
                              shadowColor: Colors.grey,
                              backgroundColor: ColorConst.buttonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const CustomText(text: "Next",color: ColorConst.inBoxColor,weight: true),
                          onPressed: () {
                            if(t1.value == true || t2.value == true){
                              // show(Routes.getPersonalDetail);
                              show(Routes.uploadOrCreateScreen,
                                  argument: PreloadAd(
                                      facebookBanner: facebookBannerAd,
                                      facebookNative: facebookNativeAd,
                                      googleBanner: googleBannerAd,
                                      googleNative: googleNativeAd));
                            }else{
                              Get.snackbar("Warning!!!", "Please select any one");
                            }

                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: /*( selectedIndex.value == index)?ColorConst.buttonColor : ColorConst.whiteColor,*/ColorConst.inBoxColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(blurRadius: 3, spreadRadius: 2,color: Colors.grey.shade300)]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(typeOfJobs[index]["Img"],fit: BoxFit.cover,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomText(text: typeOfJobs[index]["title"],color: /*( selectedIndex.value == index)?ColorConst.whiteColor:ColorConst.titleText,*/ColorConst.titleText,size: 12,weight: true),
                  ),
                ],
              ),
            ),
          );
        },
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
