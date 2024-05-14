
import 'dart:developer';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/list_const.dart';
import 'facebook_ads.dart';
import 'google_ads.dart';
import 'google_native.dart';

Widget? facebookBannerAd;
Widget? facebookNativeAd;
Widget? googleBannerAd;
Widget? googleNativeAd;
bool isIntro = true;
bool isOpenWebView = true;
bool isAllScreenAppOpenOn = true;

RxBool loaded = false.obs;
// IDS

String googleNativeId1 = "";
String googleNativeId2 = "";
String googleNativeId3 = "";
String googleNativeId4 = "";
String googleNativeId5 = "";
String googleBannerId1 = "";
String googleBannerId2 = "";
String googleBannerId3 = "";
String googleBannerId4 = "";
String googleBannerId5 = "";
String facebookInterstitial1 = '';
String facebookInterstitial2 = '';
String facebookInterstitial3 = '';
String facebookInterstitial4 = '';
String facebookInterstitial5 = '';
String facebookNativeId1 = '';
String facebookNativeId2 = '';
String facebookNativeId3 = '';
String facebookNativeId4 = '';
String facebookNativeId5 = '';
String facebookBannerId1 = '';
String facebookBannerId2 = '';
String facebookBannerId3 = '';
String facebookBannerId4 = '';
String facebookBannerId5 = '';
String googleAppOpenAd = '';
String googleInterstitial1 = '';
String googleInterstitial2 = '';
String googleInterstitial3 = '';
String googleInterstitial4 = '';
String googleInterstitial5 = '';
String updateUrl = "";
String webViewUrl = "";

// priorities

String? priority = "facebook";
String? backPriority = "facebook";

// on click event

int totalIntro = 4;
int clicked = 0;
int toBeClicked = 1;
bool isClicked = false;
int facebookNativeCurrentId = 1;
int facebookBannerCurrentId = 1;
int facebookInterCurrentId = 1;
int googleNativeCurrentId = 1;
int googleBannerCurrentId = 1;
int googleInterCurrentId = 1;

// interstitial

bool isFacebookGoogleBoth = true;
RxBool isFacebookShowed = false.obs;
RxBool isGoogleShowed = false.obs;
bool showAd = false;
bool isUpdateApp = false;
bool isBackAdd = false;
bool appOpenVisible = false;
bool facebookNativeVisible = true;
bool facebookBannerVisible = true;
bool isFacebookFailShowGoogle = false;
bool isGoogleFailShowFacebook = false;
bool isComingSoon = false;
bool comeAgain = false;
RxBool isGoogleIntShowed = false.obs;
RxBool isGoogleIntFailed = false.obs;
RxBool isFacebookIntFailed = false.obs;

// native
RxBool isGoogleNativeLoaded = false.obs;
RxBool isFacebookNativeFailed = false.obs;
RxBool isGoogleNativeFailed = false.obs;
bool isNativeFacebookGoogleBoth = true;
RxBool isNativeLoading = false.obs;
RxBool isNativeFacebookShowed = false.obs;
RxBool isFacebookLoaded = false.obs;

// banner
RxBool isGoogleBannerLoaded = false.obs;
RxBool isFacebookBannerLoaded = false.obs;
RxBool isBannerFacebookFailed = false.obs;
RxBool isBannerGoogleFailed = false.obs;
bool isBannerGoogleFacebookBoth = true;
bool isBannerFacebookShowed = false;

// back
bool isBackFacebookShowed = false;
bool isBackFacebookGoogleBoth = false;
bool isBackFacebookFailShowGoogle = false;
bool isBackGoogleFailShowFacebook = false;

//demo on/of loader



sizeBoxOfBanner() {
  return const SizedBox(
    height: 130,
  );
}

void getPreLoadAds() {
  isAllScreenAppOpenOn = ListConst.adsData.isAllScreenAppOpenOn!;
  if (showAd) {
    log('aya re edhar aya yeh');
    if (isClicked) {
      log("Inter Ads Launched");
      if (isAllScreenAppOpenOn == false) {
        log("isAllScreenAppOpenOn ====>>> $isAllScreenAppOpenOn");
        priority == "facebook"
            ? isFacebookGoogleBoth
            ? isFacebookShowed.value || isFacebookIntFailed.value
            ? MyGoogleAdsManager.showInterstitialAd()
            : FacebookInterstitialAd.showInterstitialAd()
            : isFacebookIntFailed.value
            ? isFacebookFailShowGoogle
            ? MyGoogleAdsManager.showInterstitialAd()
            : FacebookInterstitialAd.showInterstitialAd()
            : FacebookInterstitialAd.showInterstitialAd()
            : isFacebookGoogleBoth
            ? isGoogleShowed.value
            ? FacebookInterstitialAd.showInterstitialAd()
            : isGoogleIntFailed.value
            ? FacebookInterstitialAd.showInterstitialAd()
            : MyGoogleAdsManager.showInterstitialAd()
            : MyGoogleAdsManager.showInterstitialAd();
      }
      if (isAllScreenAppOpenOn == true) {
        log("isAllScreenAppOpenOn ====>>> $isAllScreenAppOpenOn");

        googleAppOpenLoadAd();
      }
    }
  }



  if (isClicked) {
    MyFacebookAdsManager.loadFacebookInterstitialAd();
    MyGoogleAdsManager.initGoogleLoad();
  }
  facebookNativeAd = facebookNativeAdWidget();
  facebookBannerAd = facebookNativeBannerAdWidget();
  googleNativeAd = const NativeContainer();
  googleBannerAd = const BannerContainer();
}

void backAds() {
  if (isBackAdd) {
    log('aya re edhar aya yh');
    if (isClicked) {
      backPriority == "facebook"
          ? isBackFacebookGoogleBoth
          ? isFacebookShowed.value || isFacebookIntFailed.value
          ? MyGoogleAdsManager.showInterstitialAd()
          : FacebookInterstitialAd.showInterstitialAd()
          : FacebookInterstitialAd.showInterstitialAd()
          : isBackFacebookGoogleBoth
          ? isGoogleShowed.value
          ? FacebookInterstitialAd.showInterstitialAd()
          : isGoogleIntFailed.value
          ? FacebookInterstitialAd.showInterstitialAd()
          : MyGoogleAdsManager.showInterstitialAd()
          : MyGoogleAdsManager.showInterstitialAd();
    }
  }

  if (isClicked) {
    MyFacebookAdsManager.loadFacebookInterstitialAd();
    MyGoogleAdsManager.initGoogleLoad();
  }
}
