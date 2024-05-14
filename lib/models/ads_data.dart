

import 'dart:convert';

AdsData adsDataFromJson(String str) => AdsData.fromJson(json.decode(str));

String adsDataToJson(AdsData data) => json.encode(data.toJson());

class AdsData {
  final bool? appOpenVisible;
  final String? backPriority;
  final String? facebookBannerId1;
  final String? facebookBannerId2;
  final String? facebookBannerId3;
  final String? facebookBannerId4;
  final String? facebookBannerId5;
  final bool? facebookBannerVisible;
  final String? facebookInterstitial1;
  final String? facebookInterstitial2;
  final String? facebookInterstitial3;
  final String? facebookInterstitial4;
  final String? facebookInterstitial5;
  final String? facebookNativeId1;
  final String? facebookNativeId2;
  final String? facebookNativeId3;
  final String? facebookNativeId4;
  final String? facebookNativeId5;
  final bool? facebookNativeVisible;
  final String? googleAppOpenAd;
  final String? googleBannerId1;
  final String? googleBannerId2;
  final String? googleBannerId3;
  final String? googleBannerId4;
  final String? googleBannerId5;
  final String? googleInterstitial1;
  final String? googleInterstitial2;
  final String? googleInterstitial3;
  final String? googleInterstitial4;
  final String? googleInterstitial5;
  final String? googleNativeId1;
  final String? googleNativeId2;
  final String? googleNativeId3;
  final String? googleNativeId4;
  final String? googleNativeId5;
  final bool? isBackAdd;
  final bool? isBackFacebookGoogleBoth;
  final bool? isBannerGoogleFacebookBoth;
  final bool? isComingSoon;
  final bool? isFacebookFailShowGoogle;
  final bool? isFacebookGoogleBoth;
  final bool? isGoogleFailShowFacebook;
  final bool? isNativeFacebookGoogleBoth;
  final bool? isUpdateApp;
  final bool? isIntro;
  final String? priority;
  final bool? showAd;
  final int? toBeClicked;
  final int? totalIntro;
  final String? updateUrl;
  final bool? isOpenWebView;
  final bool? isAllScreenAppOpenOn;
  final String? webViewUrl;

  AdsData({
    this.appOpenVisible,
    this.backPriority,
    this.facebookBannerId1,
    this.facebookBannerId2,
    this.facebookBannerId3,
    this.facebookBannerId4,
    this.facebookBannerId5,
    this.facebookBannerVisible,
    this.facebookInterstitial1,
    this.facebookInterstitial2,
    this.facebookInterstitial3,
    this.facebookInterstitial4,
    this.facebookInterstitial5,
    this.facebookNativeId1,
    this.facebookNativeId2,
    this.facebookNativeId3,
    this.facebookNativeId4,
    this.facebookNativeId5,
    this.facebookNativeVisible,
    this.googleAppOpenAd,
    this.googleBannerId1,
    this.googleBannerId2,
    this.googleBannerId3,
    this.googleBannerId4,
    this.googleBannerId5,
    this.googleInterstitial1,
    this.googleInterstitial2,
    this.googleInterstitial3,
    this.googleInterstitial4,
    this.googleInterstitial5,
    this.googleNativeId1,
    this.googleNativeId2,
    this.googleNativeId3,
    this.googleNativeId4,
    this.googleNativeId5,
    this.isBackAdd,
    this.isBackFacebookGoogleBoth,
    this.isBannerGoogleFacebookBoth,
    this.isComingSoon,
    this.isFacebookFailShowGoogle,
    this.isFacebookGoogleBoth,
    this.isGoogleFailShowFacebook,
    this.isNativeFacebookGoogleBoth,
    this.isUpdateApp,
    this.isIntro,
    this.priority,
    this.showAd,
    this.toBeClicked,
    this.totalIntro,
    this.updateUrl,
    this.isOpenWebView,
    this.isAllScreenAppOpenOn,
    this.webViewUrl,
  });

  factory AdsData.fromJson(Map<String, dynamic> json) => AdsData(
    appOpenVisible: json["appOpenVisible"],
    backPriority: json["backPriority"],
    facebookBannerId1: json["facebookBannerId1"],
    facebookBannerId2: json["facebookBannerId2"],
    facebookBannerId3: json["facebookBannerId3"],
    facebookBannerId4: json["facebookBannerId4"],
    facebookBannerId5: json["facebookBannerId5"],
    facebookBannerVisible: json["facebookBannerVisible"],
    facebookInterstitial1: json["facebookInterstitial1"],
    facebookInterstitial2: json["facebookInterstitial2"],
    facebookInterstitial3: json["facebookInterstitial3"],
    facebookInterstitial4: json["facebookInterstitial4"],
    facebookInterstitial5: json["facebookInterstitial5"],
    facebookNativeId1: json["facebookNativeId1"],
    facebookNativeId2: json["facebookNativeId2"],
    facebookNativeId3: json["facebookNativeId3"],
    facebookNativeId4: json["facebookNativeId4"],
    facebookNativeId5: json["facebookNativeId5"],
    facebookNativeVisible: json["facebookNativeVisible"],
    googleAppOpenAd: json["googleAppOpenAd"],
    googleBannerId1: json["googleBannerId1"],
    googleBannerId2: json["googleBannerId2"],
    googleBannerId3: json["googleBannerId3"],
    googleBannerId4: json["googleBannerId4"],
    googleBannerId5: json["googleBannerId5"],
    googleInterstitial1: json["googleInterstitial1"],
    googleInterstitial2: json["googleInterstitial2"],
    googleInterstitial3: json["googleInterstitial3"],
    googleInterstitial4: json["googleInterstitial4"],
    googleInterstitial5: json["googleInterstitial5"],
    googleNativeId1: json["googleNativeId1"],
    googleNativeId2: json["googleNativeId2"],
    googleNativeId3: json["googleNativeId3"],
    googleNativeId4: json["googleNativeId4"],
    googleNativeId5: json["googleNativeId5"],
    isBackAdd: json["isBackAdd"],
    isBackFacebookGoogleBoth: json["isBackFacebookGoogleBoth"],
    isBannerGoogleFacebookBoth: json["isBannerGoogleFacebookBoth"],
    isComingSoon: json["isComingSoon"],
    isFacebookFailShowGoogle: json["isFacebookFailShowGoogle"],
    isFacebookGoogleBoth: json["isFacebookGoogleBoth"],
    isGoogleFailShowFacebook: json["isGoogleFailShowFacebook"],
    isNativeFacebookGoogleBoth: json["isNativeFacebookGoogleBoth"],
    isUpdateApp: json["isUpdateApp"],
    isIntro: json["isIntro"],
    priority: json["priority"],
    showAd: json["showAd"],
    toBeClicked: json["toBeClicked"],
    totalIntro: json["totalIntro"],
    updateUrl: json["updateUrl"],
    isOpenWebView: json["isOpenWebView"],
    isAllScreenAppOpenOn: json["isAllScreenAppOpenOn"],
    webViewUrl: json["webViewUrl"],
  );

  Map<String, dynamic> toJson() => {
    "appOpenVisible": appOpenVisible,
    "backPriority": backPriority,
    "facebookBannerId1": facebookBannerId1,
    "facebookBannerId2": facebookBannerId2,
    "facebookBannerId3": facebookBannerId3,
    "facebookBannerId4": facebookBannerId4,
    "facebookBannerId5": facebookBannerId5,
    "facebookBannerVisible": facebookBannerVisible,
    "facebookInterstitial1": facebookInterstitial1,
    "facebookInterstitial2": facebookInterstitial2,
    "facebookInterstitial3": facebookInterstitial3,
    "facebookInterstitial4": facebookInterstitial4,
    "facebookInterstitial5": facebookInterstitial5,
    "facebookNativeId1": facebookNativeId1,
    "facebookNativeId2": facebookNativeId2,
    "facebookNativeId3": facebookNativeId3,
    "facebookNativeId4": facebookNativeId4,
    "facebookNativeId5": facebookNativeId5,
    "facebookNativeVisible": facebookNativeVisible,
    "googleAppOpenAd": googleAppOpenAd,
    "googleBannerId1": googleBannerId1,
    "googleBannerId2": googleBannerId2,
    "googleBannerId3": googleBannerId3,
    "googleBannerId4": googleBannerId4,
    "googleBannerId5": googleBannerId5,
    "googleInterstitial1": googleInterstitial1,
    "googleInterstitial2": googleInterstitial2,
    "googleInterstitial3": googleInterstitial3,
    "googleInterstitial4": googleInterstitial4,
    "googleInterstitial5": googleInterstitial5,
    "googleNativeId1": googleNativeId1,
    "googleNativeId2": googleNativeId2,
    "googleNativeId3": googleNativeId3,
    "googleNativeId4": googleNativeId4,
    "googleNativeId5": googleNativeId5,
    "isBackAdd": isBackAdd,
    "isBackFacebookGoogleBoth": isBackFacebookGoogleBoth,
    "isBannerGoogleFacebookBoth": isBannerGoogleFacebookBoth,
    "isComingSoon": isComingSoon,
    "isFacebookFailShowGoogle": isFacebookFailShowGoogle,
    "isFacebookGoogleBoth": isFacebookGoogleBoth,
    "isGoogleFailShowFacebook": isGoogleFailShowFacebook,
    "isNativeFacebookGoogleBoth": isNativeFacebookGoogleBoth,
    "isUpdateApp": isUpdateApp,
    "isIntro": isIntro,
    "priority": priority,
    "showAd": showAd,
    "toBeClicked": toBeClicked,
    "totalIntro": totalIntro,
    "updateUrl": updateUrl,
    "isOpenWebView": isOpenWebView,
    "isAllScreenAppOpenOn": isAllScreenAppOpenOn,
    "webViewUrl": webViewUrl,
  };
}
