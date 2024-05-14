import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  final String? language;
  bool? isSelect;

  LanguageModel({
    this.language,
    this.isSelect,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
    language: json["language"],
    isSelect: json["isSelect"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "isSelect": isSelect,
  };
}
