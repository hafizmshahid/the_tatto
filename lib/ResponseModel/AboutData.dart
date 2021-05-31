// To parse this JSON data, do
//
//     final aboutData = aboutDataFromJson(jsonString);

import 'dart:convert';

List<AboutData> aboutDataFromJson(String str) => List<AboutData>.from(json.decode(str).map((x) => AboutData.fromJson(x)));

String aboutDataToJson(List<AboutData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutData {
  AboutData({
    this.id,
    this.shopArtistNameDetail,
    this.styleDetail,
    this.servicesDetail,
    this.imageDetail,
    this.distance,
    this.about,
    this.website,
    this.phoneNumber,
    this.mondayOpeningTime,
    this.mondayCLoseTime,
    this.tuesdayOpeningTime,
    this.tuesdayCLoseTime,
    this.wednesdayOpeningTime,
    this.wednesdayCLoseTime,
    this.thursdayOpeningTime,
    this.thursdayCLoseTime,
    this.fridayOpeningTime,
    this.fridayCLoseTime,
    this.saturdayOpeningTime,
    this.saturdayCLoseTime,
    this.sundayOpeningTime,
    this.sundayCLoseTime,
    this.shopArtistName,
    this.firstStyle,
    this.secondStyle,
    this.thirdStyle,
    this.fourStyle,
    this.fiveStyle,
    this.shopImage,
    this.firstServices,
    this.secondServices,
    this.thirdServices,
    this.fourServices,
    this.fiveServices,
  });

  int id;
  ShopArtistNameDetail shopArtistNameDetail;
  List<StyleDetail> styleDetail;
  List<ServicesDetail> servicesDetail;
  List<ImageDetail> imageDetail;
  double distance;
  String about;
  String website;
  int phoneNumber;
  String mondayOpeningTime;
  String mondayCLoseTime;
  String tuesdayOpeningTime;
  String tuesdayCLoseTime;
  String wednesdayOpeningTime;
  String wednesdayCLoseTime;
  String thursdayOpeningTime;
  String thursdayCLoseTime;
  String fridayOpeningTime;
  String fridayCLoseTime;
  String saturdayOpeningTime;
  String saturdayCLoseTime;
  String sundayOpeningTime;
  String sundayCLoseTime;
  int shopArtistName;
  int firstStyle;
  int secondStyle;
  int thirdStyle;
  int fourStyle;
  int fiveStyle;
  int shopImage;
  int firstServices;
  int secondServices;
  int thirdServices;
  int fourServices;
  int fiveServices;

  factory AboutData.fromJson(Map<String, dynamic> json) => AboutData(
    id: json["id"],
    shopArtistNameDetail: ShopArtistNameDetail.fromJson(json["shop_artist_name_detail"]),
    styleDetail: List<StyleDetail>.from(json["style_detail"].map((x) => StyleDetail.fromJson(x))),
    servicesDetail: List<ServicesDetail>.from(json["services_detail"].map((x) => ServicesDetail.fromJson(x))),
    imageDetail: List<ImageDetail>.from(json["image_detail"].map((x) => ImageDetail.fromJson(x))),
    distance: json["distance"].toDouble(),
    about: json["about"],
    website: json["website"],
    phoneNumber: json["phone_number"],
    mondayOpeningTime: json["Monday_Opening_time"],
    mondayCLoseTime: json["Monday_CLose_time"],
    tuesdayOpeningTime: json["Tuesday_Opening_time"],
    tuesdayCLoseTime: json["Tuesday_CLose_time"],
    wednesdayOpeningTime: json["Wednesday_Opening_time"],
    wednesdayCLoseTime: json["Wednesday_CLose_time"],
    thursdayOpeningTime: json["Thursday_Opening_time"],
    thursdayCLoseTime: json["Thursday_CLose_time"],
    fridayOpeningTime: json["Friday_Opening_time"],
    fridayCLoseTime: json["Friday_CLose_time"],
    saturdayOpeningTime: json["Saturday_Opening_time"],
    saturdayCLoseTime: json["Saturday_CLose_time"],
    sundayOpeningTime: json["Sunday_Opening_time"],
    sundayCLoseTime: json["Sunday_CLose_time"],
    shopArtistName: json["shop_artist_name"],
    firstStyle: json["first_style"],
    secondStyle: json["second_style"],
    thirdStyle: json["third_style"],
    fourStyle: json["four_style"],
    fiveStyle: json["five_style"],
    shopImage: json["shop_image"],
    firstServices: json["first_services"],
    secondServices: json["second_services"],
    thirdServices: json["third_services"],
    fourServices: json["four_services"],
    fiveServices: json["five_services"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_artist_name_detail": shopArtistNameDetail.toJson(),
    "style_detail": List<dynamic>.from(styleDetail.map((x) => x.toJson())),
    "services_detail": List<dynamic>.from(servicesDetail.map((x) => x.toJson())),
    "image_detail": List<dynamic>.from(imageDetail.map((x) => x.toJson())),
    "distance": distance,
    "about": about,
    "website": website,
    "phone_number": phoneNumber,
    "Monday_Opening_time": mondayOpeningTime,
    "Monday_CLose_time": mondayCLoseTime,
    "Tuesday_Opening_time": tuesdayOpeningTime,
    "Tuesday_CLose_time": tuesdayCLoseTime,
    "Wednesday_Opening_time": wednesdayOpeningTime,
    "Wednesday_CLose_time": wednesdayCLoseTime,
    "Thursday_Opening_time": thursdayOpeningTime,
    "Thursday_CLose_time": thursdayCLoseTime,
    "Friday_Opening_time": fridayOpeningTime,
    "Friday_CLose_time": fridayCLoseTime,
    "Saturday_Opening_time": saturdayOpeningTime,
    "Saturday_CLose_time": saturdayCLoseTime,
    "Sunday_Opening_time": sundayOpeningTime,
    "Sunday_CLose_time": sundayCLoseTime,
    "shop_artist_name": shopArtistName,
    "first_style": firstStyle,
    "second_style": secondStyle,
    "third_style": thirdStyle,
    "four_style": fourStyle,
    "five_style": fiveStyle,
    "shop_image": shopImage,
    "first_services": firstServices,
    "second_services": secondServices,
    "third_services": thirdServices,
    "four_services": fourServices,
    "five_services": fiveServices,
  };
}

class ImageDetail {
  ImageDetail({
    this.shopImage,
  });

  StyleDetail shopImage;

  factory ImageDetail.fromJson(Map<String, dynamic> json) => ImageDetail(
    shopImage: StyleDetail.fromJson(json["shop_image"]),
  );

  Map<String, dynamic> toJson() => {
    "shop_image": shopImage.toJson(),
  };
}

class StyleDetail {
  StyleDetail({
    this.styleName,
    this.profileImage,
    this.isActivate,
    this.id,
  });

  String styleName;
  String profileImage;
  bool isActivate;
  int id;

  factory StyleDetail.fromJson(Map<String, dynamic> json) => StyleDetail(
    styleName: json["style_name"],
    profileImage: json["Profile_image"] == null ? null : json["Profile_image"],
    isActivate: json["is_activate"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "style_name": styleName,
    "Profile_image": profileImage == null ? null : profileImage,
    "is_activate": isActivate,
    "id": id == null ? null : id,
  };
}

class ServicesDetail {
  ServicesDetail({
    this.id,
    this.servicesName,
    this.servicesPrice,
    this.servicesImage,
    this.shopArtistName,
  });

  int id;
  String servicesName;
  double servicesPrice;
  String servicesImage;
  int shopArtistName;

  factory ServicesDetail.fromJson(Map<String, dynamic> json) => ServicesDetail(
    id: json["id"],
    servicesName: json["services_name"],
    servicesPrice: json["Services_price"],
    servicesImage: json["services_image"],
    shopArtistName: json["shop_artist_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "services_name": servicesName,
    "Services_price": servicesPrice,
    "services_image": servicesImage,
    "shop_artist_name": shopArtistName,
  };
}

class ShopArtistNameDetail {
  ShopArtistNameDetail({
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
  dynamic distance;
  String name;
  String nameBy;
  String location;
  String latitude;
  String longitude;
  String profileImage;
  String defaultOpening;
  String defaultClosing;

  factory ShopArtistNameDetail.fromJson(Map<String, dynamic> json) => ShopArtistNameDetail(
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
