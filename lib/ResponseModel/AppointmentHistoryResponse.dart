// To parse this JSON data, do
//
//     final appointmentHistoryResponse = appointmentHistoryResponseFromJson(jsonString);

import 'dart:convert';

List<AppointmentHistoryResponse> appointmentHistoryResponseFromJson(String str) => List<AppointmentHistoryResponse>.from(json.decode(str).map((x) => AppointmentHistoryResponse.fromJson(x)));

String appointmentHistoryResponseToJson(List<AppointmentHistoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentHistoryResponse {
  AppointmentHistoryResponse({
    this.id,
    this.servicesDetail,
    this.appointmentDate,
    this.amount,
    this.status,
    this.firstServices,
    this.secondServices,
    this.thirdServices,
    this.fourServices,
    this.fiveServices,
    this.user,
  });

  int id;
  List<ServicesDetail> servicesDetail;
  DateTime appointmentDate;
  double amount;
  String status;
  int firstServices;
  int secondServices;
  int thirdServices;
  int fourServices;
  int fiveServices;
  int user;

  factory AppointmentHistoryResponse.fromJson(Map<String, dynamic> json) => AppointmentHistoryResponse(
    id: json["id"],
    servicesDetail: List<ServicesDetail>.from(json["services_detail"].map((x) => ServicesDetail.fromJson(x))),
    appointmentDate: DateTime.parse(json["appointment_date"]),
    amount: json["amount"],
    status: json["status"],
    firstServices: json["first_services"],
    secondServices: json["second_services"],
    thirdServices: json["third_services"],
    fourServices: json["four_services"],
    fiveServices: json["five_services"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "services_detail": List<dynamic>.from(servicesDetail.map((x) => x.toJson())),
    "appointment_date": appointmentDate.toIso8601String(),
    "amount": amount,
    "status": status,
    "first_services": firstServices,
    "second_services": secondServices,
    "third_services": thirdServices,
    "four_services": fourServices,
    "five_services": fiveServices,
    "user": user,
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
  ServicesName servicesName;
  int servicesPrice;
  ServicesImage servicesImage;
  int shopArtistName;

  factory ServicesDetail.fromJson(Map<String, dynamic> json) => ServicesDetail(
    id: json["id"],
    servicesName: servicesNameValues.map[json["services_name"]],
    servicesPrice: json["Services_price"],
    servicesImage: servicesImageValues.map[json["services_image"]],
    shopArtistName: json["shop_artist_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "services_name": servicesNameValues.reverse[servicesName],
    "Services_price": servicesPrice,
    "services_image": servicesImageValues.reverse[servicesImage],
    "shop_artist_name": shopArtistName,
  };
}

enum ServicesImage { MEDIA_IMAGES_SERVICES_IMAGES_PROFILE_JPG, MEDIA_IMAGES_SERVICES_IMAGES_PROFILE_RW5_B_VC4_JPG }

final servicesImageValues = EnumValues({
  "/media/images/ServicesImages/profile.jpg": ServicesImage.MEDIA_IMAGES_SERVICES_IMAGES_PROFILE_JPG,
  "/media/images/ServicesImages/profile_rw5bVc4.jpg": ServicesImage.MEDIA_IMAGES_SERVICES_IMAGES_PROFILE_RW5_B_VC4_JPG
});

enum ServicesName { TATTOO_STYLE, ANERICAN }

final servicesNameValues = EnumValues({
  "anerican": ServicesName.ANERICAN,
  "tattoo style": ServicesName.TATTOO_STYLE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
