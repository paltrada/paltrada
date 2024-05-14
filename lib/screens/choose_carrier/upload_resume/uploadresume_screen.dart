import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import '../../../../../../constant/color_const.dart';
import '../../../../../../constant/string_const.dart';
import '../../../../../../utils/show.dart';
import '../../../advertisement/constant.dart';
import '../../../advertisement/google_ads.dart';
import '../../../custom_widget/custom_button.dart';
import '../../../custom_widget/custom_scaffold.dart';
import '../../../custom_widget/custom_text.dart';
import '../../../custom_widget/custom_toast.dart';
import '../../../models/preload_ad.dart';
import '../../../routing/routes.dart';

class UploadResumeScreen extends StatefulWidget {
  const UploadResumeScreen({super.key});

  @override
  State<UploadResumeScreen> createState() => _UploadResumeScreenState();
}

class _UploadResumeScreenState extends State<UploadResumeScreen> {

  PreloadAd adsManager = Get.arguments;

  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }

  RxString pdfName = "Upload Resume".obs;
  PDFViewController? pdfViewController;
  String? pdfPath;

  Future<void> pickPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      log("${file.name} Uploaded");
      pdfName.value = "${file.name} Uploaded";
      pdfPath = file.path; // Store the selected PDF path.
    } else {
      // User canceled the file picker.
    }
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: Get.width * 0.08,
                    left: Get.width * 0.08,
                    bottom: Get.width * 0.05),
                child: const CustomText(
                    text: StringConst.uploadResume, align: TextAlign.start),
              ),
              getUploadButton(),
              const SizedBox(
                height: 10,
              ),
              getOpenButton(),
              const SizedBox(
                height: 15,
              ),
              getButton(),
            ],
          )
        ]);
  }

  getButton() {
    return SizedBox(
      width: Get.width * 0.6,
      child: CustomButton(
          onPressed: () {
            if (pdfName != "Upload Resume") {
              /*show(Routes.criteriaScree,*/ /*argument: PreloadAd(
            googleNative: googleNativeAd,
            googleBanner: googleBannerAd,
            facebookNative: facebookNativeAd,
            facebookBanner: facebookBannerAd)*/ /*argument: name);*/
              show(Routes.lastScreen, argument: PreloadAd(
                  googleNative: googleNativeAd,
                  googleBanner: googleBannerAd,
                  facebookNative: facebookNativeAd,
                  facebookBanner: facebookBannerAd));
            } else {
              showMessage("Please upload resume");
            }
          },
          buttonText: "Next",
          weight: true),
    );
  }

  getUploadButton() {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: Get.width * 0.6,
        height: Get.height * 0.07,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: ColorConst.transparent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              pickPDFFile();
            },
            child: Obx(() => CustomText(
                  text: pdfName.value,
                  color: ColorConst.black,
                ))),
      ),
    );
  }

  getOpenButton() {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: Get.width * 0.6,
        height: Get.height * 0.07,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: ColorConst.transparent,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side:
                  const BorderSide(color: Colors.red), // Change the border color here
            ),
          ),
          onPressed: () {
            if (pdfPath != null) {
              // If a PDF file is selected, navigate to a new screen to display the PDF.
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PDFView(
                    filePath: pdfPath!,
                  ),
                ),
              );
            } else {
              // Handle the case where no PDF is selected.
              log('No PDF file selected.');
              showMessage("Please upload Resume");
            }
          },
          child: const CustomText(text: 'Open PDF', color: ColorConst.black),
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
