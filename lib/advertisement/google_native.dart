import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';

import 'constant.dart';


class NativeContainer extends StatefulWidget {
  const NativeContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<NativeContainer> createState() => _NativeContainerState();
}

class _NativeContainerState extends State<NativeContainer> {
  bool isLoading = false;
  NativeAd? nativeAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("nativeGoogle");
    String currentAdId = "";
    if(googleNativeCurrentId == 1){
      currentAdId = googleNativeId1;
      log("Current google native id 1");
      googleNativeCurrentId++;
    }else if(googleNativeCurrentId == 2){
      currentAdId = googleNativeId2;
      log("Current google native id 2");
      googleNativeCurrentId++;
    }else if(googleNativeCurrentId == 3){
      currentAdId = googleNativeId3;
      log("Current google native id 3");
      googleNativeCurrentId++;
    }else if(googleNativeCurrentId == 4){
      currentAdId = googleNativeId4;
      log("Current google native id 4");
      googleNativeCurrentId++;
    }else if(googleNativeCurrentId == 5){
      currentAdId = googleNativeId5;
      log("Current google native id 5");
      googleNativeCurrentId = 1;
    }
    nativeAd = NativeAd(
      adUnitId: currentAdId,
      factoryId: 'listTileMedium',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          log ('Native Ad is Loaded ---->$ad');
          isGoogleNativeLoaded.value = true;
          isNativeFacebookShowed.value = false;
          isLoading = true;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          isFacebookNativeFailed.value = false;
          log('Native Ad is Failed to Load ---->$error');
        },
      ),
      request: const AdRequest(),
    );
    nativeAd!.load();
  }

  @override
  void dispose() {
    nativeAd!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    log("ahead");
    log("$isGoogleNativeLoaded");
    return Center(
      child: Obx(
            () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.white,
          ),
          height: isGoogleNativeLoaded.value
              ? isLoading
              ? 300
              : 100
              : 0,
          // height: MediaQuery.of(widget.context).size.height / 3,
          // width: MediaQuery.of(widget.context).size.width / 1.05,
          child: isGoogleNativeLoaded.value
              ? isLoading
              ? AdWidget(ad: nativeAd!)
              : const SizedBox()
              : const SizedBox(),
        ),
      ),
    );
  }
}

class BannerContainer extends StatefulWidget {
  const BannerContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerContainer> createState() => _BannerContainerState();
}

class _BannerContainerState extends State<BannerContainer> {
  BannerAd? bannerAd;

  @override
  void initState() {
    super.initState();
    log("bannerGoogle");
    String currentAdId = "";
    if(googleBannerCurrentId == 1){
      currentAdId = googleBannerId1;
      log("Current google banner id 1");
      googleBannerCurrentId++;
    }else if(googleBannerCurrentId == 2){
      currentAdId = googleBannerId2;
      log("Current google banner id 2");
      googleBannerCurrentId++;
    }else if(googleBannerCurrentId == 3){
      currentAdId = googleBannerId3;
      log("Current google banner id 3");
      googleBannerCurrentId++;
    }else if(googleBannerCurrentId == 4){
      currentAdId = googleBannerId4;
      log("Current google banner id 4");
      googleBannerCurrentId++;
    }else if(googleBannerCurrentId == 5){
      currentAdId = googleBannerId5;
      log("Current google banner id 5");
      googleBannerCurrentId = 1;
    }
    bannerAd = BannerAd(
      size: AdSize.banner,
      // size: AdSize(width: 400, height: 100),
      adUnitId: currentAdId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          log('Banner Ad is Loaded ---->$ad');
          isGoogleBannerLoaded.value = true;
          isBannerFacebookShowed = false;
          // isLoading = true;
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          log('banner Ad is Failed to Load ---->$error');
        },
      ),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width,
      child: isGoogleBannerLoaded.value
          ? AdWidget(ad: bannerAd!)
          : const SizedBox(),
    ));
  }
}
