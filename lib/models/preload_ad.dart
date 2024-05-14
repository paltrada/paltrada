// To parse this JSON data, do
//
//     final preloadAd = preloadAdFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

PreloadAd preloadAdFromJson(String str) => PreloadAd.fromJson(json.decode(str));

String preloadAdToJson(PreloadAd data) => json.encode(data.toJson());

class PreloadAd {
  Widget? facebookNative;
  Widget? facebookBanner;
  Widget? googleNative;
  Widget? googleBanner;

  PreloadAd({
    this.facebookNative,
    this.facebookBanner,
    this.googleNative,
    this.googleBanner,
  });

  factory PreloadAd.fromJson(Map<String, dynamic> json) => PreloadAd(
    facebookNative: json["facebookNative"],
    facebookBanner: json["facebookBanner"],
    googleNative: json["googleNative"],
    googleBanner: json["googleBanner"],
  );

  Map<String, dynamic> toJson() => {
    "facebookNative": facebookNative,
    "facebookBanner": facebookBanner,
    "googleNative": googleNative,
    "googleBanner": googleBanner,
  };
}
