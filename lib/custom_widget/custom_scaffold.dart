

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../advertisement/constant.dart';
import '../advertisement/google_ads.dart';
import '../constant/color_const.dart';
import '../constant/img_const.dart';
import 'custom_text.dart';

Widget customScaffold({
  required BuildContext context,
  String? appBarText,
  List<Widget>? children,
  bool isBackButton = false,
  bool isAppBar = false,
  List<Widget>? actions,
  Color color = ColorConst.titleText,
  bool extendBodyBehindAppBar = false,
  Color? bgColor,
  MainAxisAlignment? mainAxis,
  CrossAxisAlignment? crossAxis,
  Widget? nativeFacebookAd,
  Widget? nativeGoogleAd,
  Widget? bannerFacebookAd,
  Widget? bannerGoogleAd,
}) {
  log('bannerAd :: $bannerFacebookAd');
  return  WillPopScope(
    onWillPop: () async{
      if (isBackAdd) {
        clicked++;
        log("You Clicked $clicked Time And IsClicked is $isClicked");
        if (clicked == toBeClicked) {
          clicked = 0;
          isClicked = true;
        } else {
          isClicked = false;
        }
        backAds();
      }
      return true;
    },

    
    child: isAppBar
        ? SafeArea(
            child: Scaffold(
              backgroundColor: bgColor,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              appBar: buildAppBar(
                  text: appBarText ?? "",
                  color: color,
                  actions: actions,
                  isBack: isBackButton),
              body: buildBody(
                children: children ?? [],
                mainAxis: mainAxis ?? MainAxisAlignment.center,
                crossAxis: crossAxis ?? CrossAxisAlignment.start,
                bgColor: bgColor ?? Colors.transparent,
                context: context,
                isAppBarSize: extendBodyBehindAppBar,
                nativeFacebookAd: nativeFacebookAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                nativeGoogleAd: nativeGoogleAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                bannerFacebookAd: bannerFacebookAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                bannerGoogleAd: bannerGoogleAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              backgroundColor: bgColor,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              body: buildBody(
                isAppBarSize: false,
                children: children ?? [],
                mainAxis: mainAxis ?? MainAxisAlignment.center,
                crossAxis: crossAxis ?? CrossAxisAlignment.start,
                bgColor: bgColor ?? Colors.transparent,
                context: context,
                nativeFacebookAd: nativeFacebookAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                nativeGoogleAd: nativeGoogleAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                bannerFacebookAd: bannerFacebookAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                bannerGoogleAd: bannerGoogleAd ??
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
              ),
            ),
          ),
  );
}

PreferredSizeWidget buildAppBar(
    {required String text,
    List<Widget>? actions,
    required bool isBack,
    required Color color}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: ColorConst.buttonColor,
    title: CustomText(
      text: text,
      weight: true,
      color: ColorConst.white,
      size: 20,
    ),
    actions: actions,
    elevation: 0,
  );
}

Widget buildBody({
  required List<Widget> children,
  required MainAxisAlignment mainAxis,
  required CrossAxisAlignment crossAxis,
  required BuildContext context,
  required bool isAppBarSize,
  required Color bgColor,
  required Widget nativeFacebookAd,
  required Widget nativeGoogleAd,
  required Widget bannerFacebookAd,
  required Widget bannerGoogleAd,
}) {
  return (isAllScreenAppOpenOn == true)
      ? (isOpenLoader.value == false)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.35,
                    child: Lottie.asset(
                      ImgConst.loader,
                      fit: BoxFit.contain,
                    ),
                  ),
                  buildSize(height: 20),
                  Container(
                      height: 40,
                      width: 40,
                      child: const CircularProgressIndicator(
                        color: ColorConst.buttonColor,
                      )),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        isAppBarSize
                            ? const SizedBox(
                                height: 60,
                              )
                            : const SizedBox(),
                        showAd
                            ? priority == "facebook"
                                ? isNativeFacebookGoogleBoth
                                    ? isNativeFacebookShowed.value ||
                                            isFacebookNativeFailed.value
                                        ? nativeGoogleAd
                                        : nativeFacebookAd
                                    : isFacebookNativeFailed.value
                                        ? isFacebookFailShowGoogle
                                            ? nativeGoogleAd
                                            : nativeFacebookAd
                                        : nativeFacebookAd
                                : isNativeFacebookGoogleBoth
                                    ? isGoogleNativeLoaded.value
                                        ? nativeFacebookAd
                                        : isGoogleNativeFailed.value
                                            ? nativeFacebookAd
                                            : nativeGoogleAd
                                    : nativeGoogleAd
                            : const SizedBox(),
                        Column(
                          mainAxisAlignment: mainAxis,
                          crossAxisAlignment: crossAxis,
                          children: children,
                        ),
                        buildSize(),
                      ],
                    ),
                  ),
                ),
                showAd
                    ? priority == "facebook"
                        ? isBannerGoogleFacebookBoth
                            ? isBannerFacebookShowed ||
                                    isBannerFacebookFailed.value
                                ? bannerGoogleAd
                                : bannerFacebookAd
                            : isBannerFacebookFailed.value
                                ? isFacebookFailShowGoogle
                                    ? bannerGoogleAd
                                    : bannerFacebookAd
                                : bannerFacebookAd
                        : isBannerGoogleFacebookBoth
                            ? isGoogleBannerLoaded.value
                                ? bannerFacebookAd
                                : isBannerGoogleFailed.value
                                    ? bannerFacebookAd
                                    : bannerGoogleAd
                            : bannerGoogleAd
                    : const SizedBox(),
              ],
            )
      : Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    isAppBarSize
                        ? const SizedBox(
                            height: 60,
                          )
                        : const SizedBox(),
                    showAd
                        ? priority == "facebook"
                            ? isNativeFacebookGoogleBoth
                                ? isNativeFacebookShowed.value ||
                                        isFacebookNativeFailed.value
                                    ? nativeGoogleAd
                                    : nativeFacebookAd
                                : isFacebookNativeFailed.value
                                    ? isFacebookFailShowGoogle
                                        ? nativeGoogleAd
                                        : nativeFacebookAd
                                    : nativeFacebookAd
                            : isNativeFacebookGoogleBoth
                                ? isGoogleNativeLoaded.value
                                    ? nativeFacebookAd
                                    : isGoogleNativeFailed.value
                                        ? nativeFacebookAd
                                        : nativeGoogleAd
                                : nativeGoogleAd
                        : const SizedBox(),
                    Column(
                      mainAxisAlignment: mainAxis,
                      crossAxisAlignment: crossAxis,
                      children: children,
                    ),
                    buildSize(),
                  ],
                ),
              ),
            ),
            showAd
                ? priority == "facebook"
                    ? isBannerGoogleFacebookBoth
                        ? isBannerFacebookShowed || isBannerFacebookFailed.value
                            ? bannerGoogleAd
                            : bannerFacebookAd
                        : isBannerFacebookFailed.value
                            ? isFacebookFailShowGoogle
                                ? bannerGoogleAd
                                : bannerFacebookAd
                            : bannerFacebookAd
                    : isBannerGoogleFacebookBoth
                        ? isGoogleBannerLoaded.value
                            ? bannerFacebookAd
                            : isBannerGoogleFailed.value
                                ? bannerFacebookAd
                                : bannerGoogleAd
                        : bannerGoogleAd
                : const SizedBox(),
          ],
        );
}

Widget buildSize({double? height, double? width}) {
  return SizedBox(
    height: height ?? 10,
    width: width ?? 10,
  );
}
