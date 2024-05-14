import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/custom_widget/custom_button.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../constant/color_const.dart';
import '../../../constant/list_const.dart';
import '../../../constant/var_const.dart';
import '../../../custom_widget/custom_size.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import '../../../models/interest_model.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';


class GetHobbies extends StatefulWidget {
  const GetHobbies({super.key});

  @override
  State<GetHobbies> createState() => _GetHobbiesState();
}

class _GetHobbiesState extends State<GetHobbies> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController interestController = TextEditingController();
  RxList<InterestModel> interests = <InterestModel>[
    InterestModel(interest: "Art",isSelect: false),
    InterestModel(interest: "Architecture",isSelect: false),
    InterestModel(interest: "Cinema",isSelect: false),
    InterestModel(interest: "Dance",isSelect: false),
    InterestModel(interest: "Illustration",isSelect: false),
    InterestModel(interest: "Fashion",isSelect: false),
    InterestModel(interest: "Graphic Design",isSelect: false),
    InterestModel(interest: "Game",isSelect: false),
    InterestModel(interest: "Travelling",isSelect: false),
    InterestModel(interest: "Photography",isSelect: false),
    InterestModel(interest: "Reading",isSelect: false),
    InterestModel(interest: "Eating",isSelect: false),
    InterestModel(interest: "Driving",isSelect: false),
  ].obs;
  RxList<InterestModel> selectedInterest = <InterestModel>[].obs;


  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        context: context,
        children: [
          getList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
            child: CustomButton(onPressed: () {


              log("Hobbies ====== ==== ${ListConst.hobbies}");

              for(int i =0 ; i< interests.length ; i++){
                if(interests[i].isSelect!){
                  selectedInterest.add(interests[i]);
                }
              }
              if (selectedInterest.isNotEmpty) {
                for (int i = 0; i < selectedInterest.length; i++) {
                  if (!ListConst.hobbies.contains(selectedInterest[i].interest)) {
                    ListConst.hobbies.add(selectedInterest[i].interest!);

                  }
                }
                log("Hobbies ====== ==== ${ListConst.hobbies}");
                show(Routes.getResumeType,
                    argument: PreloadAd(
                        facebookBanner: facebookBannerAd,
                        facebookNative: facebookNativeAd,
                        googleBanner: googleBannerAd,
                        googleNative: googleNativeAd));
              } else {
                Get.snackbar("Warning", "Please provide data correctly.");
              }


            }, buttonText: "Save & Continue"),
          )

        ]);
  }

  Widget getList(){
    return Padding(
      padding: EdgeInsets.all(VarConst.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSize(
            height: 30,
          ),
          const CustomText(
            text: "Interests",
            size: 35,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Select your hobbies",
            color: ColorConst.darkWhite,
            size: 16,
          ),
          const CustomSize(
            height: 30,
          ),
          InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: ColorConst.inBoxColor),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextFormField(
                                hintText: "interest",
                                icon: Icons.sports_esports_outlined,
                                controller: interestController),
                            const CustomSize(height: 20,),
                            CustomButton(onPressed: (){
                              if(formKey.currentState!.validate()){
                                interests.add(InterestModel(isSelect: true,interest: interestController.text));
                                Get.back();
                                interestController.clear();
                              }
                            }, buttonText: "Add")
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              },
              child:Chip(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                label: const CustomText(
                  text: "Add new interest",
                  size: 16,
                  color: Colors.white,
                ),
                avatar: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                elevation: 10,
                backgroundColor: const Color(0xFF525252),
              )),
          const CustomSize(),
          Obx(
                () => Wrap(
              children: List.generate(
                  interests.length,
                      (index) => Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: (){
                        interests[index].isSelect = !interests[index].isSelect!;
                        interests.refresh();
                        log("current chip is ${interests[index].isSelect}");
                      },
                      child: Chip(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: interests[index].isSelect! ? ColorConst.buttonColor : ColorConst.inBoxColor,
                          avatar: Icon(interests[index].isSelect! ? Icons.check : Icons.add,size: 20,color: interests[index].isSelect! ? Colors.white : ColorConst.black,),
                          label: CustomText(
                            text: interests[index].interest!,
                            size: 14,
                            color: interests[index].isSelect! ? Colors.white : ColorConst.black,
                          )),
                    ),
                  )),
            ),
          ),
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
