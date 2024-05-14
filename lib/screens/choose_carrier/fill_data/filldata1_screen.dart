import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../constant/list_const.dart';
import '../../../../../../../constant/string_const.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../custom_widget/custom_button.dart';
import '../../../custom_widget/custom_scaffold.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_text_form_field.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';

class FillDataScreen1 extends StatefulWidget {
  const FillDataScreen1({super.key});

  @override
  State<FillDataScreen1> createState() => _FillDataScreen1State();
}

class _FillDataScreen1State extends State<FillDataScreen1> {
  PreloadAd adsManager = Get.arguments;

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinController = TextEditingController();

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
                  Padding(
                    padding: EdgeInsets.only(
                        right: Get.width * 0.06,
                        left: Get.width * 0.06,
                        bottom: Get.width * 0.05),
                    child: const CustomText(
                        text: StringConst.createResume,
                        align: TextAlign.center),
                  ),
                  CustomTextFormField(
                      hintText: "Full Name",
                      icon: Icons.person,
                      controller: nameController,
                  keyboardType: TextInputType.name),
                  CustomTextFormField(
                      hintText: "Society Name",
                      icon: Icons.location_city,
                      controller: societyController,
                      keyboardType: TextInputType.text),
                  CustomTextFormField(
                      hintText: "Area Name",
                      icon: Icons.area_chart_outlined,
                      controller: areaController,
                      keyboardType: TextInputType.text),

                  CustomTextFormField(
                      hintText: "City Name",
                      icon: Icons.location_on,
                      controller: cityController,
                      keyboardType: TextInputType.name),
                  CustomTextFormField(
                      hintText: "Enter pincode",
                      icon: Icons.pin,
                      controller: pinController,
                      keyboardType: TextInputType.number),

                  // getTextField(
                  //     'Enter your name', nameController, TextInputType.name),
                  // getTextField('Enter your society', societyController,
                  //     TextInputType.text),
                  // getTextField("Enter your area name", areaController,
                  //     TextInputType.text),
                  // getTextField(
                  //     'Enter your City', cityController, TextInputType.name),
                  // getTextField("Enter your pincode", pinController,
                  //     TextInputType.number),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      onPressed: () {

                        // log("UserData >>>> ${userData.}");
                        if (formKey.currentState!.validate()) {
                          ListConst.currentUserData.name = nameController.text;
                          ListConst.currentUserData.society =
                              societyController.text;
                          ListConst.currentUserData.areaName =
                              areaController.text;
                          ListConst.currentUserData.city = cityController.text;
                          ListConst.currentUserData.pincode =
                              pinController.text;
                          show(
                            Routes.fillData2,
                            argument: PreloadAd(
                                googleNative: googleNativeAd,
                                googleBanner: googleBannerAd,
                                facebookNative: facebookNativeAd,
                                facebookBanner: facebookBannerAd),
                          );
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
              color: Colors.grey,fontSize: 12 // Change the color to your desired color
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
