import 'dart:developer';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

Widget facebookNativeAdWidget() {
  log("okay");
  if (facebookNativeVisible) {
    isNativeLoading.value = true;
    log ("facebookNative");
    String currentAdId = "";
    if(facebookNativeCurrentId == 1){
      currentAdId = facebookNativeId1;
      log("Current Facebook native id 1");
      facebookNativeCurrentId++;
    }else if(facebookNativeCurrentId == 2){
      currentAdId = facebookNativeId2;
      log("Current Facebook native id 2");
      facebookNativeCurrentId++;
    }else if(facebookNativeCurrentId == 3){
      currentAdId = facebookNativeId3;
      log("Current Facebook native id 3");
      facebookNativeCurrentId++;
    }else if(facebookNativeCurrentId == 4){
      currentAdId = facebookNativeId4;
      log("Current Facebook native id 4");
      facebookNativeCurrentId++;
    }else if(facebookNativeCurrentId == 5){
      currentAdId = facebookNativeId5;
      log("Current Facebook native id 5");
      facebookNativeCurrentId = 1;
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FacebookNativeAd(
        placementId: currentAdId,
        adType: NativeAdType.NATIVE_AD,
        height: 300,
        width: double.infinity,
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        descriptionColor: Colors.black,
        buttonColor: Colors.deepPurple,
        labelColor: Colors.black,
        buttonTitleColor: Colors.white,
        buttonBorderColor: Colors.white,
        bannerAdSize: NativeBannerAdSize.HEIGHT_120,
        listener: (result, value) {
          log("sun re baba");
          if (result == NativeAdResult.LOADED) {
            log("gun lod ho gai bhai");
            isFacebookLoaded.value = true;
            isNativeFacebookShowed.value = true;
            isNativeLoading.value = false;
            isFacebookNativeFailed.value = false;
          } else if (result == NativeAdResult.ERROR) {
            log("Error ali ::::::: $value");
            isFacebookLoaded.value = false;
            isNativeLoading.value = false;
            if (isNativeFacebookGoogleBoth) {
              isFacebookNativeFailed.value = true;
            } else {
              isFacebookNativeFailed.value = true;

            }
          }
        },
      ),
    );
  } else {
    return Container(
      height: 150,
      width: 100,
      color: Colors.red,
    );
  }
}

Widget facebookNativeBannerAdWidget() {
  if (facebookBannerVisible) {
    log (
        "facebookBanner");
    String currentAdId = "";
    if(facebookBannerCurrentId == 1){
      currentAdId = facebookBannerId1;
      log("Current Facebook banner id 1");
      facebookBannerCurrentId++;
    }else if(facebookBannerCurrentId == 2){
      currentAdId = facebookBannerId2;
      log("Current Facebook banner id 2");
      facebookBannerCurrentId++;
    }else if(facebookBannerCurrentId == 3){
      currentAdId = facebookBannerId3;
      log("Current Facebook banner id 3");
      facebookBannerCurrentId++;
    }else if(facebookBannerCurrentId == 4){
      currentAdId = facebookBannerId4;
      log("Current Facebook banner id 4");
      facebookBannerCurrentId++;
    }else if(facebookBannerCurrentId == 5){
      currentAdId = facebookBannerId5;
      log("Current Facebook banner id 5");
      facebookBannerCurrentId = 1;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FacebookNativeAd(
        placementId: currentAdId,
        adType: NativeAdType.NATIVE_BANNER_AD,
        height: 120,
        width: double.infinity,
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        descriptionColor: Colors.black,
        buttonColor: Colors.deepPurple,
        labelColor: Colors.black,
        buttonTitleColor: Colors.white,
        buttonBorderColor: Colors.white,
        bannerAdSize: NativeBannerAdSize.HEIGHT_120,
        listener: (result, value) {
          log ("yes facebook banner is loaded $result");
          if (result == NativeAdResult.LOADED) {
            isFacebookBannerLoaded.value = true;
            isBannerFacebookShowed = true;
            isBannerFacebookFailed.value = false;
          } else if (result == NativeAdResult.ERROR) {
            log ("No facebook banner is loaded :: $value");
            isBannerFacebookFailed.value = true;
          }
        },
      ),
    );
  } else {
    return Container();
  }
}


class MyFacebookAdsManager {
  static void init() {
    FacebookAudienceNetwork.init(
      testingId:
      // '64f2b6bd-43a4-4a2f-ad97-b026456f75f8',
      '<test-id-if-needed>',
    );
    MyFacebookAdsManager.loadFacebookInterstitialAd();
  }

  static void loadFacebookInterstitialAd() {
    String currentAdId = "";
    log("Inter");
    if(facebookInterCurrentId == 1){
      currentAdId = facebookInterstitial1;
      log("Current Facebook inter id 1");
      facebookInterCurrentId++;
    }else if(facebookInterCurrentId == 2){
      currentAdId = facebookInterstitial2;
      log("Current Facebook inter id 2");
      facebookInterCurrentId++;
    }else if(facebookInterCurrentId == 3){
      currentAdId = facebookInterstitial3;
      log("Current Facebook inter id 3");
      facebookInterCurrentId++;
    }else if(facebookInterCurrentId == 4){
      currentAdId = facebookInterstitial4;
      log("Current Facebook inter id 4");
      facebookInterCurrentId++;
    }else if(facebookInterCurrentId == 5){
      currentAdId = facebookInterstitial5;
      log("Current Facebook inter id 5");
      facebookInterCurrentId = 1;
    }
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: currentAdId,
      listener: (result, value) {
        switch (result) {
          case InterstitialAdResult.LOADED:
            log('facebook int loaded >>>>>>>>> ');
            break;
          case InterstitialAdResult.DISMISSED:
            FacebookInterstitialAd.destroyInterstitialAd();


            isFacebookShowed.value = true;

            break;
          case InterstitialAdResult.ERROR:
            log('facebook error :: ${InterstitialAdResult.ERROR}');
            FacebookInterstitialAd.destroyInterstitialAd();
            isFacebookIntFailed.value = true;
            // MyFacebookAdsManager.loadFacebookInterstitialAd();
            if (isFacebookFailShowGoogle) {
              // MyGoogleAdsManager.showGoogleInterstitialAd();
            }
            isFacebookShowed.value = false;
            break;
          default:
        }
      },
    );
  }
}
