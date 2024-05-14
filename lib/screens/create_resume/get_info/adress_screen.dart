import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';



class GetAddress extends StatefulWidget {
  const GetAddress({super.key});

  @override
  State<GetAddress> createState() => _GetAddressState();
}

class _GetAddressState extends State<GetAddress> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        context: context,
        children: [
          getField(),
          getButton(),



        ]);
  }

  Widget getButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: CustomButton(onPressed: () {
        if (formKey.currentState!.validate()) {
          ListConst.address = addressController.text;
          ListConst.street = streetController.text;
          ListConst.street = streetController.text;
          ListConst.bio = bioController.text;
          ListConst.country = countryController.text;
          show(Routes.getEducation,
              argument: PreloadAd(
                  facebookBanner: facebookBannerAd,
                  facebookNative: facebookNativeAd,
                  googleBanner: googleBannerAd,
                  googleNative: googleNativeAd));
        }

      }, buttonText: "Save & Continue"),
    );
  }

    Widget getField(){
    return Padding(
      padding: EdgeInsets.all(VarConst.padding),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSize(height: 30,),
            const CustomText(
              text: "Address",
              size: 35,
              weight: true,
              color: ColorConst.titleText,
              align: TextAlign.start,
            ),
            const CustomSize(
              height: 14,
            ),
            const CustomText(
              text: "Provide your address",
              color: ColorConst.darkWhite,
              size: 16,
            ),
            const CustomSize(height: 30,),
            CustomTextFormField(hintText: "Address",
                icon: Icons.person,
                controller: addressController),
            const CustomSize(),
            CustomTextFormField(hintText: "Street",
                icon: Icons.location_on,
                controller: streetController),
            const CustomSize(),
            CustomTextFormField(hintText: "Country",
                icon: Icons.work,
                controller: countryController),
            const CustomSize(),
            CustomTextFormField(hintText: "Bio",
                icon: Icons.description,
                controller: bioController),
            const CustomSize(height: 10,)
          ],
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
