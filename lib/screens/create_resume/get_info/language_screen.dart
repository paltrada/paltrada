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
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';

class GetLanguage extends StatefulWidget {
  const GetLanguage({super.key});

  @override
  State<GetLanguage> createState() => _GetLanguageState();
}

class _GetLanguageState extends State<GetLanguage> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  GlobalKey<FormState> formKey = GlobalKey();
  RxString searchText = "".obs;
  List<String> allLanguages = ["Hindi","English","Korean","Chinese","Arabic","Bengali","Portuguese","Urdu","Gujarati","Spanish","French","Russian","German","Greek","Turkish"];
  RxList<String> filteredPlaylists = <String>[].obs;
  RxList<String> selectedLanguage = <String>[].obs;
  TextEditingController languageController = TextEditingController();

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
        if(selectedLanguage.isNotEmpty){
          for(int i = 0; i < selectedLanguage.length; i++){
            String language = selectedLanguage[i];
            // Check if the language is not already in ListConst.languages
            if(!ListConst.languages.any((existingLanguage) => existingLanguage.language == language)){
              ListConst.languages.add(Language(language, 4));
            }
          }
          log("Languages = ${ListConst.languages}");
          show(Routes.getHobbies,
              argument: PreloadAd(
                  facebookBanner: facebookBannerAd,
                  facebookNative: facebookNativeAd,
                  googleBanner: googleBannerAd,
                  googleNative: googleNativeAd));
        }else{
          Get.snackbar("Warning", "Please provide data correctly.");
        }
      }, buttonText: "Save & Continue"),
    );
  }



  // Widget getButton(){
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: VarConst.padding),
  //     child: CustomButton(onPressed: () {
  //
  //
  //
  //       if(selectedLanguage.isNotEmpty){
  //         for(int i = 0 ; i < selectedLanguage.length ; i++){
  //           ListConst.languages.add(Language(selectedLanguage[i], 4));
  //         }
  //         log("Languages = ${ListConst.languages}");
  //         show(Routes.getHobbies,
  //             argument: PreloadAd(
  //                 facebookBanner: facebookBannerAd,
  //                 facebookNative: facebookNativeAd,
  //                 googleBanner: googleBannerAd,
  //                 googleNative: googleNativeAd));
  //       }else{
  //         Get.snackbar("Warning", "Please provide data correctly.");
  //       }
  //
  //
  //     }, buttonText: "Save & Continue"),
  //   );
  // }

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
            text: "Language",
            size: 35,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Language Known",
            color: ColorConst.darkWhite,
            size: 16,
          ),
          const CustomSize(
            height: 30,
          ),
          buildSearchLanguage(),
          Obx(() => Wrap(
            children: List<Widget>.generate(selectedLanguage.length, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Chip(
                  deleteIcon: const Icon(Icons.close,size: 20,),
                  onDeleted: (){
                    selectedLanguage.removeAt(index);
                  },
                  backgroundColor: ColorConst.inBoxColor,
                  label: CustomText(text: selectedLanguage[index],size: 14,)),
            )),
          ),
          ),
        ],
      ),
    );
  }

  buildSearchLanguage(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: ColorConst.grey)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: languageController,
                onChanged: (value) {
                  searchText.value = value.toLowerCase();
                  if(searchText.value.isNotEmpty){
                    filteredPlaylists.value = allLanguages
                        .where((playlist) =>
                        playlist.toLowerCase().contains(searchText.toLowerCase()))
                        .toList();
                  }else{
                    filteredPlaylists.value = [];
                  }
                  log("list >>> $filteredPlaylists");
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredPlaylists.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if(!selectedLanguage.contains(filteredPlaylists[index])){
                        selectedLanguage.add(filteredPlaylists[index]);
                      }
                      languageController.clear();
                      filteredPlaylists.value = [];
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                            child: CustomText(text: filteredPlaylists[index],size: 16,color: ColorConst.darkWhite,)
                        ),
                      ],
                    ),
                  );
                },
              ),
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
