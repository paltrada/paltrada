import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../constant/list_const.dart';
import '../../../../../../../utils/show.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../custom_widget/custom_button.dart';
import '../../../custom_widget/custom_scaffold.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import '../../../custom_widget/custom_toast.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';

class FillDataScreen2 extends StatefulWidget {
  const FillDataScreen2({super.key});

  @override
  State<FillDataScreen2> createState() => _FillDataScreen2State();
}

class _FillDataScreen2State extends State<FillDataScreen2> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController objectiveController = TextEditingController();
  TextEditingController technicalController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  PreloadAd adsManager = Get.arguments;

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        context: context,
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const CustomText(text: "Please fill Information",size: 16),
                  const SizedBox(height: 15,),
                  CustomTextFormField(
                      hintText: "Enter Email",
                      icon: Icons.mail,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress),
                  CustomTextFormField(
                      hintText: "Enter Number",
                      icon: Icons.numbers,
                      controller: noController,
                      keyboardType: TextInputType.number),
                  CustomTextFormField(
                      hintText: "Enter Objective",
                      icon: Icons.data_object,
                      controller: objectiveController,
                      keyboardType: TextInputType.text),
                  CustomTextFormField(
                      hintText: "Enter your Technical Skills",
                      icon: Icons.abc,
                      controller: technicalController,
                      keyboardType: TextInputType.text),

                  CustomTextFormField(
                      hintText: "Enter your Experience",
                      icon: Icons.abc,
                      controller: experienceController,
                      keyboardType: TextInputType.text),

                  SizedBox(
                    height: 10,
                  ),
                  // CustomButton(
                  //     onPressed: () {
                  //       if (formKey.currentState!.validate() && emailController.text.contains("gmail.com")) {
                  //         ListConst.currentUserData.email =
                  //             emailController.text;
                  //         ListConst.currentUserData.number = noController.text;
                  //         ListConst.currentUserData.objective =
                  //             objectiveController.text;
                  //         ListConst.currentUserData.technicalSkills =
                  //             technicalController.text;
                  //         // ListConst.currentUserData.hobbies =
                  //         //     hobbiesController.text;
                  //         ListConst.currentUserData.experience =
                  //             experienceController.text;
                  //         show(
                  //           Routes.fillData5,
                  //           argument: PreloadAd(
                  //               googleNative: googleNativeAd,
                  //               googleBanner: googleBannerAd,
                  //               facebookNative: facebookNativeAd,
                  //               facebookBanner: facebookBannerAd),
                  //         );
                  //       }
                  //       else{
                  //         showMessage("Please enter correct email.");
                  //       }
                  //     },
                  //     buttonText: "Next",
                  //     weight: true),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() /*&& emailController.text.contains("gmail.com")*/) {
                          ListConst.currentUserData.email =
                              emailController.text;
                          ListConst.currentUserData.number = noController.text;
                          ListConst.currentUserData.objective =
                              objectiveController.text;
                          ListConst.currentUserData.technicalSkills =
                              technicalController.text;
                          // ListConst.currentUserData.hobbies =
                          //     hobbiesController.text;
                          ListConst.currentUserData.experience =
                              experienceController.text;
                          show(
                            Routes.languageScreen,
                            argument: PreloadAd(
                                googleNative: googleNativeAd,
                                googleBanner: googleBannerAd,
                                facebookNative: facebookNativeAd,
                                facebookBanner: facebookBannerAd),
                          );
                        }
                        else{
                          showMessage("Please enter correct email.");
                        }
                      },
                      buttonText: "Next",
                      weight: true),
                ],
              ),
            ),
          )
        ]);
  }

  getTextField(String? labelText, TextEditingController? controller,
      TextInputType? keyboardType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: Colors.grey,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill input correctly";
          } else {
            null;
          }
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Colors.grey, // Change the border color to your desired color
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Colors.grey, // Change the border color to your desired color
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey,fontSize: 12  // Change the color to your desired color
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
