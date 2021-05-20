// To parse this JSON data, do
//
//     final shopSearchList = shopSearchListFromJson(jsonString);

import 'dart:convert';

List<ShopSearchList> shopSearchListFromJson(String str) => List<ShopSearchList>.from(json.decode(str).map((x) => ShopSearchList.fromJson(x)));

String shopSearchListToJson(List<ShopSearchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopSearchList {
  ShopSearchList({
    this.id,
    this.name,
    this.nameBy,
    this.about,
    this.location,
    this.website,
    this.phoneNumber,
    this.profileImage,
    this.defaultOpening,
    this.defaultClosing,
  });

  int id;
  String name;
  String nameBy;
  String about;
  String location;
  String website;
  int phoneNumber;
  String profileImage;
  String defaultOpening;
  String defaultClosing;

  factory ShopSearchList.fromJson(Map<String, dynamic> json) => ShopSearchList(
    id: json["id"],
    name: json["name"],
    nameBy: json["name_by"],
    about: json["about"],
    location: json["location"],
    website: json["website"],
    phoneNumber: json["phone_number"],
    profileImage: json["profile_image"],
    defaultOpening: json["default_opening"],
    defaultClosing: json["default_closing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_by": nameBy,
    "about": about,
    "location": location,
    "website": website,
    "phone_number": phoneNumber,
    "profile_image": profileImage,
    "default_opening": defaultOpening,
    "default_closing": defaultClosing,
  };
}
