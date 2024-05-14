import'dart:developer';

import '../advertisement/constant.dart';
import 'package:http/http.dart' as http;
import '../constant/list_const.dart';
import '../constant/string_const.dart';
import '../models/ads_data.dart';

class GetAdsDataRepository {

  static Future<void> fetchAdsData()async {
    const url = StringConst.adsUrl;
    final response = await http.get(Uri.parse(url));
    log("error ali ${response.statusCode}");
    if (response.statusCode == 200) {
      log("its coming in");
      ListConst.adsData = adsDataFromJson(response.body);
      log("response for ads${response.body}");
      if (ListConst.adsData.facebookInterstitial1 != null) {
        facebookInterstitial1= ListConst.adsData.facebookInterstitial1!;
      }

      if (ListConst.adsData.isIntro != null) {
        isIntro= ListConst.adsData.isIntro!;
      }

      if (ListConst.adsData.facebookInterstitial2 != null) {
        facebookInterstitial2= ListConst.adsData.facebookInterstitial2!;
      }

      if (ListConst.adsData.facebookInterstitial3 != null) {
        facebookInterstitial3= ListConst.adsData.facebookInterstitial3!;
      }

      if (ListConst.adsData.facebookInterstitial4 != null) {
        facebookInterstitial4= ListConst.adsData.facebookInterstitial4!;
      }

      if (ListConst.adsData.facebookInterstitial5 != null) {
        facebookInterstitial5= ListConst.adsData.facebookInterstitial5!;
      }

      if (ListConst.adsData.facebookNativeId1 != null) {
        facebookNativeId1 = ListConst.adsData.facebookNativeId1!;
      }

      if (ListConst.adsData.facebookNativeId2 != null) {
        facebookNativeId2 = ListConst.adsData.facebookNativeId2!;
      }

      if (ListConst.adsData.facebookNativeId3 != null) {
        facebookNativeId3 = ListConst.adsData.facebookNativeId3!;
      }

      if (ListConst.adsData.facebookNativeId4 != null) {
        facebookNativeId4 = ListConst.adsData.facebookNativeId4!;
      }

      if (ListConst.adsData.facebookNativeId5 != null) {
        facebookNativeId5 = ListConst.adsData.facebookNativeId5!;
      }

      if (ListConst.adsData.facebookBannerId1 != null) {
        facebookBannerId1 = ListConst.adsData.facebookBannerId1!;
      }

      if (ListConst.adsData.facebookBannerId2 != null) {
        facebookBannerId2 = ListConst.adsData.facebookBannerId2!;
      }

      if (ListConst.adsData.facebookBannerId3 != null) {
        facebookBannerId3 = ListConst.adsData.facebookBannerId3!;
      }

      if (ListConst.adsData.facebookBannerId4 != null) {
        facebookBannerId4 = ListConst.adsData.facebookBannerId4!;
      }

      if (ListConst.adsData.facebookBannerId5 != null) {
        facebookBannerId5 = ListConst.adsData.facebookBannerId5!;
      }

      if (ListConst.adsData.googleInterstitial1 != null) {
        googleInterstitial1 = ListConst.adsData.googleInterstitial1!;
      }

      if (ListConst.adsData.googleInterstitial2 != null) {
        googleInterstitial2 = ListConst.adsData.googleInterstitial2!;
      }

      if (ListConst.adsData.googleInterstitial3 != null) {
        googleInterstitial3 = ListConst.adsData.googleInterstitial3!;
      }

      if (ListConst.adsData.googleInterstitial4 != null) {
        googleInterstitial4 = ListConst.adsData.googleInterstitial4!;
      }

      if (ListConst.adsData.googleInterstitial5 != null) {
        googleInterstitial5 = ListConst.adsData.googleInterstitial5!;
      }

      if (ListConst.adsData.googleNativeId1 != null) {
        googleNativeId1 = ListConst.adsData.googleNativeId1!;
      }

      if (ListConst.adsData.googleNativeId2 != null) {
        googleNativeId2 = ListConst.adsData.googleNativeId2!;
      }

      if (ListConst.adsData.googleNativeId3 != null) {
        googleNativeId3 = ListConst.adsData.googleNativeId3!;
      }

      if (ListConst.adsData.googleNativeId4 != null) {
        googleNativeId4 = ListConst.adsData.googleNativeId4!;
      }

      if (ListConst.adsData.googleNativeId5 != null) {
        googleNativeId5 = ListConst.adsData.googleNativeId5!;
      }

      if (ListConst.adsData.googleBannerId1 != null) {
        googleBannerId1 = ListConst.adsData.googleBannerId1!;
      }

      if (ListConst.adsData.googleBannerId2 != null) {
        googleBannerId2 = ListConst.adsData.googleBannerId2!;
      }

      if (ListConst.adsData.googleBannerId3 != null) {
        googleBannerId3 = ListConst.adsData.googleBannerId3!;
      }

      if (ListConst.adsData.googleBannerId4 != null) {
        googleBannerId4 = ListConst.adsData.googleBannerId4!;
      }

      if (ListConst.adsData.googleBannerId5 != null) {
        googleBannerId5 = ListConst.adsData.googleBannerId5!;
      }

      if (ListConst.adsData.googleAppOpenAd != null) {
        googleAppOpenAd = ListConst.adsData.googleAppOpenAd!;
      }

      if (ListConst.adsData.priority != null) {
        priority = ListConst.adsData.priority!;
      }

      if (ListConst.adsData.backPriority != null) {
        backPriority = ListConst.adsData.backPriority!;
      }

      if (ListConst.adsData.toBeClicked != null) {
        toBeClicked = ListConst.adsData.toBeClicked!;
      }

      if (ListConst.adsData.appOpenVisible != null) {
        appOpenVisible = ListConst.adsData.appOpenVisible!;
      }

      if (ListConst.adsData.showAd != null) {
        showAd = ListConst.adsData.showAd!;
      }

      if (ListConst.adsData.isBackAdd != null) {
        isBackAdd = ListConst.adsData.isBackAdd!;
      }

      if (ListConst.adsData.isFacebookGoogleBoth != null) {
        isFacebookGoogleBoth = ListConst.adsData.isFacebookGoogleBoth!;
      }

      if (ListConst.adsData.facebookNativeVisible != null) {
        facebookNativeVisible = ListConst.adsData.facebookNativeVisible!;
      }

      if (ListConst.adsData.facebookBannerVisible != null) {
        facebookBannerVisible = ListConst.adsData.facebookBannerVisible!;
      }

      if (ListConst.adsData.isFacebookFailShowGoogle != null) {
        isFacebookFailShowGoogle = ListConst.adsData.isFacebookFailShowGoogle!;
      }

      if (ListConst.adsData.isGoogleFailShowFacebook != null) {
        isGoogleFailShowFacebook = ListConst.adsData.isGoogleFailShowFacebook!;
      }

      if (ListConst.adsData.isComingSoon != null) {
        isComingSoon = ListConst.adsData.isComingSoon!;
      }

      if (ListConst.adsData.isNativeFacebookGoogleBoth != null) {
        isNativeFacebookGoogleBoth = ListConst.adsData.isNativeFacebookGoogleBoth!;
      }

      if (ListConst.adsData.isBannerGoogleFacebookBoth != null) {
        isBannerGoogleFacebookBoth = ListConst.adsData.isBannerGoogleFacebookBoth!;
      }

      if (ListConst.adsData.isBackFacebookGoogleBoth != null) {
        isBackFacebookGoogleBoth = ListConst.adsData.isBackFacebookGoogleBoth!;
      }


      if (ListConst.adsData.totalIntro != null) {
        totalIntro = ListConst.adsData.totalIntro!;
      }
      if (ListConst.adsData.isUpdateApp != null) {
        isUpdateApp = ListConst.adsData.isUpdateApp!;
      }
      if (ListConst.adsData.updateUrl != null) {
        updateUrl = ListConst.adsData.updateUrl!;
      }
      if (ListConst.adsData.isOpenWebView != null) {
        isOpenWebView = ListConst.adsData.isOpenWebView!;
        log("isOpenWebView == >> $isOpenWebView");
      }
      if (ListConst.adsData.isAllScreenAppOpenOn != null) {
        isAllScreenAppOpenOn = ListConst.adsData.isAllScreenAppOpenOn!;
        log("isAllScreenAppOpenOn == >> $isAllScreenAppOpenOn");
      }
      if (ListConst.adsData.webViewUrl != null){
        webViewUrl = ListConst.adsData.webViewUrl!;
        log("webViewUrl ==> $webViewUrl");
      }
    }
  }
}
