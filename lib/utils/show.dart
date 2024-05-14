import 'package:get/get.dart';

import '../advertisement/constant.dart';

void show(String route, {dynamic argument}){
  clicked++;
  print("You Clicked $clicked Time And IsClicked is $isClicked");
  if(clicked == toBeClicked){
    clicked = 0;
    isClicked = true;
  }else{
    isClicked = false;
  }
  isGoogleBannerLoaded.value = false;
  isGoogleNativeLoaded.value  = false;
  isFacebookBannerLoaded.value = false;
  Get.toNamed(route,arguments: argument);
}

void showOff(String route,{argument}){
  clicked++;
  print("You Clicked $clicked Time And IsClicked is $isClicked");
  if(clicked == toBeClicked){
    clicked = 0;
    isClicked = true;
  }else{
    isClicked = false;
  }
  isGoogleBannerLoaded.value = false;
  isGoogleNativeLoaded.value  = false;
  isFacebookBannerLoaded.value = false;
  Get.offAndToNamed(route,arguments: argument);
}

void showOffAll(String route,{argument}){
  clicked++;
  print("You Clicked $clicked Time And IsClicked is $isClicked");
  if(clicked == toBeClicked){
    clicked = 0;
    isClicked = true;
  }else{
    isClicked = false;
  }
  isGoogleBannerLoaded.value = false;
  isGoogleNativeLoaded.value  = false;
  isFacebookBannerLoaded.value = false;
  Get.offAllNamed(route,arguments: argument);
}