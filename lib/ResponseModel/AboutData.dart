// To parse this JSON data, do
//
//     final aboutData = aboutDataFromJson(jsonString);

import 'dart:convert';

List<AboutData> aboutDataFromJson(String str) => List<AboutData>.from(json.decode(str).map((x) => AboutData.fromJson(x)));

String aboutDataToJson(List<AboutData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutData {
  AboutData({
    this.id,
    this.firstStyleDetail,
    this.secondStyleDetail,
    this.thirdStyleDetail,
    this.fourStyleDetail,
    this.fiveStyleDetail,
    this.shopImageDetail,
    this.firstServicesDetail,
    this.secondServicesDetail,
    this.thirdServicesDetail,
    this.fourServicesDetail,
    this.fiveServicesDetail,
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
  StyleDetail firstStyleDetail;
  StyleDetail secondStyleDetail;
  StyleDetail thirdStyleDetail;
  StyleDetail fourStyleDetail;
  StyleDetail fiveStyleDetail;
  ShopImageDetail shopImageDetail;
  ServicesDetail firstServicesDetail;
  ServicesDetail secondServicesDetail;
  ServicesDetail thirdServicesDetail;
  ServicesDetail fourServicesDetail;
  ServicesDetail fiveServicesDetail;
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
    firstStyleDetail: StyleDetail.fromJson(json["first_style_detail"])  ,
    secondStyleDetail: StyleDetail.fromJson(json["second_style_detail"]),
    thirdStyleDetail: StyleDetail.fromJson(json["third_style_detail"]),
    fourStyleDetail: StyleDetail.fromJson(json["four_style_detail"]),
    fiveStyleDetail: StyleDetail.fromJson(json["five_style_detail"]),
    shopImageDetail: ShopImageDetail.fromJson(json["shop_image_detail"]),
    firstServicesDetail: ServicesDetail.fromJson(json["first_services_detail"]),
    secondServicesDetail: ServicesDetail.fromJson(json["second_services_detail"]),
    thirdServicesDetail: ServicesDetail.fromJson(json["third_services_detail"]),
    fourServicesDetail: ServicesDetail.fromJson(json["four_services_detail"]),
    fiveServicesDetail: ServicesDetail.fromJson(json["five_services_detail"]),
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
    "first_style_detail": firstStyleDetail.toJson(),
    "second_style_detail": secondStyleDetail.toJson(),
    "third_style_detail": thirdStyleDetail.toJson(),
    "four_style_detail": fourStyleDetail.toJson(),
    "five_style_detail": fiveStyleDetail.toJson(),
    "shop_image_detail": shopImageDetail.toJson(),
    "first_services_detail": firstServicesDetail.toJson(),
    "second_services_detail": secondServicesDetail.toJson(),
    "third_services_detail": thirdServicesDetail.toJson(),
    "four_services_detail": fourServicesDetail.toJson(),
    "five_services_detail": fiveServicesDetail.toJson(),
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
  int servicesPrice;
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

class StyleDetail {
  StyleDetail({
    this.id,
    this.styleName,
    this.profileImage,
    this.isActivate,
  });

  int id;
  String styleName;
  String profileImage;
  bool isActivate;

  factory StyleDetail.fromJson(Map<String, dynamic> json) => StyleDetail(
    id: json["id"],
    styleName: json["style_name"],
    profileImage: json["Profile_image"],
    isActivate: json["is_activate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "style_name": styleName,
    "Profile_image": profileImage,
    "is_activate": isActivate,
  };
}

class ShopImageDetail {
  ShopImageDetail({
    this.id,
    this.firstImage,
    this.secondImage,
    this.thirdImage,
    this.fourthImage,
    this.fifthImage,
    this.shopArtistName,
  });

  int id;
  String firstImage;
  String secondImage;
  String thirdImage;
  String fourthImage;
  String fifthImage;
  int shopArtistName;

  factory ShopImageDetail.fromJson(Map<String, dynamic> json) => ShopImageDetail(
    id: json["id"],
    firstImage: json["First_Image"],
    secondImage: json["Second_Image"],
    thirdImage: json["Third_Image"],
    fourthImage: json["Fourth_Image"],
    fifthImage: json["Fifth_Image"],
    shopArtistName: json["shop_artist_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "First_Image": firstImage,
    "Second_Image": secondImage,
    "Third_Image": thirdImage,
    "Fourth_Image": fourthImage,
    "Fifth_Image": fifthImage,
    "shop_artist_name": shopArtistName,
  };
}
