// To parse this JSON data, do
//
//     final aboutData = aboutDataFromJson(jsonString);

import 'dart:convert';

List<AboutData> aboutDataFromJson(String str) => List<AboutData>.from(json.decode(str).map((x) => AboutData.fromJson(x)));

String aboutDataToJson(List<AboutData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutData {
  AboutData({
    this.id,
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
  String about;
  String website;
  int phoneNumber;
  dynamic mondayOpeningTime;
  dynamic mondayCLoseTime;
  dynamic tuesdayOpeningTime;
  dynamic tuesdayCLoseTime;
  String wednesdayOpeningTime;
  String wednesdayCLoseTime;
  String thursdayOpeningTime;
  String thursdayCLoseTime;
  dynamic fridayOpeningTime;
  dynamic fridayCLoseTime;
  dynamic saturdayOpeningTime;
  dynamic saturdayCLoseTime;
  dynamic sundayOpeningTime;
  dynamic sundayCLoseTime;
  int shopArtistName;
  int firstStyle;
  int secondStyle;
  int thirdStyle;
  int fourStyle;
  dynamic fiveStyle;
  int shopImage;
  int firstServices;
  int secondServices;
  dynamic thirdServices;
  dynamic fourServices;
  dynamic fiveServices;

  factory AboutData.fromJson(Map<String, dynamic> json) => AboutData(
    id: json["id"],
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
