import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'constant.dart';

AppOpenAd? _appOpenAd;
NativeAd? nativeAd;
InterstitialAd? interstitialAd;

RxBool isOpenLoader = false.obs;

Future<void> googleAppOpenLoadAd() async {
  log("ander ghus gaya");
  try {
    log("app open ------ $appOpenVisible");
    if (appOpenVisible) {
      isOpenLoader.value = false;
      AppOpenAd.load(
        adUnitId: googleAppOpenAd,
        orientation: AppOpenAd.orientationPortrait,
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            log("AppOpenAd loaded");
            _appOpenAd = ad;
            _appOpenAd!.show();
            isOpenLoader.value = true;
          },
          onAdFailedToLoad: (error) {
            log('AppOpenAd failed to load: $error');
            // Handle the error.
            isOpenLoader.value = true;

          },
        ),
        request: const AdRequest(),
      );

    } else {
      isOpenLoader.value = true;

      // isOpenLoader = true;
    }
  } catch (e) {
    log("error => $e");
    isOpenLoader.value = true;

    // isOpenLoader = true;
  }
}

class MyGoogleAdsManager {
  static void createInterstitialAd() {
    log("InterGoogle");
    String currentAdId = "";
    if (googleInterCurrentId == 1) {
      currentAdId = googleInterstitial1;
      log("Current google inter id 1");
      googleInterCurrentId++;
    } else if (googleInterCurrentId == 2) {
      currentAdId = googleInterstitial2;
      log("Current google inter id 2");
      googleInterCurrentId++;
    } else if (googleInterCurrentId == 3) {
      currentAdId = googleInterstitial3;
      log("Current google inter id 3");
      googleInterCurrentId++;
    } else if (googleInterCurrentId == 4) {
      currentAdId = googleInterstitial4;
      log("Current google inter id 4");
      googleInterCurrentId++;
    } else if (googleInterCurrentId == 5) {
      currentAdId = googleInterstitial5;
      log("Current google inter id 5");
      googleInterCurrentId = 1;
    }
    InterstitialAd.load(
      adUnitId: currentAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          log("google inter loaded");
          interstitialAd = ad;
          interstitialAd!.setImmersiveMode(true);
          isGoogleIntShowed.value = false;
        },
        onAdFailedToLoad: (LoadAdError error) async {
          log("google inter failed $error");
          isGoogleIntFailed.value = true;
          interstitialAd = null;
          // createInterstitialAd();
        },
      ),
    );
  }

  static Future<void> showInterstitialAd() async {
    interstitialAd!.show();
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          log('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        log('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        interstitialAd = null;
        createInterstitialAd();

        isGoogleShowed.value = true;
        isFacebookShowed.value = false;
      },
      onAdFailedToShowFullScreenContent:
          (InterstitialAd ad, AdError error) async {
        log('$ad onAdFailedToShowFullScreenContent: $error');
        interstitialAd = null;
        ad.dispose();
        createInterstitialAd();
        isFacebookShowed.value = false;
      },
    );
  }

  static void initGoogleLoad() {
    if (interstitialAd == null) {
      createInterstitialAd();
    }
  }
}
