// To parse this JSON data, do
//
//     final language = languageFromJson(jsonString);

import 'dart:convert';

Lang languageFromJson(String str) => Lang.fromJson(json.decode(str));

String languageToJson(Lang data) => json.encode(data.toJson());

class Lang {
  final String? language;
  final double? rate;

  Lang({
    this.language,
    this.rate,
  });

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
    language: json["language"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "rate": rate,
  };
}
