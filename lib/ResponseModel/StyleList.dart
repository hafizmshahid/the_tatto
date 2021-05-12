// To parse this JSON data, do
//
//     final styleList = styleListFromJson(jsonString);

import 'dart:convert';

List<StyleList> styleListFromJson(String str) => List<StyleList>.from(json.decode(str).map((x) => StyleList.fromJson(x)));

String styleListToJson(List<StyleList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StyleList {
  StyleList({
    this.id,
    this.styleName,
    this.categoryBy,
    this.profileImage,
    this.isActivate,
  });

  int id;
  String styleName;
  String categoryBy;
  String profileImage;
  bool isActivate;

  factory StyleList.fromJson(Map<String, dynamic> json) => StyleList(
    id: json["id"],
    styleName: json["style_name"],
    categoryBy: json["Category_by"],
    profileImage: json["Profile_image"],
    isActivate: json["is_activate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "style_name": styleName,
    "Category_by": categoryBy,
    "Profile_image": profileImage,
    "is_activate": isActivate,
  };
}
