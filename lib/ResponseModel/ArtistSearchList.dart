// To parse this JSON data, do
//
//     final artistSearchList = artistSearchListFromJson(jsonString);

import 'dart:convert';

List<ArtistSearchList> artistSearchListFromJson(String str) => List<ArtistSearchList>.from(json.decode(str).map((x) => ArtistSearchList.fromJson(x)));

String artistSearchListToJson(List<ArtistSearchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistSearchList {
  ArtistSearchList({
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

  factory ArtistSearchList.fromJson(Map<String, dynamic> json) => ArtistSearchList(
    id: json["id"],
    name: json["name"],
    nameBy: json["name_by"],
    about: json["about"],
    location: json["location"],
    website: json["website"] == null ? null : json["website"],
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
    "website": website == null ? null : website,
    "phone_number": phoneNumber,
    "profile_image": profileImage,
    "default_opening": defaultOpening,
    "default_closing": defaultClosing,
  };
}
