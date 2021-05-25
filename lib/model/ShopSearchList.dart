// To parse this JSON data, do
//
//     final shopSearchList = shopSearchListFromJson(jsonString);

import 'dart:convert';

List<ShopSearchList> shopSearchListFromJson(String str) => List<ShopSearchList>.from(json.decode(str).map((x) => ShopSearchList.fromJson(x)));

String shopSearchListToJson(List<ShopSearchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopSearchList {
  ShopSearchList({
    this.id,
    this.distance,
    this.name,
    this.nameBy,
    this.location,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.defaultOpening,
    this.defaultClosing,
  });

  int id;
  int distance;
  String name;
  String nameBy;
  String location;
  String latitude;
  String longitude;
  String profileImage;
  String defaultOpening;
  String defaultClosing;

  factory ShopSearchList.fromJson(Map<String, dynamic> json) => ShopSearchList(
    id: json["id"],
    distance: json["distance"],
    name: json["name"],
    nameBy: json["name_by"],
    location: json["location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    profileImage: json["profile_image"],
    defaultOpening: json["default_opening"],
    defaultClosing: json["default_closing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "distance": distance,
    "name": name,
    "name_by": nameBy,
    "location": location,
    "latitude": latitude,
    "longitude": longitude,
    "profile_image": profileImage,
    "default_opening": defaultOpening,
    "default_closing": defaultClosing,
  };
}
