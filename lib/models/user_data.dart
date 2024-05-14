// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String? name;
  String? society;
  String? areaName;
  String? city;
  String? pincode;
  String? email;
  String? number;
  String? objective;
  String? technicalSkills;
  String? hobbies;
  String? experience;
  String? degree;
  String? collageName;
  String? pgDegree;
  String? pgCollageName;
  String? the12ThSchoolName;
  String? the10ThSchoolName;
  String? cgpaSgpa;
  String? pgCgpaSgpa;
  String? the12ThPercentage;
  String? the10ThPercentage;

  UserData({
    this.name,
    this.society,
    this.areaName,
    this.city,
    this.pincode,
    this.email,
    this.number,
    this.objective,
    this.technicalSkills,
    this.hobbies,
    this.experience,
    this.degree,
    this.collageName,
    this.pgDegree,
    this.pgCollageName,
    this.the12ThSchoolName,
    this.the10ThSchoolName,
    this.cgpaSgpa,
    this.pgCgpaSgpa,
    this.the12ThPercentage,
    this.the10ThPercentage,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    name: json["name"],
    society: json["society"],
    areaName: json["areaName"],
    city: json["city"],
    pincode: json["pincode"],
    email: json["email"],
    number: json["number"],
    objective: json["objective"],
    technicalSkills: json["technicalSkills"],
    hobbies: json["hobbies"],
    experience: json["experience"],
    degree: json["degree"],
    collageName: json["collageName"],
    pgDegree: json["pgDegree"],
    pgCollageName: json["pgCollageName"],
    the12ThSchoolName: json["12thSchoolName"],
    the10ThSchoolName: json["10thSchoolName"],
    cgpaSgpa: json["cgpa/sgpa"],
    pgCgpaSgpa: json["pgcgpa/pgsgpa"],
    the12ThPercentage: json["12thPercentage"],
    the10ThPercentage: json["10thPercentage"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "society": society,
    "areaName": areaName,
    "city": city,
    "pincode": pincode,
    "email": email,
    "number": number,
    "objective": objective,
    "technicalSkills": technicalSkills,
    "hobbies": hobbies,
    "experience": experience,
    "degree": degree,
    "collageName": collageName,
    "pgDegree": pgDegree,
    "pgCollageName": pgCollageName,
    "12thSchoolName": the12ThSchoolName,
    "10thSchoolName": the10ThSchoolName,
    "cgpa/sgpa": cgpaSgpa,
    "pgcgpa/pgsgpa": pgCgpaSgpa,
    "12thPercentage": the12ThPercentage,
    "10thPercentage": the10ThPercentage,
  };
}
