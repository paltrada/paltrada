import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
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
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';


class GetExperience extends StatefulWidget {
  const GetExperience({super.key});

  @override
  State<GetExperience> createState() => _GetExperienceState();
}

class _GetExperienceState extends State<GetExperience> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  RxList<ExperienceData> experiences = <ExperienceData>[].obs;

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
        ListConst.experiences = experiences;

        if (experiences.isNotEmpty) {

          show(Routes.getLanguage,
              argument: PreloadAd(
                  facebookBanner: facebookBannerAd,
                  facebookNative: facebookNativeAd,
                  googleBanner: googleBannerAd,
                  googleNative: googleNativeAd));
        } else {
          Get.snackbar("Warning", "Please provide data correctly.");
        }

      }, buttonText: "Save & Continue"),
    );
  }

  Widget getField(){
    return Padding(
      padding: EdgeInsets.all(VarConst.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSize(
            height: 30,
          ),
          const CustomText(
            text: "Experience",
            size: 35,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Add Your Experience",
            color: ColorConst.darkWhite,
            size: 16,
          ),
          const CustomSize(
            height: 30,
          ),
          Obx(
                () => ListView.separated(
                separatorBuilder: (BuildContext context, index) {
                  return const CustomSize();
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: experiences.length,
                itemBuilder: (BuildContext context, index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: buildExperienceBox(experiences[index]));
                }),
          ),
          const CustomSize(),
          buildAddButton(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget buildExperienceBox(ExperienceData exp) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: ColorConst.inBoxColor,
      collapsedBackgroundColor: ColorConst.inBoxColor,
      title: CustomText(
        text: "Title : ${exp.experienceTitle}",
        align: TextAlign.start,
        size: 16,
        color: Colors.black87,
      ),
      subtitle: CustomText(
        text: "Place : ${exp.experiencePlace}",
        align: TextAlign.start,
        size: 14,
        color: Colors.black45,
      ),
      childrenPadding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text:
                "Period : ${exp.experiencePeriod}",
                align: TextAlign.start,
                size: 14,
                color: Colors.black45),
            const CustomSize(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                    text:
                    "Description : ",
                    align: TextAlign.start,
                    size: 14,
                    color: Colors.black45),
                Expanded(
                  child: CustomText(
                      text:
                      exp.experienceDescription,
                      align: TextAlign.start,
                      size: 14,
                      color: Colors.black45),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget buildAddButton(){
    return Center(
      child: GestureDetector(
        onTap: (){
          onAddExperience();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: ColorConst.grey)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: VarConst.padding),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Add Experience"),
                Icon(Icons.add,color: ColorConst.buttonColor,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onAddExperience() {
    Get.bottomSheet(SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 6,
              width: Get.width / 3.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConst.grey
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      hintText: "Title",
                      icon: Icons.title,
                      controller: titleController),
                  const CustomSize(),
                  CustomTextFormField(
                      hintText: "Place",
                      icon: Icons.work,
                      controller: placeController),
                  const CustomSize(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(flex: 1, child: buildGetStartDate()),
                      const CustomSize(),
                      Flexible(flex: 1, child: buildGetEndDate())
                    ],
                  ),
                  const CustomSize(),
                  CustomTextFormField(
                      hintText: "Location",
                      icon: Icons.location_on,
                      controller: locationController),
                  const CustomSize(),
                  CustomTextFormField(
                      hintText: "Description",
                      icon: Icons.chat,
                      controller: descriptionController),
                  const CustomSize(
                    height: 30,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log("formKey >>> ${formKey.currentState!.validate()}");
                          experiences.add(ExperienceData(
                              experienceTitle: titleController.text,
                              experienceDescription: descriptionController.text,
                              experienceLocation: locationController.text,
                              experiencePeriod: "${startDate.value.toString().split(" ")[0]}  ${endDate.value.toString().split(" ")[0]}",
                              experiencePlace: placeController.text
                          ));
                          Get.back();
                        }
                        titleController.clear();
                        placeController.clear();
                        descriptionController.clear();
                        locationController.clear();
                        startDate.value = DateTime.now();
                        endDate.value = DateTime.now();
                      },
                      buttonText: "Add Experience"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
    ),
      enableDrag: true,
      backgroundColor: ColorConst.bgColor,
    );
  }

  Widget buildGetStartDate() {
    return GestureDetector(
      onTap: () async {
        DateTime? datePicker = await showDatePicker(
            context: context,
            initialDate: startDate.value,
            firstDate: DateTime(1950),
            lastDate: DateTime.now());
        if (datePicker != null) {
          startDate.value = datePicker;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorConst.inBoxColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Start Date:",
                color: ColorConst.darkWhite.withOpacity(0.5),
                size: 14,
              ),
              const CustomSize(
                height: 5,
              ),
              Row(
                children: [
                  Obx(
                        () => CustomText(
                      text: startDate.value.toString().split(" ")[0],
                      color: ColorConst.darkWhite,
                      size: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: ColorConst.darkWhite,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildGetEndDate() {
    return GestureDetector(
      onTap: () async {
        DateTime? datePicker = await showDatePicker(
            context: context,
            initialDate: endDate.value,
            firstDate: DateTime(1950),
            lastDate: DateTime.now());
        if (datePicker != null) {
          endDate.value = datePicker;
          setState(() {
            log("endDate >>> $endDate");
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorConst.inBoxColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "End Date:",
                color: ColorConst.darkWhite.withOpacity(0.5),
                size: 14,
              ),
              const CustomSize(
                height: 5,
              ),
              Row(
                children: [
                  Obx(
                        () => CustomText(
                      text: endDate.value.toString().split(" ")[0],
                      color: ColorConst.darkWhite,
                      size: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.calendar_month,
                    color: ColorConst.darkWhite,
                    size: 20,
                  )
                ],
              ),
            ],
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
