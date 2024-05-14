import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';
import 'package:resumebuilder1/custom_widget/custom_scaffold.dart';

import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../constant/color_const.dart';
import '../../../constant/img_const.dart';
import '../../../constant/list_const.dart';
import '../../../constant/var_const.dart';
import '../../../custom_widget/custom_size.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';
import '../../../utils/show.dart';


class GetResumeType extends StatefulWidget {
  const GetResumeType({super.key});

  @override
  State<GetResumeType> createState() => _GetResumeTypeState();
}

class _GetResumeTypeState extends State<GetResumeType> {

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  PreloadAd adsManager = Get.arguments;

  List<String> resumes = [
    ImgConst.type1,
    ImgConst.type2,
    ImgConst.type3,
  ];

  List<String> downloads = ["2k", "4k+", "3.5k"];
  List<String> titles = ["Classic","Technical","Business",];
  List<TemplateTheme> themes = [
    TemplateTheme.classic,
    TemplateTheme.technical,
    TemplateTheme.business,
  ];


  //
  // RxString imagePath = "".obs;
  //
  // Future getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     imagePath.value = image.path.toString();
  //     log("imagePath.value >>>> <<< ${imagePath.value}");
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return customScaffold(
        bannerFacebookAd: adsManager.facebookBanner,
        bannerGoogleAd: adsManager.googleBanner,
        nativeFacebookAd: adsManager.facebookNative,
        nativeGoogleAd: adsManager.googleNative,
        context: context,
        children: [
          // Obx(
          //       () {
          //     return Row(
          //       children: [
          //         imagePath.isNotEmpty
          //             ? CircleAvatar(
          //             radius: 30,
          //             backgroundImage:
          //             FileImage(File(imagePath.toString())))
          //             : CircleAvatar(
          //           radius: 30,
          //           backgroundColor: Colors.grey.shade400,
          //           child: const Icon(Icons.person,
          //               color: ColorConst.white, size: 40),
          //         ),
          //         const CustomSize(
          //           width: 10,
          //         ),
          //         Expanded(
          //           child: GestureDetector(
          //             onTap: () {
          //               getImage();
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: ColorConst.buttonColor,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: const Padding(
          //                 padding: EdgeInsets.symmetric(vertical: 14),
          //                 child: CustomText(
          //                     text: "Select Profile",
          //                     color: ColorConst.white,
          //                     weight: true),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
          getBody(),

        ]);
  }



  Widget getBody(){
    return Padding(
      padding: EdgeInsets.all(VarConst.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const CustomText(
            text: "Resume Type",
            size: 30,
            weight: true,
            color: ColorConst.titleText,
            align: TextAlign.start,
          ),
          const CustomSize(height: 5),
          const CustomText(
            text: "Select your resume type",
            color: ColorConst.darkWhite,
          ),
          const CustomSize(),
          GridView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: resumes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    ListConst.resumeType = themes[index];
                    // ListConst.imagePath = imagePath.value ;
                    log("ListConst.imagePath >>>> ${ListConst.imagePath}");
                    show(Routes.resumeBuilder,
                        argument: PreloadAd(
                            facebookBanner: facebookBannerAd,
                            facebookNative: facebookNativeAd,
                            googleBanner: googleBannerAd,
                            googleNative: googleNativeAd));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 6,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          ),
                        ]),
                    child: Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            resumes[index],
                            fit: BoxFit.fill,
                          )),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    elevation: 10,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: ColorConst.black),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 8),
                                          child: CustomText(
                                            text: downloads[index],
                                            size: 12,
                                            color: ColorConst.bgColor,
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 10,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: ColorConst.black),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: CustomText(
                                        text: titles[index],
                                        size: 14,
                                        color: ColorConst.bgColor,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                );
              }),
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
