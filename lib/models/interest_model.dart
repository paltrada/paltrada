// To parse this JSON data, do
//
//     final interestModel = interestModelFromJson(jsonString);

import 'dart:convert';

InterestModel interestModelFromJson(String str) => InterestModel.fromJson(json.decode(str));

String interestModelToJson(InterestModel data) => json.encode(data.toJson());

class InterestModel {
  final String? interest;
  bool? isSelect;

  InterestModel({
    this.interest,
    this.isSelect,
  });

  factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
    interest: json["interest"],
    isSelect: json["isSelect"],
  );

  Map<String, dynamic> toJson() => {
    "interest": interest,
    "isSelect": isSelect,
  };
}
