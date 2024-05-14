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

class GetPersonalDetail extends StatefulWidget {
  const GetPersonalDetail({super.key});

  @override
  State<GetPersonalDetail> createState() => _GetPersonalDetailState();
}

class _GetPersonalDetailState extends State<GetPersonalDetail> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

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

  Widget getButton(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
      child: CustomButton(onPressed: () {

        if (formKey.currentState!.validate()) {
          ListConst.fullName = nameController.text;
          ListConst.currentPosition = positionController.text;
          ListConst.email = emailController.text;
          ListConst.number = numberController.text;
          if(emailController.text.contains(".com")){
            show(Routes.getAddress,
                argument: PreloadAd(
                    facebookBanner: facebookBannerAd,
                    facebookNative: facebookNativeAd,
                    googleBanner: googleBannerAd,
                    googleNative: googleNativeAd));
          }else{
            Get.snackbar("Warning", "Please enter correct email.");
          }

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

            const CustomText(
              text: "Personal Details",
              size: 35,
              weight: true,
              color: ColorConst.titleText,
              align: TextAlign.start,
            ),
            const CustomSize(
              height: 14,
            ),
            const CustomText(
              text: "Choose your Qualification",
              color: ColorConst.darkWhite,
              size: 16,
            ),
            const CustomSize(
              height: 30,
            ),
            CustomTextFormField(
                hintText: "Full Name",
                icon: Icons.person,
                controller: nameController),
            const CustomSize(),
            CustomTextFormField(
                hintText: "Current Position",
                icon: Icons.work,
                controller: positionController),
            const CustomSize(),
            CustomTextFormField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                icon: Icons.location_on,
                controller: emailController),
            const CustomSize(),
            CustomTextFormField(
              keyboardType: TextInputType.number,
                hintText: "Mobile Number",
                icon: Icons.description,
                controller: numberController),
            const CustomSize(
              height: 10,
            ),
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
